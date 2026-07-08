#!/usr/bin/env python3
"""Perk-definition-based Japanese coverage checker.

Scans /source perk definitions and verifies each defined perk has Japanese Name/
Description coverage in this mod pack (or in source/vanilla_translation), without
using grep-based untranslated sentence detection.
"""

from __future__ import annotations

import os
import re
import sys
from dataclasses import dataclass
from typing import Dict, Iterable, List, Optional, Set, Tuple

TARGET_TOKENS = (
    "perk",
    "perks",
    "perk_groups",
    "perk_strings",
    "skills",
    "actives",
    "passives",
    "traits",
    "strings",
    "tooltips",
)

JP_RE = re.compile(r"[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff]")

PERK_OBJECT_RE = re.compile(r"perkDefObjects\.push\s*\(\s*\{(.*?)\}\s*\)", re.DOTALL)
ID_RE = re.compile(r"\bID\s*=\s*\"([^\"]+)\"")
CONST_RE = re.compile(r"\bConst\s*=\s*\"([^\"]+)\"")
NAME_KEY_RE = re.compile(r"\bName\s*=\s*::Const\.Strings\.PerkName\.([A-Za-z0-9_]+)")
DESC_KEY_RE = re.compile(r"\bTooltip\s*=\s*::Const\.Strings\.PerkDescription\.([A-Za-z0-9_]+)")

PAIR_DOUBLE_RE = re.compile(r'\[\"([^\"]+)\"\]\s*=\s*\"([^\"]*)\"')
PAIR_VERBATIM_RE = re.compile(r'\[\"([^\"]+)\"\]\s*=\s*@\"((?:[^\"]|\"\")*)\"', re.DOTALL)
SETP_RE = re.compile(r'setP\(\"([^\"]+)\"\s*,\s*(?:@\"((?:[^\"]|\"\")*)\"|\"([^\"]*)\")', re.DOTALL)
PKEY_RE = re.compile(r'\bP\[\"([^\"]+)\"\]\s*<-\s*(?:@\"((?:[^\"]|\"\")*)\"|\"([^\"]*)\")', re.DOTALL)
PERKNAME_RE = re.compile(r'PerkName\.([A-Za-z0-9_]+)\s*(?:<-|=)\s*(?:@\"((?:[^\"]|\"\")*)\"|\"([^\"]*)\")', re.DOTALL)
PERKDESC_RE = re.compile(r'PerkDescription\.([A-Za-z0-9_]+)\s*(?:<-|=)\s*(?:@\"((?:[^\"]|\"\")*)\"|\"([^\"]*)\")', re.DOTALL)
SETDESC_RE = re.compile(r'_lcj_setDesc\(\"([^\"]+)\"\s*,')

VANILLA_PERK_RE = re.compile(
    r't\[\"(?P<id>perk\.[^\"]+)\"\]\s*<-\s*\{(?P<body>.*?)\};',
    re.DOTALL,
)
NAME_STR_RE = re.compile(r'name\s*=\s*(?:@\"((?:[^\"]|\"\")*)\"|\"([^\"]*)\")', re.DOTALL)
DESC_STR_RE = re.compile(r'description\s*=\s*(?:@\"((?:[^\"]|\"\")*)\"|\"([^\"]*)\")', re.DOTALL)


@dataclass(frozen=True)
class PerkDef:
    perk_id: str
    const_key: str
    name_key: Optional[str]
    desc_key: Optional[str]
    source_path: str


def has_jp(text: Optional[str]) -> bool:
    return bool(text and JP_RE.search(text))


def pick_str(m: Tuple[str, str]) -> str:
    a, b = m
    s = a if a is not None and a != "" else b
    return (s or "").replace('""', '"')


def iter_target_files(source_root: str) -> Iterable[str]:
    for root, dirs, files in os.walk(source_root):
        dirs[:] = [d for d in dirs if d != ".git"]
        for name in files:
            if not name.endswith(".nut"):
                continue
            path = os.path.join(root, name)
            lp = path.lower()
            if any(tok in lp for tok in TARGET_TOKENS):
                yield path


def collect_perk_defs(source_root: str) -> List[PerkDef]:
    rows: List[PerkDef] = []
    for path in iter_target_files(source_root):
        with open(path, encoding="utf-8", errors="ignore") as f:
            text = f.read()
        for body in PERK_OBJECT_RE.findall(text):
            mid = ID_RE.search(body)
            mconst = CONST_RE.search(body)
            if not (mid and mconst):
                continue
            mname = NAME_KEY_RE.search(body)
            mdesc = DESC_KEY_RE.search(body)
            rows.append(
                PerkDef(
                    perk_id=mid.group(1),
                    const_key=mconst.group(1),
                    name_key=mname.group(1) if mname else None,
                    desc_key=mdesc.group(1) if mdesc else None,
                    source_path=path,
                )
            )
    return rows


