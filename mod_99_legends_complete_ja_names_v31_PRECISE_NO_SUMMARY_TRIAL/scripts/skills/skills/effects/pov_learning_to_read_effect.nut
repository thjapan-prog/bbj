this.pov_learning_to_read_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Duration = 5,
		Ez = false
	},
	function create()
	{
		this.m.ID = "effects.pov_learning_to_read";
		this.m.Name = "読み書き学習中";
		this.m.Icon = "skills/pov_learning_to_read.png";
		this.m.IconMini = "";
		this.m.Overlay = "orc1";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "This character is in the process of [color=" + this.Const.UI.Color.povPerkBlue + "]Learning to Read[/color]: Studying like that can take a mental toll, especially when being a practically illiterrate mercenary, and usually leaves one tired and frustrated.\n\n After a few days they will have a decent grasp of reading, and will be able to benefit from skill books.";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
			//will last for x more days kinda shit
		];

		if (this.m.Ez != true)
		{
			ret.push(
				{
					id = 11,
					type = "text",
					icon = "ui/icons/xp_received.png",
					text = "経験値取得が[color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]減少する。"
				}
			);
			ret.push(
				{
					id = 11,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "最大疲労度が[color=" + this.Const.UI.Color.NegativeValue + "]10%[/color]減少する。"
				}
			);
		} 
		else
		{
			ret.push(
				{
					id = 11,
					type = "text",
					icon = "ui/icons/special.png",
					text = "このキャラクターのユニークなスキルセットにより、学習による[color=" + this.Const.UI.Color.PositiveValue + "]ペナルティ[/color]が一切ない。"
				}
			);
		}

		if (this.m.Duration >= 0)
		{
			ret.push(
				{
					id = 11,
					type = "text",
					icon = "ui/icons/scroll_01.png",
					text = "勉強は[color=" + this.Const.UI.Color.NegativeValue + "]"+this.m.Duration+"[/color]日後に終わる。"
				}
			);
		}

		return ret;
	}

	

	function onUpdate( _properties )
	{
		// Debuffs
		if (this.m.Ez != true)
		{
			_properties.XPGainMult *= 0.80;
			_properties.StaminaMult *= 0.9;	
		}	
	}

	// need to refine it, do a check for the EZ and also in memory OKE?
	// or just check for "if player active or sth"
	// idk if these notes are relevant enymore lolmao. we shall see
	// ok that was quick, I need dis :D
	function onAdded()
	{
		if(::World.State.getPlayer() != null)
		{
			local actor = this.getContainer().getActor();
			if (actor.getSkills().hasTrait(::Legends.Trait.LegendTalented) || actor.getBackground().getID() == "background.apprentice" || actor.getBackground().getID() == "background.squire" || actor.getBackground().getID() == "background.peddler")
			{
				this.m.Duration = 2;
				this.m.Ez = true;
			}
			if (this.m.Ez == false)
			{
				actor.worsenMood(0.5, "Learning to Read is Hard...")
			}
		}
	}

	function onNewDay()
	{
		this.m.Duration -= 1;
		if (this.m.Duration <= 0)
		{
			local actor = this.getContainer().getActor();
			if (!actor.getSkills().hasSkill("trait.pov_reader"))
			{
				actor.getSkills().add(this.new("scripts/skills/traits/pov_reader_trait"))
			}
			this.removeSelf();
		}
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeU16(this.m.Duration);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.Duration = _in.readU16();
	}

});

