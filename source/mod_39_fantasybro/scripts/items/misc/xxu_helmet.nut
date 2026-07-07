this.xxu_helmet <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.xxu_helmet";
		this.m.Name = "Enhancement Scroll (Helmet)";
		this.m.Description = "Enhances the durability of the equipped [color=#a13600]Named Helmet[/color] of the current owner. The enhancement has a 50% chance of success, increasing the helmet\'s durability  by 1~10% of its current value. If the enhancement fails, there is a 10% chance that the helmet will be destroyed. Only named items can be enhanced.";
		this.m.Icon = "xx_item_07_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 2500;
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
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		local mitem = _item == null ? _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head) : _item;
		if (mitem != null && mitem.isItemType(this.Const.Items.ItemType.Named) && mitem.isItemType(this.Const.Items.ItemType.Helmet))
		{

			if (this.Math.rand(1, 100) <= 50)
			{
				this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
				local r = this.Math.rand(1, 10) * 0.01;
				mitem.m.ConditionMax = this.Math.max(this.Math.floor(mitem.m.ConditionMax * r), 1) + mitem.m.ConditionMax;
				mitem.m.Condition = mitem.m.ConditionMax;
			}
			else
			{
				if (this.Math.rand(1, 100) <= 10)
				{
					this.Sound.play("sounds/combat/acid_flask_impact_04.wav", this.Const.Sound.Volume.Inventory);
					_actor.getItems().unequip(mitem);
				}
				else
				{
					this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
				}
			}
		}
		else
		{
			return false;
		}
		return true;
	}

});

