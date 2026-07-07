this.pov_oathsworn_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {
		Started = 0,
		Trait1 = null,
		DaysHad = 0,
		DayChanged = 0,
		DaysToChange = 5
		},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_oathsworn";
		this.m.Name = "誓約者";
		this.m.Icon = "ui/traits/pov_oathsworn.png";
		this.m.Description = "名誉ある誓いの徒であり、約束と若きAslemの教えに縛られている。パラディンの集団に属していなくとも、その習わしは守られ、どれほど些細であっても敬虔な行いは何より重要である。このキャラクターは 5 日ごとに、自ら選んだ新たな誓いを立てる。";
		this.m.Order = this.Const.SkillOrder.Background;
	}

	// Funnily enough, the oh-so-holy paladin's unique buff is build on top of the hates everything trait, lmao. So holy much wow.
	function changeTraits()
	{
		//Possible Hate Perks
		local traitList = [
		"scripts/skills/traits/pov_minor_oath_of_camaraderie_trait",
		"scripts/skills/traits/pov_minor_oath_of_distinction_trait",
		"scripts/skills/traits/pov_minor_oath_of_endurance_trait",
		"scripts/skills/traits/pov_minor_oath_of_fortification_trait",
		"scripts/skills/traits/pov_minor_oath_of_humility_trait",
		"scripts/skills/traits/pov_minor_oath_of_rabbitslaying_trait",
		"scripts/skills/traits/pov_minor_oath_of_sacrifice_trait",
		"scripts/skills/traits/pov_minor_oath_of_valor_trait",
		"scripts/skills/traits/pov_minor_oath_of_wrath_trait"
		];

		local actor = this.getContainer().getActor();

		// Check if actor has already active perks
		// If yes, remove them, and make sure they don't roll again
		if (this.m.Trait1 != null)
		{
			local oldTrait1 = this.new(this.m.Trait1);
			//Debug
			::TLW.Mod.Debug.printLog("Checking Oathsworn Trait || Trying to Remove Old Traits:  " + oldTrait1.getName());

			//Remove traits from actor and array, with fallback
			if (actor.getSkills().hasSkill(oldTrait1))
			{
				actor.getSkills().removeByID(oldTrait1.getID());
				traitList.remove(traitList.find(this.m.Trait1));
				::TLW.Mod.Debug.printLog("Checking Oathsworn Trait || Successfully Removed Trait 1");
			}
		}

		//Add 1 Of These Traits to Actor
		//Pick one trait from the list, save them to m
		this.m.Trait1 = traitList[this.Math.rand(0, traitList.len() - 1)];

		//Add these traits to the actor, if he does not have them already
		local trait1 = this.new(this.m.Trait1);

		//Fallback if actor has them already (normally, he should not)
		if (!actor.getSkills().hasSkill(trait1.getID()))
		{
			actor.getSkills().add(trait1);
		}

		//Debug 
		::TLW.Mod.Debug.printLog("Checking Hate Everything Trait || Days Passed Since Last Change: " + this.m.DaysHad);
		::TLW.Mod.Debug.printLog("Checking Hate Everything Trait || Added Trait 1: " + trait1.getName());

		//Start Counting the Days / Reset Counting
		this.m.DayChanged = this.World.getTime().Days;
		this.m.DaysHad = this.World.getTime().Days - this.m.DayChanged;
	}
	function getTooltip()
	{
		local result = [
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
		];

		if (this.m.Trait1 != null)
		{
			local trait1 = this.new(this.m.Trait1);

			result.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "現在、[color=" + this.Const.UI.Color.PositiveValue + "]"+ trait1.getName() +"[/color] を持っている。"
			});
			result.push({
				id = 11,
				type = "text",
				icon = "ui/icons/pov_extra_special.png",
				text = "5日ごとに、新たな[color=" + this.Const.UI.Color.PositiveValue + "]小さな誓い[/color]が選ばれる..."
			});
		}

		return result;
	}

	function onAdded()
	{
		if (this.m.Started == 0)
		{
			changeTraits();
			this.m.Started = 1;
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		//Check for Current Day, if x (see m table above) Days pass, switch traits!
		local dayCheck = this.World.getTime().Days - this.m.DayChanged;
		if (dayCheck >= this.m.DaysToChange)
		{
			changeTraits();
		}

		if (!actor.isPlacedOnMap())
		{
			// If not in battle, then this should be a trait and not a status effect
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}
	}

	function onSerialize( _out )
	{
		this.character_trait.onSerialize(_out);
		_out.writeU8(this.m.Started);
		_out.writeU16(this.m.DaysHad);
		_out.writeU16(this.m.DayChanged);
		_out.writeString(this.m.Trait1);
	}

	function onDeserialize( _in )
	{
		this.character_trait.onDeserialize(_in);
		this.m.Started = _in.readU8();
		this.m.DaysHad = _in.readU16();
		this.m.DayChanged = _in.readU16();
		this.m.Trait1 = _in.readString();
	}

});
