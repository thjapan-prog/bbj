this.xxsbook <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.xxsbook";
		this.m.Name = "Skill Book";
		this.m.Description = "Choose one of 3 to 5 special skills or learn a random special skill. 5% chance that all options will be available. A maximum of 2 special skills can be learned, and if this limit is exceeded, an additional 3000 crowns will be incurred and the previously learned 2 skills will be reset. Using this will increase the daily wage by 10 or cost an additional 1000 crowns. (Some special mercenaries cannot use skill books)";
		this.m.Icon = "xx_item_04_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 3500;
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
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 65,
			type = "text",
			text = "Use by Right-clicking or Dragging on the body slot of the currently selected character. This item will be consumed in the process."
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		local chk = _actor.getSkills();
		foreach ( s in this.FantasyChampList )
		{
			if (chk.hasSkill(s))
			{
				return false;
			}
		}

		local ax = _actor.getFlags().getAsInt("xxSkillBookTraining");
		if (ax < 9999989)
		{
		}
		else
		{
			return false;
		}
		_actor.getFlags().increment("xxSkillBookTraining", 1);
		local axd = 1;
		if (chk.hasSkill("effects.xxzzlimitpotion_skill") || chk.hasSkill("actives.sbp_bondage_skill") || chk.hasSkill("actives.sbq1_propaganda_skill"))
		{
			axd = ++axd;
		}
		if (ax > axd)
		{
			this.World.Assets.addMoney(-3000);
			_actor.getFlags().increment("xxSkillBookTraining", -1 * ax);
			this.FantasySpellbookact(_actor);
		}

		if (_actor.getCurrentProperties().DailyWage <= 0)
		{
			this.World.Assets.addMoney(-1000);
		}
		else
		{
			_actor.getBaseProperties().DailyWage += 10;
		}

		chk.add(this.new("scripts/skills/actives/xxzzcheck_skill"));
	        ::World.State.getMenuStack().popAll(true);
		if (this.Math.rand(1, 100) <= 5)
		{
			::World.Events.fire("event.xxzzskillbook_event");
		}
		else
		{
			::World.Events.fire("event.xxzzskillbook2_event");
		}
		return true;
	}

	function getBuyPrice()
	{
		return this.Math.ceil(this.getValue());
	}

	function getSellPrice()
	{
		return this.Math.round(this.getValue() * 0.1);
	}

});

