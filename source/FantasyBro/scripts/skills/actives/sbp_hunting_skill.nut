this.sbp_hunting_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.sbp_hunting_skill";
		this.m.Name = "92. Poor Man\'s Weapon (passive)";
		this.m.Icon = "ui/xxp3.png";
		this.m.Description = "Gain beneficial effects when using a weak weapon.";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 100;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsSerialized = true;
		this.m.IsHidden = false;
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
		];
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Weapons priced at 900 crowns or below: +10% Damage, +17 Melee and Ranged Skills."
		});
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/special.png",
			text = "When using the Staff sling / Spiked bolas : Max damage increases with level (max 50)"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.m.Value <= 900)
		{
			_properties.DamageTotalMult += 0.1;
			_properties.MeleeSkill += 17;
			_properties.RangedSkill += 17;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local a = _skill.getID();
		if (a == "actives.sling_stone" || a == "actives.throw_balls")
		{
			_properties.DamageRegularMax += this.Math.min(this.getContainer().getActor().getLevel() * 2, 50);
		}
	}

});

