this.legend_brothers_in_chains_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = ::Legends.Traits.getID(::Legends.Trait.LegendBrothersInChains);
		this.m.Name = "鎖の結束";
		this.m.Icon = "ui/settlement_status/settlement_effect_40.png";
		this.m.Description = "このキャラクターは他の元奴隷たちと絆を結んでいる。フィールド上にいる他の債務奴隷1人につき、このキャラクターは [color=%positive%]+1[/color] 近接攻撃スキル、遠隔攻撃スキル、近接防御、遠隔防御、意思を得る。";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
	}

	function getTooltip()
	{
		return [
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
	}

	function onCombatStarted()
	{
		::Legends.Effects.grant(this, ::Legends.Effect.LegendBrothersInChains);
		this.m.IsHidden = true;
	}

	function onCombatFinished()
	{
		::Legends.Effects.remove(this, ::Legends.Effect.LegendBrothersInChains);
		this.m.IsHidden = false;
	}

});

