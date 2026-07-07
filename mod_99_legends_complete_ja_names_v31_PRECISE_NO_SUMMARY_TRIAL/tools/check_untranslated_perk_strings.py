#!/usr/bin/env python3
"""Untranslated perk UI string checker (Legends Complete JA).

Scans the Squirrel (.nut) source files of this localization mod pack for
PerkName / PerkDescription / Tooltip / GroupName assignments that still
contain un-translated English prose, so leftover strings can be found
without manually grepping through thousands of lines.

This is a *read-only* diagnostic script: it does not modify any files and
does not perform any runtime string replacement. It relies solely on the
Python standard library (no extra dependencies to install).

Usage:
    python3 tools/check_untranslated_perk_strings.py [path ...]

If no paths are given, it scans the whole mod pack directory that contains
this "tools" folder. Exits with status 1 if any suspected untranslated
strings are found (0 otherwise), so it can be wired into CI if desired.

Note: this scans for candidate strings only; it does not know which ones
are intentional. In particular, mod_nggh/config/perk_strings.nut has an
established, long-standing convention of leaving [color=...]SkillName[/color]
style in-line skill/stack/buff name references in English (e.g. "Hex",
"Charm", "Champion", "whipped"), even though the surrounding prose is
Japanese. Multi-word instances of that same convention (e.g. "Hex of
Suffering", "Realm of Burning Nightmares") will still be flagged here for
human review, but are not automatically bugs -- verify against the file's
existing style (and any canonical translation already used elsewhere in
this mod pack, e.g. in the zz_mod_99_legends_complete_ja_unified_preload.nut
nameByID table) before changing them.
"""

import os
import re
import sys

# Keys whose assigned string literals we care about.
KEY_PATTERN = re.compile(
    r"""
    (?:                                    # the identifier chain must reference one of:
        Const\.Strings\.PerkName
      | Const\.Strings\.PerkDescription
      | Const\.Strings\.GroupName
      | PerkDefObjects\[[^\]]*\]\.Tooltip
      | PerkDefObjects\[[^\]]*\]\.Description
      | PerkDefObjects\[[^\]]*\]\.Name
    )
    (?:\.\w+|\[[^\]]*\])?                  # optional trailing .Key or [key]
    \s*(?:<-|=|\+=)                        # assignment operator
    """,
    re.VERBOSE,
)

# A run of ASCII letters/space/basic punctuation that is long enough to look
# like an English sentence/phrase rather than a stray proper noun or code
# token (color names, const paths, %placeholders%, etc. are excluded because
# they are not made up of "word word word" patterns of this length).
ENGLISH_RUN = re.compile(r"[A-Za-z][A-Za-z0-9 ,.'\"!?;:_-]{14,}")

# Tokens that are technical/identifier-ish and should not by themselves cause
# a false positive even if long (color helper names, const paths, etc.).
SAFE_TOKEN_PATTERNS = [
    re.compile(r"^::?Const\."),
    re.compile(r"^this\.Const\."),
    re.compile(r"^color="),
    re.compile(r"^\[/?color"),
    re.compile(r"^\[/?u\]"),
    re.compile(r"^povPerk"),
]

STRING_LITERAL = re.compile(
    r'@"(?P<verbatim>(?:[^"]|"")*)"'   # Squirrel verbatim string @"..."
    r'|"(?P<normal>(?:\\.|[^"\\])*)"',  # normal escaped string "..."
    re.DOTALL,
)

SKIP_DIRS = {".git", "tools"}


def iter_nut_files(paths):
    for base in paths:
        if os.path.isfile(base):
            if base.endswith(".nut"):
                yield base
            continue
        for root, dirs, files in os.walk(base):
            dirs[:] = [d for d in dirs if d not in SKIP_DIRS]
            for name in files:
                if name.endswith(".nut") and not name.endswith(".nut.disabled"):
                    yield os.path.join(root, name)


def strip_line_comment(line):
    # Best-effort: drop a trailing "// ..." comment that is not inside a
    # string literal. This is a heuristic (not a full Squirrel parser), good
    # enough for scanning the perk string tables used by this mod pack.
    in_str = False
    quote = None
    i = 0
    while i < len(line) - 1:
        c = line[i]
        if in_str:
            if c == "\\" and quote == '"':
                i += 2
                continue
            if c == quote:
                in_str = False
        else:
            if c in ("'", '"'):
                in_str = True
                quote = c
            elif c == "/" and line[i + 1] == "/":
                return line[:i]
        i += 1
    return line


def find_english_in_string(literal):
    matches = []
    for m in ENGLISH_RUN.finditer(literal):
        text = m.group(0)
        if any(p.match(text) for p in SAFE_TOKEN_PATTERNS):
            continue
        # Require at least 3 "words" to avoid flagging single identifiers.
        words = re.findall(r"[A-Za-z']+", text)
        if len(words) < 3:
            continue
        matches.append(text.strip())
    return matches


def check_file(path):
    findings = []
    with open(path, encoding="utf-8", errors="replace") as f:
        text = f.read()

    # Remove line comments first (best-effort) so "// English notes" in
    # comments are not flagged as untranslated UI text.
    cleaned_lines = [strip_line_comment(l) for l in text.split("\n")]
    cleaned = "\n".join(cleaned_lines)

    # Reassemble statements: a "statement" starts at a KEY_PATTERN match and
    # runs until the next top-level ';' (simple heuristic, good enough for
    # this file's flat concatenation style: `X <- "a" + "b" + "c";`).
    for m in KEY_PATTERN.finditer(cleaned):
        start = m.start()
        end = cleaned.find(";", m.end())
        if end == -1:
            end = len(cleaned)
        stmt = cleaned[start:end + 1]
        line_no = cleaned.count("\n", 0, start) + 1

        literals = []
        for lm in STRING_LITERAL.finditer(stmt):
            literals.append(lm.group("verbatim") or lm.group("normal") or "")
        joined = " ".join(literals)

        for snippet in find_english_in_string(joined):
            findings.append((line_no, snippet))

    return findings


def main(argv):
    if argv:
        paths = argv
    else:
        mod_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        paths = [mod_root]

    total = 0
    for path in sorted(iter_nut_files(paths)):
        findings = check_file(path)
        if not findings:
            continue
        rel = os.path.relpath(path)
        for line_no, snippet in findings:
            print(f"{rel}:{line_no}: {snippet}")
            total += 1

    if total:
        print(f"\n{total} suspected untranslated string(s) found.")
        return 1

    print("No suspected untranslated perk UI strings found.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
