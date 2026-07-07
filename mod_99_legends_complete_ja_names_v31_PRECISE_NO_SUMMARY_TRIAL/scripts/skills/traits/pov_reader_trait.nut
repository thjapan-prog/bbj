this.pov_reader_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.pov_reader";
		this.m.Name = "読書習得";
		this.m.Icon = "ui/traits/pov_reader.png";
		this.m.Description = "多大な努力と指導の末、%name% は読み方を身につけ、スキルブックの恩恵を受けられるようになった。これは他の事柄にも役立ち、全体的により早い成長を可能にする。";
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
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/scroll_01.png",
				text = "Can [color=" + this.Const.UI.Color.PositiveValue + "]read[/color] Books"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3%[/color] Experience Gain"
			}
		];
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (!actor.getFlags().has("PovCanRead"))
		{
			actor.getFlags().add("PovCanRead");
		}
	}
	
	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.03;
	}

});