def collect_mod_texts(mod_root: str) -> str:
    chunks: List[str] = []
    for root, _, files in os.walk(mod_root):
        for name in files:
            if not name.endswith(".nut"):
                continue
            path = os.path.join(root, name)
            with open(path, encoding="utf-8", errors="ignore") as f:
                chunks.append(f.read())
    return "\n".join(chunks)


def collect_name_coverage(text: str) -> Tuple[Set[str], Set[str]]:
    key_cov: Set[str] = set()
    id_cov: Set[str] = set()

    for k, v in PAIR_VERBATIM_RE.findall(text):
        if has_jp(v):
            if k.startswith("perk."):
                id_cov.add(k)
    for k, v in PAIR_DOUBLE_RE.findall(text):
        if has_jp(v):
            if k.startswith("perk."):
                id_cov.add(k)

    for k, v1, v2 in SETP_RE.findall(text):
        if has_jp(pick_str((v1, v2))):
            key_cov.add(k)
    for k, v1, v2 in PKEY_RE.findall(text):
        if has_jp(pick_str((v1, v2))):
            key_cov.add(k)
    for k, v1, v2 in PERKNAME_RE.findall(text):
        if has_jp(pick_str((v1, v2))):
            key_cov.add(k)

    return key_cov, id_cov


def collect_desc_coverage(text: str) -> Set[str]:
    cov: Set[str] = set()
    cov.update(SETDESC_RE.findall(text))
    for k, v1, v2 in PERKDESC_RE.findall(text):
        if has_jp(pick_str((v1, v2))):
            cov.add(k)
    return cov


def collect_vanilla_perk_coverage(vanilla_perks_path: str) -> Tuple[Set[str], Set[str]]:
    name_ids: Set[str] = set()
    desc_ids: Set[str] = set()

    if not os.path.exists(vanilla_perks_path):
        return name_ids, desc_ids

    with open(vanilla_perks_path, encoding="utf-8", errors="ignore") as f:
        text = f.read()

    for m in VANILLA_PERK_RE.finditer(text):
        perk_id = m.group("id")
        body = m.group("body")
        mn = NAME_STR_RE.search(body)
        md = DESC_STR_RE.search(body)
        if mn and has_jp(pick_str((mn.group(1), mn.group(2)))):
            name_ids.add(perk_id)
        if md and has_jp(pick_str((md.group(1), md.group(2)))):
            desc_ids.add(perk_id)

    return name_ids, desc_ids


def main() -> int:
    script_dir = os.path.dirname(os.path.abspath(__file__))
    mod_root = os.path.dirname(script_dir)
    repo_root = os.path.dirname(mod_root)
    source_root = os.path.join(repo_root, "source")
    vanilla_perks = os.path.join(
        source_root,
        "vanilla_translation",
        "mod_90_translation_ja",
        "scripts",
        "!mods_preload",
        "!config",
        "mtj_5_perks.nut",
    )

    if not os.path.isdir(source_root):
        print(f"Source directory not found: {source_root}")
        return 2

    perk_defs = collect_perk_defs(source_root)
    if not perk_defs:
        print("No perk definitions found under source.")
        return 2

    mod_text = collect_mod_texts(mod_root)
    key_name_cov, id_name_cov = collect_name_coverage(mod_text)
    key_desc_cov = collect_desc_coverage(mod_text)
    vanilla_name_ids, vanilla_desc_ids = collect_vanilla_perk_coverage(vanilla_perks)

    missing_name: List[PerkDef] = []
    missing_desc: List[PerkDef] = []

    for p in perk_defs:
        has_name = (
            p.perk_id in id_name_cov
            or p.perk_id in vanilla_name_ids
            or p.const_key in key_name_cov
            or (p.name_key is not None and p.name_key in key_name_cov)
        )
        if not has_name:
            missing_name.append(p)

        has_desc = (
            p.perk_id in vanilla_desc_ids
            or p.const_key in key_desc_cov
            or (p.desc_key is not None and p.desc_key in key_desc_cov)
        )
        if not has_desc:
            missing_desc.append(p)

    for p in missing_name:
        rel = os.path.relpath(p.source_path, repo_root)
        print(f"MISSING_NAME  id={p.perk_id} const={p.const_key} key={p.name_key} source={rel}")
    for p in missing_desc:
        rel = os.path.relpath(p.source_path, repo_root)
        print(f"MISSING_DESC  id={p.perk_id} const={p.const_key} key={p.desc_key} source={rel}")

    total_missing = len(missing_name) + len(missing_desc)
    if total_missing:
        print(
            f"\nPerk-definition Japanese coverage FAILED: "
            f"missing_name={len(missing_name)}, missing_desc={len(missing_desc)}"
        )
        return 1

    print(
        f"Perk-definition Japanese coverage OK: "
        f"{len(perk_defs)} definitions, missing_name=0, missing_desc=0"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
