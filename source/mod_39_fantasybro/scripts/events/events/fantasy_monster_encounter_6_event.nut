this.fantasy_monster_encounter_6_event <- this.inherit("scripts/events/event", {
	m = {
		Champion = null
	},
	function create()
	{
		this.m.ID = "event.fantasy_monster_encounter_6_event";
		this.m.Title = "Sudden Events...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_115.png[/img]{Your mercenaries stumbled upon a small shack located in a secluded area. The interior of the shack was old and dusty, strewn with cobwebs and filled with stuffed specimens of various plants and animals. While exploring the house, you found a skeleton lying on the bed. It was probably the owner of the shack. Next to it lay an unknown bottle of medicine and a piece of paper that appeared to be a note written by him.%SPEECH_ON%I have dedicated my life to finding a way to transcend the feeble human body. Through dissecting and experimenting on various plants and animals, I have finally extracted the essence that could transform a human into a being beyond. However, the potion proved to be highly toxic for human use. If it is aged for several centuries, its toxicity will diminish. I hope someone will fulfill my lifelong aspiration and witness its effects.%SPEECH_OFF%You tried to disregard the absurd contents of the note, but one of your companions had already picked up the bottle of potion, ready to consume its contents.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Allow %chosen% to drink this potion",
					function getResult( _event )
					{
						return "B";
					}
				},
				{
					Text = "Stop it, %chosen%!",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Champion.getImagePath());
			}
		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_115.png[/img]{%SPEECH_ON%Aww! I feel like my body is burning, save me!%SPEECH_OFF% %chosen% rolled in agony for a while, groaning, until he eventually lost consciousness. You thought he had died, but he was still breathing. After some time had passed, %chosen% regained consciousness. He claimed that something massive had changed in his body. In fact, his body had undergone grotesque transformations. If he looked in a mirror, he would be shocked.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Thou art lucky to still be alive",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				local actor = _event.m.Champion;
				local body = actor.getSprite("body");
				local head = actor.getSprite("head");
				local tattoo_head = actor.getSprite("tattoo_head");
				if (this.Math.rand(1, 2) == 2)
				{
					body.Saturation = 0.5;
					body.varySaturation(0.2);
					body.Color = this.createColor("#c1ddaa");
					body.varyColor(0.05, 0.05, 0.05);
					head.Saturation = body.Saturation;
					head.Color = body.Color;
					tattoo_head.setBrush("zombify_0" + this.Math.rand(1, 4));
					tattoo_head.setBrightness(0.9);
				}
				else
				{
					body.Saturation = 0.5;
					body.varySaturation(0.2);
					body.Color = this.createColor("#ddd2aa");
					body.varyColor(0.05, 0.05, 0.05);
					head.Saturation = body.Saturation;
					head.Color = body.Color;
					tattoo_head.setBrush("bust_skeleton_face_0" + this.Math.rand(1, 6));
					tattoo_head.setBrightness(0.9);
				}
				local r = this.Math.rand(1, 4);
				if (r == 1)
				{
					r = 7;
					_event.m.Champion.getBaseProperties().MeleeSkill += r;
					_event.m.Champion.getBaseProperties().RangedSkill += r;
					_event.m.Champion.getBaseProperties().MeleeDefense += r;
					_event.m.Champion.getBaseProperties().RangedDefense += r;
					_event.m.Champion.getBaseProperties().Hitpoints += r;
					_event.m.Champion.getBaseProperties().Stamina += r;
					_event.m.Champion.getBaseProperties().Initiative += r;
					_event.m.Champion.getBaseProperties().Bravery += r;
				}
				else if (r == 2)
				{
					r = 5;
					_event.m.Champion.getBaseProperties().MeleeSkill = r;
					_event.m.Champion.getBaseProperties().RangedSkill = r;
					_event.m.Champion.getBaseProperties().MeleeDefense = r;
					_event.m.Champion.getBaseProperties().RangedDefense = r;
					_event.m.Champion.getBaseProperties().Hitpoints = r;
					_event.m.Champion.getBaseProperties().Stamina = r;
					_event.m.Champion.getBaseProperties().Initiative = r;
					_event.m.Champion.getBaseProperties().Bravery = r;
				}
				else
				{
					_event.m.Champion.getBaseProperties().Hitpoints += 10;
					_event.m.Champion.getBaseProperties().Stamina += 10;
				}
				_event.m.Champion.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/special.png",
					text = "A change has taken place in " + _event.m.Champion.getName() + "\'s body!"
				});
				this.Characters.push(_event.m.Champion.getImagePath());
			}
		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_115.png[/img]{You successfully managed to prevent %chosen% from drinking the potion, but it slipped from his hands and shattered on the floor. The spot where the potion fell emitted fumes as if it had been dissolved in hydrochloric acid, leaving a deeply corroded indentation.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You were inches away from death just now, idiot!",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Champion.getImagePath());
			}
		});
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < 100)
		{
			return;
		}
		if (this.World.Flags.get("FantasyMonsterEncounter") != 1)
		{
			return;
		}
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];
		foreach( bro in brothers )
		{
			if (!bro.getSkills().hasSkill("trait.player"))
			{
				candidates.push(bro);
			}
		}
		if (candidates.len() > 0)
		{
			this.m.Champion = candidates[this.Math.rand(0, candidates.len() - 1)];
		}
		else
		{
			return;
		}
		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"chosen",
			this.m.Champion != null ? this.m.Champion.getName() : ""
		]);
	}

	function onClear()
	{
		this.m.Champion = null;
	}

});

