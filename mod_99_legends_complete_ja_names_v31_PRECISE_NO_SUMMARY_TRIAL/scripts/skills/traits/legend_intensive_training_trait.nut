this.legend_intensive_training_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {
		HitpointsAdded = 0,
		StaminaAdded = 0,
		BraveAdded = 0,
		IniAdded = 0,
		MatkAdded = 0,
		RatkAdded = 0,
		MdefAdded = 0,
		RdefAdded = 0,
		TraitGained = -1,
		BonusXP = 0.0,
		MaxSkillsCanBeAdded = 15,
		TrainingSeed = null,
		SettlementTrainingDelay = 0,
		SettlementTrainedPoints = 0,
		TraitRerollDelay = 0,
		TraitRerollCount = 0,
	},
	function create()
	{
		this.m.ID = ::Legends.Traits.getID(::Legends.Trait.LegendIntensiveTraining);
		this.m.Name = "訓練の進捗";
		this.m.Icon = "ui/traits/IntensiveTraining.png";
		this.m.Description = "このキャラクターはある程度の軍事訓練を受けているが、本領を発揮するには時間がかかる。\n 訓練キャンプに入れて技能を磨こう。訓練の進捗ポイントは時間経過で獲得される。\n 15ポイントで、このキャラクターはパークポイントと、その戦闘スタイルに関連する1つのポジティブな特性を得る。\n\n [color=%negative%]訓練の進捗ポイントは、所持品にあるアップグレード済みの訓練テントでのみ獲得できる！[/color]";
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.Type = this.Const.SkillType.Trait;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = true;
		this.m.TrainingSeed = ::Math.abs(::Math.rand(0, 65535) * ::Math.rand(0, 65535) + ::Math.rand(0, 65535));
	}

	function addRandomSkills( _bro, _skillsNum )
	{
		local attributes = [];
		for (local i = 0; i < ::Const.Attributes.COUNT; i++)
			attributes.push(i);

		foreach(index, talent in _bro.getTalents()) {
			for (local j = 0; j < talent; j++)
				attributes.push(index);
		}

		for( local i = 0; i < _skillsNum; i++ )
		{
			this.m.TrainingSeed = ::Legends.LCG.get(this.m.TrainingSeed).nextState();
			local attr = attributes[::Math.abs(this.m.TrainingSeed % attributes.len())];

			switch(attr)
			{
				case ::Const.Attributes.Hitpoints:
					_bro.getBaseProperties().Hitpoints += 1;
					this.addHitpoint();
					break;

				case ::Const.Attributes.Bravery:
					_bro.getBaseProperties().Bravery += 1;
					this.addBrave();
					break;

				case ::Const.Attributes.Fatigue:
					_bro.getBaseProperties().Stamina += 1;
					this.addStamina();
					break;

				case ::Const.Attributes.Initiative:
					_bro.getBaseProperties().Initiative += 1;
					this.addIni();
					break;

				case ::Const.Attributes.RangedSkill:
				case ::Const.Attributes.MeleeSkill:
					if ( _bro.getBaseProperties().MeleeSkill > _bro.getBaseProperties().RangedSkill )
					{
						_bro.getBaseProperties().MeleeSkill += 1;
						this.addMatk();
					}
					else
					{
						_bro.getBaseProperties().RangedSkill += 1;
						this.addRatk();
					}
					break;

				case ::Const.Attributes.MeleeDefense:
					_bro.getBaseProperties().MeleeDefense += 1;
					this.addMdef();
					break;

				default:
					_bro.getBaseProperties().RangedDefense += 1;
					this.addRdef();
					break;
			}
		}

		_bro.getSkills().update();
	}

	function getBonusXP()
	{
		return this.m.BonusXP;
	}

	function finishedTraining (_traitConst)
	{
		this.m.Description = "このキャラクターは基礎訓練を完了した。\n あらゆる手段で得られる経験値が恒久的に [color=%positive%]+5%[/color] 増加した。\n このキャラクターは訓練から引き続きパークポイントと能力値ポイントを得られる。";
		this.m.Icon = "ui/traits/IntensiveTrainingCompleted.png";
		this.m.TraitGained = _traitConst;
		this.m.BonusXP = 0.05;
	}

	function addHitpoint()
	{
		this.m.HitpointsAdded++;
	}
	function addStamina()
	{
		this.m.StaminaAdded++;
	}
	function addBrave()
	{
		this.m.BraveAdded++;
	}
	function addIni()
	{
		this.m.IniAdded++;
	}
	function addMatk()
	{
		this.m.MatkAdded++;
	}
	function addRatk()
	{
		this.m.RatkAdded++;
	}
	function addMdef()
	{
		this.m.MdefAdded++;
	}
	function addRdef()
	{
		this.m.RdefAdded++;
	}

	function getDescription()
	{
		return this.m.Description;
	}

	function getStatsIncreased()
	{
		return this.m.HitpointsAdded + this.m.StaminaAdded + this.m.BraveAdded + this.m.IniAdded + this.m.MatkAdded + this.m.RatkAdded + this.m.MdefAdded + this.m.RdefAdded;
	}

	function isMaxReached()
	{
		return this.getStatsIncreased() >= this.m.MaxSkillsCanBeAdded;
	}

	function canTrainInTown () {
		return this.m.SettlementTrainingDelay == 0 && !this.isMaxReached();
	}

	function canRerollTrait () {
		return this.m.TraitRerollDelay == 0 && this.m.TraitGained != -1;
	}

	function getMaxSkillsCanBeAdded()
	{
		return this.m.MaxSkillsCanBeAdded;
	}

	function successfullyTrained( _bro )
	{
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
//		this.logInfo(this.getContainer().getActor().getBackground().getNameOnly());

		if (this.getContainer().getActor().getBackground().getNameOnly() == "Donkey")
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "The donkey looks at you, somewhat confused..."
			});
		}else
		if (getStatsIncreased() > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/leveled_up.png",
				text = this.isMaxReached() ? "訓練結果：" : "現時点の訓練結果："
			});

			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=%positive%]" + getStatsIncreased() + "[/color] スキルポイント合計"
			});

			if (this.m.HitpointsAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/health.png",
					text = "[color=%positive%]" + this.m.HitpointsAdded + "[/color] ヒットポイント"
				});
			}

			if (this.m.StaminaAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "[color=%positive%]" + this.m.StaminaAdded + "[/color] 疲労度"
				});
			}

			if (this.m.BraveAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=%positive%]" + this.m.BraveAdded + "[/color] 意思"
				});
			}
			if (this.m.IniAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=%positive%]" + this.m.IniAdded + "[/color] イニシアチブ"
				});
			}

			if (this.m.MatkAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=%positive%]" + this.m.MatkAdded + "[/color] 近接技量"
				});
			}

			if (this.m.RatkAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/ranged_skill.png",
					text = "[color=%positive%]" + this.m.RatkAdded + "[/color] 遠隔技量"
				});
			}

			if (this.m.MdefAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=%positive%]" + this.m.MdefAdded + "[/color] 近接防御"
				});
			}

			if (this.m.RdefAdded > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=%positive%]" + this.m.RdefAdded + "[/color] 遠隔防御"
				});
			}

			if (this.isMaxReached())
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/unlocked_small.png",
					text = "[color=%positive%]" + 1 + "[/color] パークポイント",
					divider = "top"
				});
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/unlocked_small.png",
					text = "[color=%positive%]" + ::Legends.Traits.get(this, this.m.TraitGained).getName() + "[/color] 特性"
				});
			}
		}
		else
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "このキャラクターはまだ訓練を開始していない"
			});
		}

		if (this.m.SettlementTrainingDelay == 0) {
			if (this.isMaxReached()) {
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/cancel.png",
					text = "集落でこれ以上訓練できない。"
				});
			} else {
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "集落で訓練できる。"
				});
			}
		} else {
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=%positive%]" + this.m.SettlementTrainingDelay + "[/color]戦闘後、再び集落で訓練できる。"
			});
		}

		if (this.isMaxReached()) {
			if (this.canRerollTrait()) {
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "集落で訓練した特性を変更できる。"
				});
			} else {
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "[color=%positive%]" + this.m.TraitRerollDelay + "[/color]戦闘後、再び集落で訓練した特性を変更できる。"
				});
			}
		}

		return tooltip;
	}

	function isHidden()
	{
		return this.getStatsIncreased() == 0;
	}

	function onCombatFinished()
	{
		if (this.Tactical.isActive()) {
		if (this.m.SettlementTrainingDelay > 0)
			this.m.SettlementTrainingDelay -= 1;
		if (this.m.TraitRerollDelay > 0)
			this.m.TraitRerollDelay -= 1;
		}
		this.skill.onCombatFinished();
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeU16(this.m.HitpointsAdded);
		_out.writeU16(this.m.StaminaAdded);
		_out.writeU16(this.m.BraveAdded);
		_out.writeU16(this.m.IniAdded);
		_out.writeU16(this.m.MatkAdded);
		_out.writeU16(this.m.RatkAdded);
		_out.writeU16(this.m.MdefAdded);
		_out.writeU16(this.m.RdefAdded);
		_out.writeF32(this.m.BonusXP);
		_out.writeI32(this.m.TraitGained);
		_out.writeU8(this.m.SettlementTrainingDelay);
		_out.writeU8(this.m.SettlementTrainedPoints);
		_out.writeU8(this.m.TraitRerollDelay);
		_out.writeU16(this.m.TraitRerollCount);
		_out.writeU32(this.m.TrainingSeed);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.HitpointsAdded = _in.readU16();
		this.m.StaminaAdded = _in.readU16();
		this.m.BraveAdded = _in.readU16();
		this.m.IniAdded = _in.readU16();
		this.m.MatkAdded = _in.readU16();
		this.m.RatkAdded = _in.readU16();
		this.m.MdefAdded = _in.readU16();
		this.m.RdefAdded = _in.readU16();
		this.m.BonusXP = _in.readF32();
		this.m.TraitGained = _in.readI32();
		this.m.SettlementTrainingDelay = _in.readU8();
		this.m.SettlementTrainedPoints = _in.readU8();
		this.m.TraitRerollDelay = _in.readU8();
		this.m.TraitRerollCount = _in.readU16();
		this.m.TrainingSeed = _in.readU32();

		if(this.isMaxReached())
		{
			this.m.Name = "Training fulfilled";
			this.m.Description = "このキャラクターはすべての訓練を完了し、訓練キャンプでこれ以上学ぶことはできない。\n 訓練で得られる経験値が恒久的に [color=%positive%]+5%[/color] 増加した。\n このキャラクターは今後、訓練キャンプの訓練からパークポイントや能力値ポイントを得られない。";
			this.m.Icon = "ui/traits/IntensiveTrainingCompletedFull.png";
		}
	}

});

