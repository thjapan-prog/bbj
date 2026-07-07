this.xxzzarena_event <- this.inherit("scripts/events/event", {
	m = {
		ChaosItem = 0,
		ChaosPoint = 0,
		DivinePoint = 0,
		GodPoint = 0,
		TimePoint = 100,
		TimeDay = 0,
		GambleMoney = 0,
		OutCheck = 0
	},
	function create()
	{
		this.m.ID = "event.xxzzarena_event";
		this.m.Title = "In the guild";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "Start1",
			Text = "[color=#56e64c]Adventure Portal[/color]: Engage in battles of hard difficulty to earn special rewards.\n([color=#d11313]Requirements[/color]: 500 Crowns)\n\n[color=#56e64c]Chaos Portal[/color]: Engage in battles of extreme difficulty to earn Chaos Crystals.\n([color=#d11313]Requirements[/color]: Chaos Potion + Rare Skill Book, or Many Crowns)\n\n[color=#56e64c]Chaos Shop[/color]: Use Chaos Crystals to get special items.\n\n[color=#56e64c]Safe Quest[/color]: Struggle to earn a small amount of crowns.\n([color=#d11313]Requirements[/color]: 60 daily action point)\n\n[color=#999999]All services in the Adventurer\'s Guild require a crown or special item.[/color]",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Adventure Portal",
					function getResult( _event )
					{
						if (this.World.Assets.getMoney() >= 500)
						{
							return "Battle1";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Chaos Portal",
					function getResult( _event )
					{
						return "Start1B";
					}
				},
				{
					Text = "Chaos Shop",
					function getResult( _event )
					{
						return "Start1C1";
					}
				},
				{
					Text = "Safe Quest",
					function getResult( _event )
					{
						if (_event.m.TimePoint >= 60)
						{
							_event.m.TimePoint = _event.m.TimePoint - 60;
							return "SideJobEnd";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Next Page",
					function getResult( _event )
					{
						return "Start2";
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				_event.m.Title = "Adventurer\'s Guild";
				if (this.World.Statistics.getFlags().getAsInt("aaaxx") <= 0)
				{
					this.World.Statistics.getFlags().increment("aaaxx", 1);
				}
				if (this.World.getTime().Days != _event.m.TimeDay)
				{
					_event.m.TimeDay = this.World.getTime().Days;
					_event.m.TimePoint = 100;
				}
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
		this.m.Screens.push({
			ID = "Start2",
			Text = "[color=#56e64c]Treat to the %companyname%[/color]: Improves the mood of bros and gain random effects.\n([color=#d11313]Requirements[/color]: 500 Crowns)\n\n[color=#56e64c]Betting on the Fighter[/color]: You are betting crowns on one of two fighters. The higher the payout, the lower the chance of winning.\n([color=#d11313]Requirements[/color]: 500 Crowns + 40 daily action point)\n\n[color=#56e64c]Divine Shop[/color]: Use Divine Crystals to purchase special items or earn Divine Crystals through donations.\n\n[color=#999999]All services in the Adventurer\'s Guild require a crown or special item.[/color]",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Treat to the %companyname%",
					function getResult( _event )
					{
						if (this.World.Assets.getMoney() >= 500)
						{
							this.World.Assets.addMoney(-500);
							return "Start2B";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Betting on the Fighter",
					function getResult( _event )
					{
						if (this.World.Assets.getMoney() >= 500 && _event.m.TimePoint >= 40)
						{
							_event.m.TimePoint = _event.m.TimePoint - 40;
							this.World.Assets.addMoney(-500);
							return "Start2C1";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Divine Shop",
					function getResult( _event )
					{
						return "Start2D1";
					}
				},
				{
					Text = "Next Page",
					function getResult( _event )
					{
						return "Start1";
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
//ChaosShop////
		this.m.Screens.push({
			ID = "Start1B",
			Text = "How would you like to pay the admission fee?",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Chaos Potion +  Skill Book",
					function getResult( _event )
					{
						local stash = this.World.Assets.getStash().getItems();
						local ticketA = 0;
						local ticketAX = 1;
						local ticketB = 0;
						local ticketBX = 1;
						foreach( item in stash )
						{
							if (item != null)
							{
								if (item.getID() == "misc.xxchaospotion")
								{
									ticketA = ++ticketA;
								}
								else
								if (item.getID() == "misc.xxsbook")
								{
									ticketB = ++ticketB;
								}
							}
						}
						if (ticketA >= ticketAX && ticketB >= ticketBX)
						{
							foreach( item in stash )
							{
								if (item != null)
								{
									if (item.getID() == "misc.xxchaospotion" && ticketAX >= 1)
									{
										ticketAX = ticketAX - 1;
										this.World.Assets.getStash().removeByID("misc.xxchaospotion");
									}
									else
									if (item.getID() == "misc.xxsbook" && ticketBX >= 1)
									{
										ticketBX = ticketBX - 1;
										this.World.Assets.getStash().removeByID("misc.xxsbook");
									}
								}
							}
						}
						if (ticketAX <= 0 && ticketBX <= 0)
						{
							return "Battle2";
						}
						else
						{
							return "Getout";
						}
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
				local rr = this.World.Statistics.getFlags().getAsInt("aaaxx") * 1000 + 9000;
				this.Options.push({
					Text =  rr + " Crowns",
					function getResult( _event )
					{
						if (this.World.Assets.getMoney() >= rr)
						{
							this.World.Assets.addMoney(-rr);
							return "Battle2";
						}
						else
						{
							return "Getout";
						}
					}
				});
				this.Options.push({
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				});
			}
		});
		this.m.Screens.push({
			ID = "Start1C1",
			Text = "You can use Chaos Crystals to purchase special items.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "500 Crowns (100)",
					function getResult( _event )
					{
						if (_event.m.ChaosPoint >= 100)
						{
							_event.m.ChaosPoint = _event.m.ChaosPoint - 100;
							this.World.Assets.addMoney(500);
							this.Sound.play(this.Const.Sound.MoneyTransaction[this.Math.rand(0, this.Const.Sound.MoneyTransaction.len() - 1)], 1.2);
							return "Start1C1";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Enhancement Scroll (1000)",
					function getResult( _event )
					{
						if (_event.m.ChaosPoint >= 1000)
						{
							_event.m.ChaosPoint = _event.m.ChaosPoint - 1000;
							_event.m.ChaosItem = 1;
							return "ChaosGo";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Rare Consumables (1500)",
					function getResult( _event )
					{
						if (_event.m.ChaosPoint >= 1500)
						{
							_event.m.ChaosPoint = _event.m.ChaosPoint - 1500;
							_event.m.ChaosItem = 2;
							return "ChaosGo";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Named Item (1000)",
					function getResult( _event )
					{
						if (_event.m.ChaosPoint >= 1000)
						{
							_event.m.ChaosPoint = _event.m.ChaosPoint - 1000;
							_event.m.ChaosItem = 3;
							return "ChaosGo";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Next Page",
					function getResult( _event )
					{
						return "Start1C2";
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
		this.m.Screens.push({
			ID = "Start1C2",
			Text = "You can use Chaos Crystals to purchase special items.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Promising Mercenary (3500)",
					function getResult( _event )
					{
						if (_event.m.ChaosPoint >= 3500)
						{
							_event.m.ChaosPoint = _event.m.ChaosPoint - 3500;
							return "NewbroA";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "An audience with the Grand Finale (9999)",
					function getResult( _event )
					{
						if (_event.m.ChaosPoint >= 9999)
						{
							return "FinaleBattle";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Next Page",
					function getResult( _event )
					{
						return "Start1C1";
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
//DivineShop + MakingItem////
		this.m.Screens.push({
			ID = "Start2D1",
			Text = "What will you do?",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Donate",
					function getResult( _event )
					{
						return "Start2D2";
					}
				},
				{
					Text = "Buy",
					function getResult( _event )
					{
						return "Start2D3";
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
		this.m.Screens.push({
			ID = "Start2D2",
			Text = "You can earn at least 1 Divine Crystal through donations, and more Divine Crystals will be earned based on the following conditions.\n\n[color=#56e64c]Donate 5000 crowns[/color]: 50% chance to earn 1~100 Divine Crystals.\n\n[color=#56e64c]Donate Skill Book[/color]: 25% chance to earn 200 Divine Crystals.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Donate 5000 crowns",
					function getResult( _event )
					{
						if (this.World.Assets.getMoney() >= 5000)
						{
							this.World.Assets.addMoney(-5000);
							this.Sound.play(this.Const.Sound.MoneyTransaction[this.Math.rand(0, this.Const.Sound.MoneyTransaction.len() - 1)], 1.2);
							if (this.Math.rand(1, 100) <= 50)
							{
								_event.m.DivinePoint = _event.m.DivinePoint + this.Math.rand(1, 100);
							}
							_event.m.DivinePoint = _event.m.DivinePoint + 1;
							return "Start2D2";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Donate Skill Book",
					function getResult( _event )
					{
						local stash = this.World.Assets.getStash().getItems();
						local ticketA = 0;
						local ticketAX = 1;
						foreach( item in stash )
						{
							if (item != null)
							{
								if (item.getID() == "misc.xxsbook")
								{
									ticketA = ++ticketA;
								}
							}
						}
						if (ticketA >= ticketAX)
						{
							foreach( item in stash )
							{
								if (item != null)
								{
									if (item.getID() == "misc.xxsbook" && ticketAX >= 1)
									{
										ticketAX = ticketAX - 1;
										this.World.Assets.getStash().removeByID("misc.xxsbook");
									}
								}
							}
						}
						if (ticketAX <= 0)
						{
							this.Sound.play(this.Const.Sound.MoneyTransaction[this.Math.rand(0, this.Const.Sound.MoneyTransaction.len() - 1)], 1.2);
							if (this.Math.rand(1, 4) == 3)
							{
								_event.m.DivinePoint = _event.m.DivinePoint + 200;
							}
							_event.m.DivinePoint = _event.m.DivinePoint + 1;
							return "Start2D2";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
		this.m.Screens.push({
			ID = "Start2D3",
			Text = "You can use Divine Crystals to purchase special items.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Mystery Box (25)",
					function getResult( _event )
					{
						if (_event.m.DivinePoint >= 25)
						{
							_event.m.DivinePoint = _event.m.DivinePoint - 25;
							_event.m.ChaosItem = 100;
							return "ChaosGo";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Epic Skill BooK (800)",
					function getResult( _event )
					{
						if (_event.m.DivinePoint >= 800)
						{
							_event.m.DivinePoint = _event.m.DivinePoint - 800;
							_event.m.ChaosItem = 101;
							return "ChaosGo";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Panacea Waterskin (400)",
					function getResult( _event )
					{
						if (_event.m.DivinePoint >= 400)
						{
							_event.m.DivinePoint = _event.m.DivinePoint - 400;
							_event.m.ChaosItem = 102;
							return "ChaosGo";
						}
						else
						{
							return "Getout";
						}
					}
				},
				{
					Text = "Exit",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#e6b71e]" + this.World.Assets.getMoney() + "[/color] crowns"
				});
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#bea8ff]" + _event.m.ChaosPoint + "[/color] chaos crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#a6e7ff]" + _event.m.DivinePoint + "[/color] divine crystals"
				});
				this.List.push({
					id = 12,
					icon = "ui/icons/asset_money.png",
					text = "You have [color=#abf2a7]" + _event.m.TimePoint + "[/color] daily action point"
				});
			}
		});
		this.m.Screens.push({
			ID = "ChaosGo",
			Text = "[img]gfx/ui/events/event_112.png[/img]{You select a sealed box containing an item and pay the price.%SPEECH_ON%Well, here it is.%SPEECH_OFF%}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Thanks",
					function getResult( _event )
					{
						if (_event.m.ChaosItem >= 100)
						{
							_event.m.ChaosItem = 0;
							return "Start2D3";
						}
						else
						{
							_event.m.ChaosItem = 0;
							return "Start1C1";
						}
					}
				}
			],
			function start( _event )
			{
				this.World.Assets.getStash().makeEmptySlots(1);
				local weapons = [
					"misc/xxu_armor",
					"misc/xxu_helmet",
					"misc/xxu_weapon"
				];
				if (_event.m.ChaosItem == 2)
				{
					weapons = [
					"misc/xx11_lvlpotion",
					"misc/xxpotion_of_oblivion_item",
					"special/fountain_of_youth_item",
					"accessory/xx_potion_nice",
					"special/spiritual_reward_item"
					];
				}
				else if (_event.m.ChaosItem == 3)
				{
					weapons = [
						"weapons/named/named_axe",
						"weapons/named/named_billhook",
						"weapons/named/named_cleaver",
						"weapons/named/named_crossbow",
						"weapons/named/named_crypt_cleaver",
						"weapons/named/named_dagger",
						"weapons/named/named_flail",
						"weapons/named/named_goblin_falchion",
						"weapons/named/named_goblin_heavy_bow",
						"weapons/named/named_goblin_pike",
						"weapons/named/named_goblin_spear",
						"weapons/named/named_greataxe",
						"weapons/named/named_greatsword",
						"weapons/named/named_javelin",
						"weapons/named/named_khopesh",
						"weapons/named/named_longaxe",
						"weapons/named/named_mace",
						"weapons/named/named_orc_axe",
						"weapons/named/named_orc_cleaver",
						"weapons/named/named_pike",
						"weapons/named/named_spear",
						"weapons/named/named_sword",
						"weapons/named/named_warhammer",
						"weapons/named/named_throwing_axe",
						"weapons/named/named_warbow",
						"weapons/named/named_warbrand",
						"weapons/named/named_warhammer",
						"weapons/named/named_warscythe"
					];
					if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
					{
						weapons.extend([
						"weapons/named/named_bardiche",
						"weapons/named/named_battle_whip",
						"weapons/named/named_bladed_pike",
						"weapons/named/named_fencing_sword",
						"weapons/named/named_handgonne",
						"weapons/named/named_heavy_rusty_axe",
						"weapons/named/named_polehammer",
						"weapons/named/named_polemace",
						"weapons/named/named_qatal_dagger",
						"weapons/named/named_rusty_warblade",
						"weapons/named/named_shamshir",
						"weapons/named/named_skullhammer",
						"weapons/named/named_spetum",
						"weapons/named/named_swordlance",
						"weapons/named/named_three_headed_flail",
						"weapons/named/named_two_handed_flail",
						"weapons/named/named_two_handed_hammer",
						"weapons/named/named_two_handed_mace",
						"weapons/named/named_two_handed_scimitar",
						"weapons/named/named_two_handed_spiked_mace"
						]);
					}
					if ("LegendMod" in this.Const) {}	else
					{
						weapons.extend([
						"helmets/named/gold_and_black_turban",
						"helmets/named/golden_feathers_helmet",
						"helmets/named/heraldic_mail_helmet",
						"helmets/named/lindwurm_helmet",
						"helmets/named/named_conic_helmet_with_faceguard",
						"helmets/named/named_metal_bull_helmet",
						"helmets/named/named_metal_nose_horn_helmet",
						"helmets/named/named_metal_skull_helmet",
						"helmets/named/named_nordic_helmet_with_closed_mail",
						"helmets/named/named_steppe_helmet_with_mail",
						"helmets/named/nasal_feather_helmet",
						"helmets/named/norse_helmet",
						"helmets/named/red_and_gold_band_helmet",
						"helmets/named/sallet_green_helmet",
						"helmets/named/red_and_gold_band_helmet",
						"helmets/named/wolf_helmet",
						"armor/named/black_and_gold_armor",
						"armor/named/black_leather_armor",
						"armor/named/blue_studded_mail_armor",
						"armor/named/brown_coat_of_plates_armor",
						"armor/named/golden_scale_armor",
						"armor/named/green_coat_of_plates_armor",
						"armor/named/heraldic_mail_armor",
						"armor/named/leopard_armor",
						"armor/named/lindwurm_armor",
						"armor/named/named_bronze_armor",
						"armor/named/named_golden_lamellar_armor",
						"armor/named/named_noble_mail_armor",
						"armor/named/named_plated_fur_armor",
						"armor/named/named_sellswords_armor",
						"armor/named/named_skull_and_chain_armor",
						"shields/named/named_bandit_heater_shield",
						"shields/named/named_bandit_kite_shield",
						"shields/named/named_dragon_shield",
						"shields/named/named_full_metal_heater_shield",
						"shields/named/named_golden_round_shield",
						"shields/named/named_lindwurm_shield",
						"shields/named/named_orc_heavy_shield",
						"shields/named/named_red_white_shield",
						"shields/named/named_rider_on_horse_shield",
						"shields/named/named_sipar_shield",
						"shields/named/named_undead_heater_shield",
						"shields/named/named_undead_kite_shield"
						]);
					}
				}
				else if (_event.m.ChaosItem == 100)
				{
					weapons = [
					"tools/acid_flask_item",
					"tools/holy_water_item",
					"loot/growth_pearls_item",
					"loot/soul_splinter_item",
					"misc/snake_oil_item",
					"accessory/cat_potion_item",
					"accessory/iron_will_potion_item",
					"accessory/lionheart_potion_item",
					"accessory/night_vision_elixir_item",
					"accessory/recovery_potion_item",
					"misc/happy_powder_item",
					"misc/potion_of_knowledge_item",
					"misc/xxrecallstone",
					"misc/xx11_lvlpotion",
					"misc/xxpotion_of_oblivion_item",
					"special/fountain_of_youth_item",
					"special/bodily_reward_item"
					];
				}
				else if (_event.m.ChaosItem == 101)
				{
					weapons = [
					"misc/xxsbook_se"
					];
				}
				else if (_event.m.ChaosItem == 102)
				{
					weapons = [
					"special/fountain_of_youth_item"
					];
				}
				local item = this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]);
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
				});
			}
		});
//NormalBattle + Deffeat////
		this.m.Screens.push({
			ID = "Battle1",
			Text = "[img]gfx/ui/events/event_74.png[/img]{The Adventurers\' Guild is bustling with those seeking new challenges. By paying a commission fee, they can open a path to dangerous conflict zones through portal magic. There, adventurers will face powerful enemies. Triumph in battle and claim special rewards.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "It\'s time to work.",
					function getResult( _event )
					{
						this.World.Assets.addMoney(-500);
						local pp = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						pp.CombatID = "Event";
						pp.Music = [
						"music/noble_01.ogg",
						"music/noble_02.ogg",
						"music/undead_01.ogg",
						"music/undead_02.ogg",
						"music/undead_03.ogg",
						"music/orcs_01.ogg",
						"music/orcs_02.ogg",
						"music/orcs_03.ogg",
						"music/goblins_01.ogg",
						"music/goblins_02.ogg",
						"music/beasts_01.ogg",
						"music/beasts_02.ogg",
						"music/civilians_01.ogg"
						];
						pp.IsAutoAssigningBases = false;
						pp.IsWithoutAmbience = true;
						pp.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						local btile;
						local qq = this.Math.rand(0, 11);
						if (qq == 1)
						{
							pp.LocationTemplate.Template[0] = "tactical.graveyard";
						}
						else
						if (qq == 2)
						{
							pp.LocationTemplate.Template[0] = "tactical.ruins";
						}
						else
						if (qq == 3)
						{
							pp.LocationTemplate.Template[0] = "tactical.human_camp";
						}
						else
						if (qq == 4)
						{
							pp.LocationTemplate.Template[0] = "tactical.orc_camp";
						}
						else
						if (qq == 5)
						{
							pp.LocationTemplate.Template[0] = "tactical.goblin_camp";
						}
						else
						if (qq == 6)
						{
							pp.LocationTemplate.Template[0] = "tactical.barbarian_camp";
						}
						else
						if (qq == 7)
						{
							pp.TerrainTemplate = "tactical.steppe";
							pp.LocationTemplate.Template[0] = "tactical.southern_ruins";
						}
						else
						if (qq == 8)
						{
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_ruintown";
						}
						else
						if (qq == 9)
						{
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_knighttown";
						}
						else
						if (qq == 10)
						{
							pp.TerrainTemplate = "tactical.quarry";
						}
						else
						{
							btile = [
								"tactical.autumn",
								"tactical.forest",
								"tactical.forest_leaves",
								"tactical.forest_snow",
								"tactical.hills",
								"tactical.hills_snow",
								"tactical.hills_steppe",
								"tactical.hills_tundra",
								"tactical.mountain",
								"tactical.plains",
								"tactical.quarry",
								"tactical.steppe",
								"tactical.snow",
								"tactical.swamp",
								"tactical.tundra"
							];
							if (this.Const.DLC.Desert)
							{
								btile.push("tactical.desert");
								btile.push("tactical.hills_desert");
								btile.push("tactical.oasis");
								btile.push("tactical.sinkhole");
							}			
							pp.TerrainTemplate = btile[this.Math.rand(0, btile.len() - 1)];
						}
						if (this.Math.rand(1, 100) <= 35)
						{
							pp.BeforeDeploymentCallback = function ()
							{
								local size = this.Tactical.getMapSize();
								for( local x = 0; x < size.X; x = ++x )
								{
									for( local y = 0; y < size.Y; y = ++y )
									{
										local tile = this.Tactical.getTileSquare(x, y);
										tile.Level = this.Math.min(1, tile.Level);
									}
								}
							}
						}

						qq = this.Math.rand(1, 10);
						if (qq == 1)
						{
							pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Center;
							pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Circle;
						}
						else
						if (qq == 2)
						{
							local grass = this.Math.rand(1, 3);
							if (grass == 1)
							{
								pp.TerrainTemplate = "tactical.plains";
							}
							else if (grass == 2)
							{
								pp.TerrainTemplate = "tactical.steppe";
							}
							else
							{
								pp.TerrainTemplate = "tactical.tundra";
							}
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_knighttown";
							pp.LocationTemplate.Fortification = this.Math.rand(1, 5) == 2 ? this.Const.Tactical.FortificationType.WallsAndPalisade : this.Const.Tactical.FortificationType.Walls;
							pp.LocationTemplate.CutDownTrees = true;
							pp.LocationTemplate.ShiftX += 3;
							pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.LineBack;
							pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
							pp.BeforeDeploymentCallback = function ()
							{
								local size = this.Tactical.getMapSize();
								local tiletypemax = 0;
								for( local x = 0; x < size.X; x = ++x )
								{
									for( local y = 0; y < size.Y; y = ++y )
									{
										local tile = this.Tactical.getTileSquare(x, y);
										tile.Level = this.Math.min(0, tile.Level);
										tiletypemax = tiletypemax + 1;
										if (tiletypemax > 577)
										{
											if (this.Math.rand(1, 100) <= 95)
											{
												tile.setBrush("tile_road");
											}
											else
											{
												tile.setBrush("tile_autumn_04");
											}
											if (this.Math.rand(1, 100) <= 70)
											{
												tile.removeObject();
												tile.clear();
											}
										}
										else
										{
											if (this.Math.rand(1, 100) <= 80)
											{
												if (grass == 1)
												{
													tile.setBrush("tile_tundra_01");
												}
												else if (grass == 2)
												{
													tile.setBrush("tile_steppe_02");
												}
												else
												{
													tile.setBrush("tile_tundra_03");
												}
											}
											else
											{
												if (grass == 1)
												{
													tile.setBrush("tile_grass_02");
												}
												else if (grass == 2)
												{
													tile.setBrush("tile_steppe_01");
												}
												else
												{
													tile.setBrush("tile_tundra_04");
												}
											}
											if (this.Math.rand(1, 100) <= 70)
											{
												tile.removeObject();
												tile.clear();
											}
										}
										if (tiletypemax > 512 && tiletypemax < 545 && this.Math.rand(1, 100) <= 111)
										{
											tile.clear();
											tile.Type = 0;
											this.MapGen.get("tactical.tile.swampx1").onFirstPass({
												X = tile.SquareCoords.X,
												Y = tile.SquareCoords.Y,
												W = 1,
												H = 1,
												IsEmpty = true,
												SpawnObjects = false
											});
											tile.removeObject();
											tile.spawnDetail("steppe_stone_detail_0" + this.Math.rand(1, 9)).Scale = 0.9;
										}
										if (tiletypemax > 544 && tiletypemax < 556 && this.Math.rand(1, 100) <= 95)
										{
											tile.removeObject();
											tile.clear();
											local tt = tile.spawnObject("entity/tactical/objects/graveyard_wall");
											tt.getSprite("body").setBrush("graveyard_29_07");
										}
										if (tiletypemax > 560 && tiletypemax < 577 && this.Math.rand(1, 100) <= 95)
										{
											tile.removeObject();
											tile.clear();
											local tt = tile.spawnObject("entity/tactical/objects/graveyard_wall");
											tt.getSprite("body").setBrush("graveyard_29_07");
										}
									}
								}
							};
						}
						else
						if (qq == 3)
						{
							local grass = this.Math.rand(1, 3);
							if (grass == 1)
							{
								pp.TerrainTemplate = "tactical.plains";
							}
							else if (grass == 2)
							{
								pp.TerrainTemplate = "tactical.steppe";
							}
							else
							{
								pp.TerrainTemplate = "tactical.tundra";
							}
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_knighttown";
							pp.LocationTemplate.Fortification = this.Math.rand(1, 5) == 2 ? this.Const.Tactical.FortificationType.WallsAndPalisade : this.Const.Tactical.FortificationType.Walls;
							pp.LocationTemplate.CutDownTrees = true;
							pp.LocationTemplate.ShiftX += -1;
							pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.LineBack;
							pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
							pp.BeforeDeploymentCallback = function ()
							{
								local size = this.Tactical.getMapSize();
								local tiletypemax = 0;
								for( local x = 0; x < size.X; x = ++x )
								{
									for( local y = 0; y < size.Y; y = ++y )
									{
										local tile = this.Tactical.getTileSquare(x, y);
										tile.Level = this.Math.min(0, tile.Level);
										tiletypemax = tiletypemax + 1;
										if (tiletypemax < 385)
										{
											if (this.Math.rand(1, 100) <= 95)
											{
												tile.setBrush("tile_road");
											}
											else
											{
												tile.setBrush("tile_autumn_04");
											}
											if (this.Math.rand(1, 100) <= 70)
											{
												tile.removeObject();
												tile.clear();
											}
										}
										else
										{
											if (this.Math.rand(1, 100) <= 80)
											{
												if (grass == 1)
												{
													tile.setBrush("tile_tundra_01");
												}
												else if (grass == 2)
												{
													tile.setBrush("tile_steppe_02");
												}
												else
												{
													tile.setBrush("tile_tundra_03");
												}
											}
											else
											{
												if (grass == 1)
												{
													tile.setBrush("tile_grass_02");
												}
												else if (grass == 2)
												{
													tile.setBrush("tile_steppe_01");
												}
												else
												{
													tile.setBrush("tile_tundra_04");
												}
											}
											if (this.Math.rand(1, 100) <= 70)
											{
												tile.removeObject();
												tile.clear();
											}
										}
										if (tiletypemax > 352 && tiletypemax < 385 && this.Math.rand(1, 100) <= 111)
										{
											tile.clear();
											tile.Type = 0;
											this.MapGen.get("tactical.tile.swampx1").onFirstPass({
												X = tile.SquareCoords.X,
												Y = tile.SquareCoords.Y,
												W = 1,
												H = 1,
												IsEmpty = true,
												SpawnObjects = false
											});
											tile.removeObject();
											tile.spawnDetail("steppe_stone_detail_0" + this.Math.rand(1, 9)).Scale = 0.9;
										}
										if (tiletypemax > 320 && tiletypemax < 335 && this.Math.rand(1, 100) <= 95)
										{
											tile.removeObject();
											tile.clear();
											local tt = tile.spawnObject("entity/tactical/objects/graveyard_wall");
											tt.getSprite("body").setBrush("graveyard_29_06");
										}
										if (tiletypemax > 338 && tiletypemax < 353 && this.Math.rand(1, 100) <= 95)
										{
											tile.removeObject();
											tile.clear();
											local tt = tile.spawnObject("entity/tactical/objects/graveyard_wall");
											tt.getSprite("body").setBrush("graveyard_29_06");
										}
									}
								}
							};
						}
						else
						if (qq == 4)
						{
							local grass = this.Math.rand(1, 3);
							if (grass == 1)
							{
								pp.TerrainTemplate = "tactical.plains";
							}
							else if (grass == 2)
							{
								pp.TerrainTemplate = "tactical.steppe";
							}
							else
							{
								pp.TerrainTemplate = "tactical.tundra";
							}
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_knighttown";
							pp.LocationTemplate.Fortification = this.Math.rand(1, 5) == 2 ? this.Const.Tactical.FortificationType.WallsAndPalisade : this.Const.Tactical.FortificationType.Walls;
							pp.LocationTemplate.CutDownTrees = true;
							pp.LocationTemplate.ShiftX += -1;
							pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
							pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
							pp.BeforeDeploymentCallback = function ()
							{
								local size = this.Tactical.getMapSize();
								local tiletypemax = 0;
								for( local x = 0; x < size.X; x = ++x )
								{
									for( local y = 0; y < size.Y; y = ++y )
									{
										local tile = this.Tactical.getTileSquare(x, y);
										tile.Level = this.Math.min(0, tile.Level);
										tiletypemax = tiletypemax + 1;
										if (tiletypemax < 481)
										{
											if (this.Math.rand(1, 100) <= 95)
											{
												tile.setBrush("tile_road");
											}
											else
											{
												tile.setBrush("tile_autumn_04");
											}
											if (this.Math.rand(1, 100) <= 70)
											{
												tile.removeObject();
												tile.clear();
											}
										}
										else
										{
											if (this.Math.rand(1, 100) <= 80)
											{
												if (grass == 1)
												{
													tile.setBrush("tile_tundra_01");
												}
												else if (grass == 2)
												{
													tile.setBrush("tile_steppe_02");
												}
												else
												{
													tile.setBrush("tile_tundra_03");
												}
											}
											else
											{
												if (grass == 1)
												{
													tile.setBrush("tile_grass_02");
												}
												else if (grass == 2)
												{
													tile.setBrush("tile_steppe_01");
												}
												else
												{
													tile.setBrush("tile_tundra_04");
												}
											}
											if (this.Math.rand(1, 100) <= 70)
											{
												tile.removeObject();
												tile.clear();
											}
										}
										if (tiletypemax > 480 && tiletypemax < 513 && this.Math.rand(1, 100) <= 111)
										{
											tile.clear();
											tile.Type = 0;
											this.MapGen.get("tactical.tile.swamp1").onFirstPass({
												X = tile.SquareCoords.X,
												Y = tile.SquareCoords.Y,
												W = 1,
												H = 1,
												IsEmpty = true,
												SpawnObjects = false
											});
											tile.removeObject();
											tile.spawnDetail("steppe_stone_detail_0" + this.Math.rand(1, 9)).Scale = 0.9;
										}
										if (tiletypemax > 448 && tiletypemax < 463 && this.Math.rand(1, 100) <= 95)
										{
											tile.removeObject();
											tile.clear();
											local tt = tile.spawnObject("entity/tactical/objects/graveyard_wall");
											tt.getSprite("body").setBrush("graveyard_29_06");
										}
										if (tiletypemax > 466 && tiletypemax < 481 && this.Math.rand(1, 100) <= 95)
										{
											tile.removeObject();
											tile.clear();
											local tt = tile.spawnObject("entity/tactical/objects/graveyard_wall");
											tt.getSprite("body").setBrush("graveyard_29_06");
										}
									}
								}
							};
						}
						else
						{
							pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
							pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
						}

						pp.Entities = [];
						local bbb = this.Math.rand(1, 8);
						local moba;
						if (bbb == 1 || bbb == 2)
						{
							local ivi = this.Math.rand(1, 4);
							if (ivi == 3 || ivi == 4)
							{
								moba = [
									"scripts/entity/tactical/enemies/xxmob_clone",
									"scripts/entity/tactical/enemies/xxmob_darkman",
									"scripts/entity/tactical/enemies/xxmob_syndicate",
									"scripts/entity/tactical/enemies/xxmob_hunscaptain",
									"scripts/entity/tactical/enemies/xxmob_wokousamurai",
									"scripts/entity/tactical/enemies/xxmob_cultchamp",
									"scripts/entity/tactical/enemies/xxmob_subzero",
									"scripts/entity/tactical/enemies/xxmob_mage",
									"scripts/entity/tactical/enemies/xxmob_shaolin",
									"scripts/entity/tactical/enemies/xxmob_elfsword",
									"scripts/entity/tactical/enemies/xxmob_horseman_b",
									"scripts/entity/tactical/enemies/xxmob_battlemaster",
									"scripts/entity/tactical/enemies/xxmob_battlemaster",
									"scripts/entity/tactical/enemies/xxmob_battlemaster",
									"scripts/entity/tactical/enemies/xxmob_minderking"
								];
							}
							else
							{
								moba = [
									"scripts/entity/tactical/enemies/xxmob_orchunter",
									"scripts/entity/tactical/enemies/xxmob_alp",
									"scripts/entity/tactical/enemies/xxmob_arcane",
									"scripts/entity/tactical/enemies/xxmob_blackorc",
									"scripts/entity/tactical/enemies/xxmob_bear",
									"scripts/entity/tactical/enemies/xxmob_fungal_b",
									"scripts/entity/tactical/enemies/xxmob_goblin",
									"scripts/entity/tactical/enemies/xxmob_vampguard",
									"scripts/entity/tactical/enemies/xxmob_abomi",
									"scripts/entity/tactical/enemies/xxmob_hellranger",
									"scripts/entity/tactical/enemies/xxmob_dullahan",
									"scripts/entity/tactical/enemies/xxmob_beast",
									"scripts/entity/tactical/enemies/xxmob_jinn",
									"scripts/entity/tactical/enemies/xxmob_vamp",
									"scripts/entity/tactical/enemies/xxmob_mino",
									"scripts/entity/tactical/enemies/xxmob_minderking"
								];
							}
							moba = moba[this.Math.rand(0, moba.len() - 1)];
							for( local i = 0; i < 1; i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = 0,
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
							if (ivi == 3 || ivi == 4)
							{
								moba = [
									"scripts/entity/tactical/enemies/xxmob_execut",
									"scripts/entity/tactical/enemies/xxmob_cultist",
									"scripts/entity/tactical/enemies/xxmob_smasher",
									"scripts/entity/tactical/enemies/xxmob_horseman_a",
									"scripts/entity/tactical/enemies/xxmob_witchhunter",
									"scripts/entity/tactical/enemies/xxmob_hwarang",
									"scripts/entity/tactical/enemies/xxmob_wokou",
									"scripts/entity/tactical/enemies/xxmob_huns",
									"scripts/entity/tactical/enemies/xxmob_elf",
									"scripts/entity/tactical/humans/mercenary",
									"scripts/entity/tactical/humans/bounty_hunter",
									"scripts/entity/tactical/humans/cultist",
									"scripts/entity/tactical/humans/noble_footman",
									"scripts/entity/tactical/humans/noble_billman",
									"scripts/entity/tactical/humans/noble_greatsword",
									"scripts/entity/tactical/enemies/xxmob_minder"
								];
								if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
								{
									moba.push("scripts/entity/tactical/humans/conscript_polearm");
									moba.push("scripts/entity/tactical/humans/barbarian_marauder");
								}
							}
							else
							{
								moba = [
									"scripts/entity/tactical/enemies/xxmob_longbug",
									"scripts/entity/tactical/enemies/xxmob_bat",
									"scripts/entity/tactical/enemies/xxmob_boar",
									"scripts/entity/tactical/enemies/xxmob_whitewolf",
									"scripts/entity/tactical/enemies/xxmob_slime_b",
									"scripts/entity/tactical/enemies/xxmob_spiderdemon",
									"scripts/entity/tactical/enemies/xxmob_toad",
									"scripts/entity/tactical/enemies/xxmob_lion",
									"scripts/entity/tactical/enemies/xxmob_bloodsucker",
									"scripts/entity/tactical/enemies/xxmob_liger",
									"scripts/entity/tactical/enemies/xxmob_wrider_wolf",
									"scripts/entity/tactical/enemies/xxmob_orclong",
									"scripts/entity/tactical/enemies/xxmob_goblinranger",
									"scripts/entity/tactical/enemies/direwolf",
									"scripts/entity/tactical/enemies/direwolf_high",
									"scripts/entity/tactical/enemies/ghoul",
									"scripts/entity/tactical/enemies/ghoul_medium",
									"scripts/entity/tactical/enemies/zombie_knight",
									"scripts/entity/tactical/enemies/zombie_betrayer",
									"scripts/entity/tactical/enemies/zombie_treasure_hunter",
									"scripts/entity/tactical/enemies/skeleton_heavy",
									"scripts/entity/tactical/enemies/skeleton_heavy_polearm",
									"scripts/entity/tactical/enemies/goblin_fighter",
									"scripts/entity/tactical/enemies/goblin_wolfrider",
									"scripts/entity/tactical/enemies/orc_young",
									"scripts/entity/tactical/enemies/orc_warrior",
									"scripts/entity/tactical/enemies/orc_berserker",
									"scripts/entity/tactical/enemies/xxmob_minder"
								];
								if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
								{
									moba.push("scripts/entity/tactical/enemies/hyena_high");
								}
							}
							moba = moba[this.Math.rand(0, moba.len() - 1)];
							for( local i = 0; i < this.Math.rand(8, 9); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = this.Math.rand(0, 1),
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
							moba = [
								"scripts/entity/tactical/enemies/xxmob_longbug",
								"scripts/entity/tactical/enemies/xxmob_bat",
								"scripts/entity/tactical/enemies/xxmob_boar",
								"scripts/entity/tactical/enemies/xxmob_execut",
								"scripts/entity/tactical/enemies/xxmob_cultist",
								"scripts/entity/tactical/enemies/xxmob_smasher",
								"scripts/entity/tactical/enemies/xxmob_whitewolf",
								"scripts/entity/tactical/enemies/xxmob_minder",
								"scripts/entity/tactical/enemies/xxmob_horseman_a",
								"scripts/entity/tactical/enemies/xxmob_witchhunter",
								"scripts/entity/tactical/enemies/xxmob_slime_b",
								"scripts/entity/tactical/enemies/xxmob_hwarang",
								"scripts/entity/tactical/enemies/xxmob_wokou",
								"scripts/entity/tactical/enemies/xxmob_spiderdemon",
								"scripts/entity/tactical/enemies/xxmob_toad",
								"scripts/entity/tactical/enemies/xxmob_huns",
								"scripts/entity/tactical/enemies/xxmob_lion",
								"scripts/entity/tactical/enemies/xxmob_bloodsucker",
								"scripts/entity/tactical/enemies/xxmob_liger",
								"scripts/entity/tactical/enemies/xxmob_elf",
								"scripts/entity/tactical/enemies/xxmob_wrider_wolf",
								"scripts/entity/tactical/enemies/xxmob_orclong",
								"scripts/entity/tactical/enemies/xxmob_goblinranger",
								"scripts/entity/tactical/humans/mercenary",
								"scripts/entity/tactical/humans/mercenary_ranged",
								"scripts/entity/tactical/humans/bounty_hunter",
								"scripts/entity/tactical/humans/bounty_hunter_ranged",
								"scripts/entity/tactical/humans/cultist",
								"scripts/entity/tactical/humans/noble_arbalester",
								"scripts/entity/tactical/humans/noble_footman",
								"scripts/entity/tactical/humans/noble_billman",
								"scripts/entity/tactical/humans/noble_greatsword",
								"scripts/entity/tactical/enemies/direwolf",
								"scripts/entity/tactical/enemies/direwolf_high",
								"scripts/entity/tactical/enemies/ghoul",
								"scripts/entity/tactical/enemies/ghoul_medium",
								"scripts/entity/tactical/enemies/zombie_knight",
								"scripts/entity/tactical/enemies/zombie_betrayer",
								"scripts/entity/tactical/enemies/zombie_treasure_hunter",
								"scripts/entity/tactical/enemies/skeleton_heavy",
								"scripts/entity/tactical/enemies/skeleton_heavy_polearm",
								"scripts/entity/tactical/enemies/vampire",
								"scripts/entity/tactical/enemies/vampire_low",
								"scripts/entity/tactical/enemies/goblin_fighter",
								"scripts/entity/tactical/enemies/goblin_wolfrider",
								"scripts/entity/tactical/enemies/goblin_ambusher",
								"scripts/entity/tactical/enemies/orc_young",
								"scripts/entity/tactical/enemies/orc_warrior",
								"scripts/entity/tactical/enemies/orc_berserker"
							];
							if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
							{
								moba.push("scripts/entity/tactical/humans/conscript_polearm");
								moba.push("scripts/entity/tactical/humans/barbarian_marauder");
								moba.push("scripts/entity/tactical/enemies/sand_golem");
								moba.push("scripts/entity/tactical/enemies/sand_golem_medium");
								moba.push("scripts/entity/tactical/enemies/serpent");
								moba.push("scripts/entity/tactical/enemies/hyena_high");
							}
							moba = moba[this.Math.rand(0, moba.len() - 1)];
							for( local i = 0; i < this.Math.rand(2, 4); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = 1,
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
						}
						else if (bbb == 3 || bbb == 4)
						{
							moba = [
								"scripts/entity/tactical/enemies/xxmob_orchunter",
								"scripts/entity/tactical/enemies/xxmob_darkman",
								"scripts/entity/tactical/enemies/xxmob_horseman_b",
								"scripts/entity/tactical/enemies/xxmob_alp",
								"scripts/entity/tactical/enemies/xxmob_arcane",
								"scripts/entity/tactical/enemies/xxmob_elfsword",
								"scripts/entity/tactical/enemies/xxmob_blackorc",
								"scripts/entity/tactical/enemies/xxmob_bear",
								"scripts/entity/tactical/enemies/xxmob_clone",
								"scripts/entity/tactical/enemies/xxmob_wokousamurai",
								"scripts/entity/tactical/enemies/xxmob_fungal_b",
								"scripts/entity/tactical/enemies/xxmob_shaolin",
								"scripts/entity/tactical/enemies/xxmob_hunscaptain",
								"scripts/entity/tactical/enemies/xxmob_syndicate",
								"scripts/entity/tactical/enemies/xxmob_goblin",
								"scripts/entity/tactical/enemies/xxmob_vampguard",
								"scripts/entity/tactical/enemies/xxmob_abomi",
								"scripts/entity/tactical/enemies/xxmob_hellranger",
								"scripts/entity/tactical/enemies/xxmob_dullahan",
								"scripts/entity/tactical/enemies/xxmob_cultchamp",
								"scripts/entity/tactical/enemies/xxmob_mage",
								"scripts/entity/tactical/enemies/xxmob_beast",
								"scripts/entity/tactical/enemies/xxmob_mino"
							];
							moba = moba[this.Math.rand(0, moba.len() - 1)];
							for( local i = 0; i < this.Math.rand(6, 7); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = 0,
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
						}
						else if (bbb == 5 || bbb == 6)
						{
							moba = [
								"scripts/entity/tactical/enemies/xxmob_longbug",
								"scripts/entity/tactical/enemies/xxmob_bat",
								"scripts/entity/tactical/enemies/xxmob_boar",
								"scripts/entity/tactical/enemies/xxmob_execut",
								"scripts/entity/tactical/enemies/xxmob_cultist",
								"scripts/entity/tactical/humans/mercenary_ranged",
								"scripts/entity/tactical/humans/mercenary_ranged",
								"scripts/entity/tactical/enemies/xxmob_witchhunter",
								"scripts/entity/tactical/enemies/xxmob_goblinranger",
								"scripts/entity/tactical/enemies/xxmob_orclong",
								"scripts/entity/tactical/enemies/xxmob_whitewolf",
								"scripts/entity/tactical/enemies/xxmob_minder",
								"scripts/entity/tactical/enemies/xxmob_horseman_a",
								"scripts/entity/tactical/enemies/xxmob_slime_b",
								"scripts/entity/tactical/enemies/xxmob_hwarang",
								"scripts/entity/tactical/enemies/xxmob_spiderdemon",
								"scripts/entity/tactical/enemies/xxmob_toad",
								"scripts/entity/tactical/enemies/xxmob_huns",
								"scripts/entity/tactical/enemies/xxmob_lion",
								"scripts/entity/tactical/enemies/xxmob_bloodsucker",
								"scripts/entity/tactical/enemies/xxmob_liger",
								"scripts/entity/tactical/enemies/xxmob_elf",
								"scripts/entity/tactical/enemies/xxmob_wrider_wolf"
							];
							local ivi = this.Math.rand(0, moba.len() - 1);
							moba = moba[ivi];
							for( local i = 0; i < this.Math.rand(6, 7); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = 1,
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
							moba = [
								"scripts/entity/tactical/enemies/xxmob_longbug",
								"scripts/entity/tactical/enemies/xxmob_bat",
								"scripts/entity/tactical/enemies/xxmob_boar",
								"scripts/entity/tactical/enemies/xxmob_execut",
								"scripts/entity/tactical/enemies/xxmob_cultist",
								"scripts/entity/tactical/enemies/xxmob_smasher",
								"scripts/entity/tactical/enemies/xxmob_wokou",
								"scripts/entity/tactical/humans/mercenary",
								"scripts/entity/tactical/enemies/xxmob_wrider_wolf",
								"scripts/entity/tactical/enemies/orc_warrior",
								"scripts/entity/tactical/enemies/xxmob_whitewolf",
								"scripts/entity/tactical/enemies/xxmob_minder",
								"scripts/entity/tactical/enemies/xxmob_horseman_a",
								"scripts/entity/tactical/enemies/xxmob_slime_b",
								"scripts/entity/tactical/enemies/xxmob_hwarang",
								"scripts/entity/tactical/enemies/xxmob_spiderdemon",
								"scripts/entity/tactical/enemies/xxmob_toad",
								"scripts/entity/tactical/enemies/xxmob_huns",
								"scripts/entity/tactical/enemies/xxmob_lion",
								"scripts/entity/tactical/enemies/xxmob_bloodsucker",
								"scripts/entity/tactical/enemies/xxmob_liger",
								"scripts/entity/tactical/enemies/xxmob_elf",
								"scripts/entity/tactical/enemies/xxmob_wrider_wolf"
							];
							moba = moba[ivi];
							for( local i = 0; i < this.Math.rand(6, 7); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = 0,
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
						}
						else if (bbb == 7 && this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
						{
							moba = [
								"scripts/entity/tactical/enemies/orc_warlord",
								"scripts/entity/tactical/enemies/goblin_shaman",
								"scripts/entity/tactical/enemies/xxmob_barbarian_elder",
								"scripts/entity/tactical/humans/barbarian_chosen",
								"scripts/entity/tactical/enemies/xxmob_necromancer",
								"scripts/entity/tactical/enemies/necromancer",
								"scripts/entity/tactical/enemies/xxmob_hexe",
								"scripts/entity/tactical/enemies/hexe",
								"scripts/entity/tactical/enemies/skeleton_priest"
							];
							local ivi = this.Math.rand(0, moba.len() - 1);
							moba = moba[ivi];				
							pp.Entities.push({
								ID = this.Const.EntityType.AlpShadow,
								Variant = 0,
								Row = 2,
								Script = moba,
								Faction = this.Const.Faction.Enemy
							});
							moba = [
								"scripts/entity/tactical/enemies/orc_warrior",
								"scripts/entity/tactical/enemies/orc_warrior",
								"scripts/entity/tactical/humans/barbarian_marauder",
								"scripts/entity/tactical/humans/barbarian_marauder",
								"scripts/entity/tactical/enemies/zombie_knight",
								"scripts/entity/tactical/enemies/zombie_knight",
								"scripts/entity/tactical/enemies/bandit_raider_wolf",
								"scripts/entity/tactical/enemies/bandit_raider_wolf",
								"scripts/entity/tactical/enemies/zombie_treasure_hunter"
							];
							moba = moba[ivi];
							for( local i = 0; i < this.Math.rand(7, 8); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = this.Math.rand(0, 1),
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
							moba = [
								"scripts/entity/tactical/enemies/xxmob_goblinranger",
								"scripts/entity/tactical/enemies/xxmob_goblinranger",
								"scripts/entity/tactical/humans/barbarian_champion",
								"scripts/entity/tactical/humans/barbarian_champion",
								"scripts/entity/tactical/enemies/zombie_betrayer",
								"scripts/entity/tactical/enemies/zombie_betrayer",
								"scripts/entity/tactical/enemies/skeleton_heavy_polearm",
								"scripts/entity/tactical/enemies/skeleton_heavy_polearm",
								"scripts/entity/tactical/enemies/xxmob_vampguard"
							];
							moba = moba[ivi];
							for( local i = 0; i < this.Math.rand(4, 5); i = ++i )
							{
								pp.Entities.push({
									ID = this.Const.EntityType.AlpShadow,
									Variant = 0,
									Row = this.Math.rand(0, 1),
									Script = moba,
									Faction = this.Const.Faction.Enemy
								});
							}
						}
						else
						{
							local xtroops = [
								this.Const.World.Spawn.BanditsDisguisedAsDirewolves,
								this.Const.World.Spawn.BanditBoss,
								this.Const.World.Spawn.BanditRaiders,
								this.Const.World.Spawn.BountyHunters,
								this.Const.World.Spawn.Mercenaries,
								this.Const.World.Spawn.Noble,
								this.Const.World.Spawn.Cultists,
								this.Const.World.Spawn.UndeadScourge,
								this.Const.World.Spawn.NecromancerSouthern,
								this.Const.World.Spawn.Zombies,
								this.Const.World.Spawn.UndeadArmy,
								this.Const.World.Spawn.GreenskinHorde,
								this.Const.World.Spawn.OrcBoss,
								this.Const.World.Spawn.GoblinBoss,
								this.Const.World.Spawn.Direwolves,
								this.Const.World.Spawn.Ghouls,
								this.Const.World.Spawn.Unhold,
								this.Const.World.Spawn.UnholdBog
							];
							if (this.Const.DLC.Desert && this.Const.DLC.Wildmen)
							{
								xtroops.push(this.Const.World.Spawn.Barbarians);
								xtroops.push(this.Const.World.Spawn.Southern);
								xtroops.push(this.Const.World.Spawn.Assassins);
								xtroops.push(this.Const.World.Spawn.NomadRaiders);
							}
							this.Const.World.Common.addUnitsToCombat(pp.Entities, xtroops[this.Math.rand(0, xtroops.len() - 1)], this.Math.rand(300, 600), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getID());
						}
						if (this.World.Statistics.getFlags().getAsInt("XXADVWIN") > 5 && this.Math.rand(1, 100) <= 16)
						{
							_event.registerToShowAfterCombat("FightThiefRdy", "Defeat");
						}
						else	if (this.Math.rand(1, 100) <= 20)
						{
							_event.registerToShowAfterCombat("Victory_A", "Defeat");
						}
						else
						{
							_event.registerToShowAfterCombat("Victory", "Defeat");
						}
						this.World.State.startScriptedCombat(pp, false, false, true);
						return 0;
					}
				},
				{
					Text = "Not ready yet.",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
				_event.m.Title = "Adventure Portal";
			}
		});
		this.m.Screens.push({
			ID = "FightThiefRdy",
			Text = "[img]gfx/ui/events/event_07.png[/img]{A group of armed men block your path. They say you ruined their business and want you to hand over the trophy. | A group of armed men step out onto the road. One of them points at the trophy.%SPEECH_ON%How dare you touch our prey? I\'ll let you go this time, so drop the trophy and get out!%SPEECH_OFF% | A sharp whistle draws the attention of you and your men. You turn to the side of the road to see a group of men emerging from some bushes. Everyone draws their weapons, but the strangers don\'t move a foot further. Their ringleader steps forward.%SPEECH_ON%Hello fellas. We here are bounty hunters, if you couldn\'t tell, and I do believe you have one of our bounties. Now if you could please hand it over, that\'d sit pretty well with me and my friends.%SPEECH_OFF%Tapping the hilt of his sword, the man grins.%SPEECH_ON%It\'s only a matter of business. I\'m sure you understand.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "If you want it, come and take it!",
					function getResult( _event )
					{
						return "FightThiefFight";
					}
				},
				{
					Text = "It\'s not worth dying over. Take that damn the trophy and be gone.",
					function getResult( _event )
					{
						return "FightThiefRun";
					}
				}
			],
			function start( _event )
			{
			}
		});
		this.m.Screens.push({
			ID = "FightThiefFight",
			Text = "[img]gfx/ui/events/event_07.png[/img]{They don\'t want to talk anymore. A battle seems inevitable.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Prepare for battle!",
					function getResult( _event )
					{
						local p = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						p.CombatID = "Event";
						p.Music = this.Const.Music.NobleTracks;
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
						if (this.Math.rand(1, 100) <= 30)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BanditsDisguisedAsDirewolves, this.Math.rand(300, 500), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getID());
						}
						else if (this.Math.rand(1, 100) <= 50)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BanditRaiders, this.Math.rand(300, 500), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getID());
						}
						else if (this.Math.rand(1, 100) <= 50)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BountyHunters, this.Math.rand(300, 500), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getID());
						}
						else
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.Mercenaries, this.Math.rand(300, 500), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getID());
						}
						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, true);
						return 0;
					}
				}
			],
			function start( _event )
			{
			}
		});
		this.m.Screens.push({
			ID = "FightThiefRun",
			Text = "[img]gfx/ui/events/event_07.png[/img]{Not wanting a fight, you hand the trophy over. They laugh at you as you leave.%SPEECH_ON%A wise choice, loser!%SPEECH_OFF% | The trophy is not as valuable as the lives of your men. You hand over the trophy with a hard expression.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Damn it!",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
			}
		});
		this.m.Screens.push({
			ID = "Victory_A",
			Text = "[img]gfx/ui/events/event_22.png[/img]{With the battle drawing to a close, a few enemies beg for mercy. %randombrother% looks to you for what to do next. | The battle is over, but some surviving enemies await your mercy.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Kill them all.",
					function getResult( _event )
					{
						this.World.Assets.addMoralReputation(-2);
						return "Victory";
					}
				},
				{
					Text = "Chase them away.",
					function getResult( _event )
					{
						this.World.Assets.addMoralReputation(2);
						return "Victory";
					}
				}
			],
			function start( _event )
			{
			}
		});
		this.m.Screens.push({
			ID = "Victory",
			Text = "[img]gfx/ui/events/event_62.png[/img]{After the battle ended, %companyname% collected the rewards and returned to the village.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It was worth it.",
					function getResult( _event )
					{
						this.Const.Sound.Volume.Arena = 0.6;
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.World.Statistics.getFlags().increment("XXADVWIN", 1);
				local weapons;
				local item;
				this.World.Assets.getStash().makeEmptySlots(2);
				weapons = [
					"misc/xxsbook",
					"misc/xxchaospotion"
				];
				item = this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]);
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
				});
				weapons = [
						"accessory/cat_potion_item",
						"accessory/iron_will_potion_item",
						"accessory/lionheart_potion_item",
						"accessory/night_vision_elixir_item",
						"accessory/recovery_potion_item",
						"misc/happy_powder_item",
						"misc/xxrecallstone",
						"misc/xxrecallstone",
						"misc/xxrecallstone",
						"misc/xxrecallstone",
						"misc/xxrecallstone",
						"special/fountain_of_youth_item",
						"special/bodily_reward_item"
				];
				if ("LegendMod" in this.Const) {}	else
				{
					weapons.extend([
						"helmets/xxhat_hairband",
						"helmets/xxhat_hunshat",
						"helmets/xxhat_hunshelm",
						"helmets/xxhat_hwaranghat",
						"helmets/xxhat_kasa",
						"helmets/xxhat_samurai",
						"helmets/xxknighthelm",
						"armor/xxdress"
						"armor/xxmonkrobe",
						"armor/xxwokoulightarmor",
						"armor/xxsamuraiarmor"
					]);
				}
				weapons.push("misc/potion_of_knowledge_item");
				item = this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]);
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 11,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
				});
			}
		});
		this.m.Screens.push({
			ID = "Defeat",
			Text = "[img]gfx/ui/events/event_88.png[/img]{%companyname% was defeated in the battle, and the surviving members barely fled.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Damn it!",
					function getResult( _event )
					{
						this.Const.Sound.Volume.Arena = 0.6;
						return 0;
					}
				}
			],
			function start( _event )
			{
			}
		});
//HardBattle + NewBrro////
		this.m.Screens.push({
			ID = "Battle2",
			Text = "[img]gfx/ui/events/event_89.png[/img]{The Chaos Portal leads to conflict zones inhabited by even more dangerous and hostile entities. In this place, phenomena occur that defy the laws and logic of our world, making every moment a perilous one. However, victory in battle here will reward you with rare and highly valuable treasures.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It\'s time to work.",
					function getResult( _event )
					{
						local aaaxx = this.World.Statistics.getFlags().getAsInt("aaaxx");
						local pp = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						if (aaaxx > 1)
						{
							local brothers = this.World.getPlayerRoster().getAll();
							foreach( bro in brothers )
							{
								bro.getSkills().removeByID("effects.ai_ddebuff_effect");
								local debuff = this.new("scripts/skills/effects/ai_ddebuff_effect");								
								bro.getSkills().add(debuff);
								debuff.setTurns(aaaxx - 1);
							}
						}
						pp.CombatID = "Event";
						pp.Music = [
						"music/noble_01.ogg",
						"music/noble_02.ogg",
						"music/undead_01.ogg",
						"music/undead_02.ogg",
						"music/undead_03.ogg",
						"music/orcs_01.ogg",
						"music/orcs_02.ogg",
						"music/orcs_03.ogg",
						"music/goblins_01.ogg",
						"music/goblins_02.ogg",
						"music/beasts_01.ogg",
						"music/beasts_02.ogg",
						"music/civilians_01.ogg"
						];
						pp.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						local btile = [
							"tactical.autumn",
							"tactical.forest",
							"tactical.forest_leaves",
							"tactical.forest_snow",
							"tactical.hills",
							"tactical.hills_snow",
							"tactical.hills_steppe",
							"tactical.hills_tundra",
							"tactical.mountain",
							"tactical.plains",
							"tactical.quarry",
							"tactical.steppe",
							"tactical.snow",
							"tactical.swamp",
							"tactical.tundra"
						];
						if (this.Const.DLC.Desert)
						{
							btile.push("tactical.desert");
							btile.push("tactical.hills_desert");
							btile.push("tactical.oasis");
							btile.push("tactical.sinkhole");
						}			
						pp.TerrainTemplate = btile[this.Math.rand(0, btile.len() - 1)];
						local qq = this.Math.rand(0, 11);
						if (qq == 1)
						{
							pp.LocationTemplate.Template[0] = "tactical.graveyard";
						}
						else
						if (qq == 2)
						{
							pp.LocationTemplate.Template[0] = "tactical.ruins";
						}
						else
						if (qq == 3)
						{
							pp.LocationTemplate.Template[0] = "tactical.human_camp";
						}
						else
						if (qq == 4)
						{
							pp.LocationTemplate.Template[0] = "tactical.orc_camp";
						}
						else
						if (qq == 5)
						{
							pp.LocationTemplate.Template[0] = "tactical.goblin_camp";
						}
						else
						if (qq == 6)
						{
							pp.LocationTemplate.Template[0] = "tactical.barbarian_camp";
						}
						else
						if (qq == 7)
						{
							pp.TerrainTemplate = "tactical.steppe";
							pp.LocationTemplate.Template[0] = "tactical.southern_ruins";
						}
						else
						if (qq == 8)
						{
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_ruintown";
						}
						else
						if (qq == 9)
						{
							pp.LocationTemplate.Template[0] = "tactical.xxtactical_knighttown";
						}
						else
						if (qq == 10)
						{
							pp.TerrainTemplate = "tactical.quarry";
						}
						if (this.Math.rand(1, 3) == 2);
						{
							pp.BeforeDeploymentCallback = function ()
							{
								local size = this.Tactical.getMapSize();
								for( local x = 0; x < size.X; x = ++x )
								{
									for( local y = 0; y < size.Y; y = ++y )
									{
										local tile = this.Tactical.getTileSquare(x, y);
										tile.Level = this.Math.min(1, tile.Level);
									}
								}
							}
						}
						pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
						pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
						pp.IsAutoAssigningBases = false;
						pp.IsLootingProhibited = true;
						pp.IsWithoutAmbience = true;
						if (this.Const.DLC.Desert)
						{
							pp.IsArenaMode = true;
							this.Const.Sound.Volume.Arena = 0;
							this.Const.Sound.ArenaStart = [ "sounds/cloth_01.wav" ];
							this.Const.Sound.ArenaEnd = [ "sounds/cloth_01.wav" ];
							this.Const.Sound.ArenaOutro = [ "sounds/cloth_01.wav" ];
						}
						pp.Entities = [];
				//stage boss///
		if (aaaxx == 9111)
		{
			for( local i = 0; i < 80; i = ++i )
			{
				pp.Entities.push({
				ID = this.Const.EntityType.AlpShadow,
				Variant = 0,
				Row = 1,
				Script = "scripts/entity/tactical/enemies/xxmob_abomi",
				Faction = this.Const.Faction.Enemy
				});
			}
		}
		else
		{
						//1///
						local moba;
						local bbb;
						local mobas;
						moba = [
							"scripts/entity/tactical/enemies/xxmob_longbug",
							"scripts/entity/tactical/enemies/xxmob_bat",
							"scripts/entity/tactical/enemies/xxmob_boar",
							"scripts/entity/tactical/enemies/xxmob_execut",
							"scripts/entity/tactical/enemies/xxmob_cultist",
							"scripts/entity/tactical/enemies/xxmob_smasher",
							"scripts/entity/tactical/enemies/xxmob_whitewolf",
							"scripts/entity/tactical/enemies/xxmob_minder",
							"scripts/entity/tactical/enemies/xxmob_horseman_a",
							"scripts/entity/tactical/enemies/xxmob_witchhunter",
							"scripts/entity/tactical/enemies/xxmob_slime_b",
							"scripts/entity/tactical/enemies/xxmob_hwarang",
							"scripts/entity/tactical/enemies/xxmob_wokou",
							"scripts/entity/tactical/enemies/xxmob_spiderdemon",
							"scripts/entity/tactical/enemies/xxmob_toad",
							"scripts/entity/tactical/enemies/xxmob_huns",
							"scripts/entity/tactical/enemies/xxmob_lion",
							"scripts/entity/tactical/enemies/xxmob_bloodsucker",
							"scripts/entity/tactical/enemies/xxmob_liger",
							"scripts/entity/tactical/enemies/xxmob_elf",
							"scripts/entity/tactical/enemies/xxmob_wrider_wolf",
							"scripts/entity/tactical/enemies/xxmob_orclong",
							"scripts/entity/tactical/enemies/xxmob_goblinranger",
							"scripts/entity/tactical/enemies/goblin_fighter",
							"scripts/entity/tactical/enemies/goblin_wolfrider",
							"scripts/entity/tactical/enemies/xxmob_kraken_tentacle",
							"scripts/entity/tactical/enemies/orc_berserker",
							"scripts/entity/tactical/enemies/orc_warrior",
							"scripts/entity/tactical/enemies/orc_young",
							"scripts/entity/tactical/enemies/zombie_knight",
							"scripts/entity/tactical/enemies/skeleton_heavy",
							"scripts/entity/tactical/enemies/skeleton_heavy_bodyguard",
							"scripts/entity/tactical/enemies/direwolf",
							"scripts/entity/tactical/enemies/direwolf_high",
							"scripts/entity/tactical/enemies/ghoul",
							"scripts/entity/tactical/enemies/ghoul_medium",
							"scripts/entity/tactical/enemies/bandit_raider",
							"scripts/entity/tactical/enemies/bandit_raider_wolf",
							"scripts/entity/tactical/humans/cultist",
							"scripts/entity/tactical/humans/mercenary",
							"scripts/entity/tactical/humans/bounty_hunter",
							"scripts/entity/tactical/humans/noble_footman",
							"scripts/entity/tactical/humans/noble_greatsword"
						];
						if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
						{
							moba.extend([
							"scripts/entity/tactical/enemies/zombie_betrayer",
							"scripts/entity/tactical/enemies/zombie_treasure_hunter",
							"scripts/entity/tactical/enemies/serpent",
							"scripts/entity/tactical/enemies/hyena",
							"scripts/entity/tactical/enemies/hyena_high",
							"scripts/entity/tactical/humans/barbarian_marauder",
							"scripts/entity/tactical/humans/nomad_outlaw",
							"scripts/entity/tactical/humans/conscript"
							]);
						}
						mobas = moba[this.Math.rand(0, moba.len() - 1)];
						for( local i = 0; i < 5; i = ++i )
						{
							pp.Entities.push({
								ID = this.Const.EntityType.AlpShadow,
								Variant = 0,
								Row = 0,
								Script = mobas,
								Faction = this.Const.Faction.Enemy
							});
						}
						//2///
						moba.extend([
							"scripts/entity/tactical/enemies/ghoul_high",
							"scripts/entity/tactical/enemies/bandit_marksman",
							"scripts/entity/tactical/enemies/bandit_leader",
							"scripts/entity/tactical/enemies/goblin_ambusher",
							"scripts/entity/tactical/enemies/goblin_leader",
							"scripts/entity/tactical/enemies/vampire",
							"scripts/entity/tactical/enemies/vampire_low",
							"scripts/entity/tactical/enemies/skeleton_medium_polearm",
							"scripts/entity/tactical/enemies/skeleton_heavy_polearm",
							"scripts/entity/tactical/enemies/ghost",
							"scripts/entity/tactical/humans/militia_captain",
							"scripts/entity/tactical/humans/mercenary_ranged",
							"scripts/entity/tactical/humans/bounty_hunter_ranged",
							"scripts/entity/tactical/humans/noble_billman",
							"scripts/entity/tactical/humans/noble_arbalester"
						]);
						if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
						{
							moba.extend([
							"scripts/entity/tactical/enemies/alp",
							"scripts/entity/tactical/enemies/spider_eggs",
							"scripts/entity/tactical/enemies/sand_golem_medium",
							"scripts/entity/tactical/humans/nomad_archer",
							"scripts/entity/tactical/humans/nomad_leader",
							"scripts/entity/tactical/humans/conscript_polearm",
							"scripts/entity/tactical/humans/gunner"
							]);
						}
						mobas = moba[this.Math.rand(0, moba.len() - 1)];
						for( local i = 0; i < 4; i = ++i )
						{
							pp.Entities.push({
								ID = this.Const.EntityType.AlpShadow,
								Variant = 0,
								Row = 1,
								Script = mobas,
								Faction = this.Const.Faction.Enemy
							});
						}
						//1+2///
						moba.extend([
							"scripts/entity/tactical/enemies/unhold",
							"scripts/entity/tactical/enemies/unhold_bog"
						]);
						bbb = this.Math.max(1, aaaxx) + 1;
						if (bbb >= 35)
						{
							bbb = 35
						}
						for( local i = 0; i < bbb; i = ++i )
						{
							pp.Entities.push({
								ID = this.Const.EntityType.AlpShadow,
								Variant = 0,
								Row = this.Math.rand(0, 1),
								Script = moba[this.Math.rand(0, moba.len() - 1)],
								Faction = this.Const.Faction.Enemy
							});
						}
						//s1///
						moba = [
							"scripts/entity/tactical/enemies/xxmob_minderking",
							"scripts/entity/tactical/enemies/goblin_leader",
							"scripts/entity/tactical/enemies/goblin_shaman",
							"scripts/entity/tactical/enemies/skeleton_priest",
							"scripts/entity/tactical/enemies/necromancer",
							"scripts/entity/tactical/enemies/xxmob_necromancer",
							"scripts/entity/tactical/enemies/xxmob_barbarian_elder",
							"scripts/entity/tactical/enemies/xxmob_bannerman",
							"scripts/entity/tactical/enemies/orc_warlord",
							"scripts/entity/tactical/humans/swordmaster",
							"scripts/entity/tactical/humans/master_archer",
							"scripts/entity/tactical/enemies/lindwurm"
						];
						if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
						{
							moba.extend([
							"scripts/entity/tactical/humans/barbarian_drummer",
							"scripts/entity/tactical/enemies/unhold_armored",
							"scripts/entity/tactical/enemies/unhold_frost_armored",
							"scripts/entity/tactical/enemies/xxmob_hexe"
							"scripts/entity/tactical/enemies/hexe",
							"scripts/entity/tactical/enemies/schrat",
							"scripts/entity/tactical/humans/desert_devil",
							"scripts/entity/tactical/humans/desert_stalker",
							"scripts/entity/tactical/enemies/sand_golem_high"
							]);
						}
						if (this.Const.Serialization.Version >= 65)
						{
							moba.extend([
							"scripts/entity/tactical/enemies/fault_finder",
							"scripts/entity/tactical/enemies/lesser_flesh_golem_unarmed",
							"scripts/entity/tactical/enemies/lesser_flesh_golem",
							"scripts/entity/tactical/enemies/greater_flesh_golem"
							]);
						}
						pp.Entities.push({
							ID = this.Const.EntityType.AlpShadow,
							Variant = 0,
							Row = 1,
							Script = moba[this.Math.rand(0, moba.len() - 1)],
							Faction = this.Const.Faction.Enemy
						});
						//ss///
						moba = [
							"scripts/entity/tactical/enemies/xxmob_orchunter",
							"scripts/entity/tactical/enemies/xxmob_darkman",
							"scripts/entity/tactical/enemies/xxmob_horseman_b",
							"scripts/entity/tactical/enemies/xxmob_alp",
							"scripts/entity/tactical/enemies/xxmob_arcane",
							"scripts/entity/tactical/enemies/xxmob_elfsword",
							"scripts/entity/tactical/enemies/xxmob_blackorc",
							"scripts/entity/tactical/enemies/xxmob_bear",
							"scripts/entity/tactical/enemies/xxmob_clone",
							"scripts/entity/tactical/enemies/xxmob_wokousamurai",
							"scripts/entity/tactical/enemies/xxmob_fungal_b",
							"scripts/entity/tactical/enemies/xxmob_shaolin",
							"scripts/entity/tactical/enemies/xxmob_hunscaptain",
							"scripts/entity/tactical/enemies/xxmob_syndicate",
							"scripts/entity/tactical/enemies/xxmob_goblin",
							"scripts/entity/tactical/enemies/xxmob_vampguard",
							"scripts/entity/tactical/humans/knight",
							"scripts/entity/tactical/humans/noble_sergeant",
							"scripts/entity/tactical/humans/hedge_knight",
							"scripts/entity/tactical/enemies/xxmob_abomi",
							"scripts/entity/tactical/enemies/xxmob_hellranger",
							"scripts/entity/tactical/enemies/xxmob_dullahan",
							"scripts/entity/tactical/enemies/xxmob_cultchamp",
							"scripts/entity/tactical/enemies/xxmob_subzero",
							"scripts/entity/tactical/enemies/xxmob_mage",
							"scripts/entity/tactical/enemies/xxmob_beast",
							"scripts/entity/tactical/enemies/xxmob_jinn",
							"scripts/entity/tactical/enemies/xxmob_vamp",
							"scripts/entity/tactical/enemies/xxmob_mino",
							"scripts/entity/tactical/enemies/xxmob_battlemaster"
						];
						bbb = this.Math.max(1, aaaxx);
						if (bbb >= 35)
						{
							bbb = 35
						}
						for( local i = 0; i < bbb; i = ++i )
						{
							pp.Entities.push({
								ID = this.Const.EntityType.AlpShadow,
								Variant = 0,
								Row = this.Math.rand(0, 1),
								Script = moba[this.Math.rand(0, moba.len() - 1)],
								Faction = this.Const.Faction.Enemy
							});
						}
						//b///
						moba = [
							"scripts/entity/tactical/enemies/skeleton_boss",
							"scripts/entity/tactical/enemies/xxmob_unknown",
							"scripts/entity/tactical/enemies/xxmob_spiderhag",
							"scripts/entity/tactical/enemies/xxmob_skeleton_lich",
							"scripts/entity/tactical/enemies/xxmob_swordmaster",
							"scripts/entity/tactical/enemies/xxmob_slime_c",
							"scripts/entity/tactical/enemies/xxmob_wendigo",
							"scripts/entity/tactical/enemies/xxmob_elfqueen",
							"scripts/entity/tactical/enemies/xxmob_archlich",
							"scripts/entity/tactical/enemies/xxmob_archmage",
							"scripts/entity/tactical/enemies/xxmob_goblinking",
							"scripts/entity/tactical/enemies/xxmob_guildmaster",
							"scripts/entity/tactical/enemies/xxmob_ghoul",
							"scripts/entity/tactical/enemies/xxmob_orcking",
							"scripts/entity/tactical/enemies/xxmob_demon",
							"scripts/entity/tactical/enemies/xxmob_demonking",
							"scripts/entity/tactical/enemies/xxmob_golem",
							"scripts/entity/tactical/enemies/xxmob_knight",
							"scripts/entity/tactical/enemies/xxmob_berserkguts"
						];
						if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
						{
							moba.extend([
							"scripts/entity/tactical/enemies/zombie_boss",
							"scripts/entity/tactical/humans/barbarian_madman"
							]);
						}
						if (this.Const.Serialization.Version >= 65)
						{
							moba.extend([
							"scripts/entity/tactical/enemies/grand_diviner"
							]);
						}
						pp.Entities.push({
							ID = this.Const.EntityType.AlpShadow,
							Variant = 0,
							Row = 2,
							Script = moba[this.Math.rand(0, moba.len() - 1)],
							Faction = this.Const.Faction.Enemy
						});
		}
						//end///
						_event.registerToShowAfterCombat("Victory2", "Defeat");
						this.World.State.startScriptedCombat(pp, false, false, true);
						return 0;
					}
				}
			],
			function start( _event )
			{
				local aaaxx = this.World.Statistics.getFlags().getAsInt("aaaxx");
				_event.m.Title = "Chaos Portal : Level " + (aaaxx + 0) + "";
			}
		});
		this.m.Screens.push({
			ID = "Victory2",
			Text = "[img]gfx/ui/events/event_132.png[/img]{In the pile of corpses, you sigh for a moment. What the hell is this place? You are determined to leave this place before the evil ones are summoned again. \n\n[color=#56e64c]Choose the difficulty for the next battle in the Chaos Portal[/color]}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Increase difficulty + Get the blue vial",
					function getResult( _event )
					{
						this.World.Assets.getStash().makeEmptySlots(1);
						local iitem = this.new("scripts/items/special/spiritual_reward_item");
						this.World.Assets.getStash().add(iitem);
						this.World.Statistics.getFlags().increment("aaaxx", 1);
						if (this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
						{
							local ZZADVWIN = this.World.Statistics.getFlags().getAsInt("ZZADVWIN");
							if (ZZADVWIN >= 10)
							{
								this.World.Statistics.getFlags().increment("ZZADVWIN", -10);
								return "NewbroA";
							}
							else
							{
								this.World.Statistics.getFlags().increment("ZZADVWIN", 1);
								return 0;
							}
						}
						else
						{
							return 0;
						}
					}
				},
				{
					Text = "Maintain difficulty",
					function getResult( _event )
					{
						if (this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
						{
							local ZZADVWIN = this.World.Statistics.getFlags().getAsInt("ZZADVWIN");
							if (ZZADVWIN >= 10)
							{
								this.World.Statistics.getFlags().increment("ZZADVWIN", -10);
								return "NewbroA";
							}
							else
							{
								this.World.Statistics.getFlags().increment("ZZADVWIN", 1);
								return 0;
							}
						}
						else
						{
							return 0;
						}
					}
				}
			],
			function start( _event )
			{
				this.Const.Sound.Volume.Arena = 0.6;
				local rr = this.World.Statistics.getFlags().getAsInt("aaaxx") * 1000 + 4000;
				this.World.Assets.addMoney(rr);
				this.List.push({
					id = 11,
					icon = "ui/items/supplies/money.png",
					text = "You gain " + rr + " crowns"
				});
				rr = this.World.Statistics.getFlags().getAsInt("aaaxx") * 250 + 1250;
				_event.m.ChaosPoint = _event.m.ChaosPoint + rr;
				this.List.push({
					id = 12,
					icon = "ui/items/supplies/money.png",
					text = "You gain " + rr + " Chaos Crystals (currently " + _event.m.ChaosPoint + ")."
				});
			}
		});
		this.m.Screens.push({
			ID = "NewbroA",
			Text = "[img]gfx/ui/events/event_133.png[/img]{A mercenary with a special talent hopes to join your mercenary group.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Accept (Need an empty roster)",
					function getResult( _event )
					{
						if (this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
						{
							local roster = this.World.getPlayerRoster();
							local xxlonexx = roster.create("scripts/entity/tactical/player");
							local rtt = this.Math.rand(0, 3);
							if (this.Math.rand(1, 100) <= 2)
							{
								xxlonexx.setStartValuesEx([
								"xxhero_baku_background",
								"xxhero_elf_background",
								"xxhero_female_background",
								"xxhero_goblin_background",
								"xxhero_male_background",
								"xxhero_orc_background",
								"xxhero_undead_background",
								"adventurous_noble_background",
								"gladiator_background",
								"hunter_background",
								"hedge_knight_background",
								"sellsword_background",
								"swordmaster_background"
								]);
								rtt = 10;
							}
							else
							{
								xxlonexx.setStartValuesEx([
								"xxhero_baku_background",
								"xxhero_elf_background",
								"xxhero_female_background",
								"xxhero_goblin_background",
								"xxhero_male_background",
								"xxhero_orc_background",
								"xxhero_undead_background",
								"adventurous_noble_background",
								"anatomist_background",
								"apprentice_background",
								"assassin_background",
								"assassin_southern_background",
								"barbarian_background",
								"bastard_background",
								"beast_hunter_background",
								"beggar_background",
								"beggar_southern_background",
								"belly_dancer_background",
								"bowyer_background",
								"brawler_background",
								"butcher_background",
								"butcher_southern_background",
								"caravan_hand_background",
								"caravan_hand_southern_background",
								"companion_1h_background",
								"companion_1h_southern_background",
								"companion_2h_background",
								"companion_2h_southern_background",
								"companion_ranged_background",
								"companion_ranged_southern_background",
								"cripple_background",
								"cripple_southern_background",
								"cultist_background",
								"daytaler_background",
								"daytaler_southern_background",
								"deserter_background",
								"disowned_noble_background",
								"eunuch_background",
								"eunuch_southern_background",
								"farmhand_background",
								"fisherman_background",
								"fisherman_southern_background",
								"flagellant_background",
								"gambler_background",
								"gambler_southern_background",
								"gladiator_background",
								"gravedigger_background",
								"graverobber_background",
								"hedge_knight_background",
								"historian_background",
								"houndmaster_background",
								"hunter_background",
								"juggler_background",
								"juggler_southern_background",
								"killer_on_the_run_background",
								"lindwurm_slayer_background",
								"lumberjack_background",
								"manhunter_background",
								"mason_background",
								"messenger_background",
								"militia_background",
								"miner_background",
								"minstrel_background",
								"monk_background",
								"nomad_background",
								"nomad_ranged_background",
								"paladin_background",
								"peddler_background",
								"peddler_southern_background",
								"pimp_background",
								"poacher_background",
								"raider_background",
								"ratcatcher_background",
								"refugee_background",
								"retired_soldier_background",
								"sellsword_background",
								"servant_background",
								"servant_southern_background",
								"shepherd_background",
								"shepherd_southern_background",
								"slave_background",
								"slave_barbarian_background",
								"slave_southern_background",
								"squire_background",
								"swordmaster_background",
								"tailor_background",
								"tailor_southern_background",
								"thief_background",
								"thief_southern_background",
								"vagabond_background",
								"wildman_background",
								"witchhunter_background"
								]);
							}
							xxlonexx.m.HireTime = this.Time.getVirtualTimeF();
							xxlonexx.m.PerkPoints = 1;
							xxlonexx.m.LevelUps = 1;
							xxlonexx.m.Level = 2;
							xxlonexx.m.Talents = [];
							xxlonexx.m.Attributes = [];
							xxlonexx.getBaseProperties().Hitpoints += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().Bravery += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().Stamina += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().MeleeSkill += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().RangedSkill += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().MeleeDefense += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().RangedDefense += this.Math.rand(0, rtt);
							xxlonexx.getBaseProperties().Initiative += this.Math.rand(0, rtt);
							local talents = xxlonexx.getTalents();
							talents.resize(this.Const.Attributes.COUNT, 0);
							talents[this.Const.Attributes.Hitpoints] = 3;
							talents[this.Const.Attributes.Bravery] = 3;
							talents[this.Const.Attributes.Fatigue] = 3;
							talents[this.Const.Attributes.MeleeSkill] = 3;
							talents[this.Const.Attributes.RangedSkill] = 3;
							talents[this.Const.Attributes.MeleeDefense] = 3;
							talents[this.Const.Attributes.RangedDefense] = 3;
							talents[this.Const.Attributes.Initiative] = 3;
							xxlonexx.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
							return 0;
						}
						else
						{
							return 0;
						}
					}
				},
				{
					Text = "Decline (Gain 3000 Crwons)",
					function getResult( _event )
					{
						this.World.Assets.addMoney(3000);
						return 0;
					}
				}
			],
			function start( _event )
			{
			}
		});
		this.m.Screens.push({
			ID = "NewbroB",
			Text = "[img]gfx/ui/events/event_90.png[/img]{Your party leaves this place in a hurry.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Come on, everyone, hurry up!",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				local roster = this.World.getPlayerRoster();
				local xxlonexx = roster.create("scripts/entity/tactical/player");
				if (this.Math.rand(1, 100) <= 20)
				{
					xxlonexx.setStartValuesEx([
			"xxhero_baku_background",
			"xxhero_elf_background",
			"xxhero_female_background",
			"xxhero_goblin_background",
			"xxhero_male_background",
			"xxhero_orc_background",
			"xxhero_undead_background"
					]);
				}
				else
				{
					xxlonexx.setStartValuesEx([
			"adventurous_noble_background",
			"anatomist_background",
			"apprentice_background",
			"assassin_background",
			"assassin_southern_background",
			"barbarian_background",
			"bastard_background",
			"beast_hunter_background",
			"beggar_background",
			"beggar_southern_background",
			"belly_dancer_background",
			"bowyer_background",
			"brawler_background",
			"butcher_background",
			"butcher_southern_background",
			"caravan_hand_background",
			"caravan_hand_southern_background",
			"companion_1h_background",
			"companion_1h_southern_background",
			"companion_2h_background",
			"companion_2h_southern_background",
			"companion_ranged_background",
			"companion_ranged_southern_background",
			"cripple_background",
			"cripple_southern_background",
			"cultist_background",
			"daytaler_background",
			"daytaler_southern_background",
			"deserter_background",
			"disowned_noble_background",
			"eunuch_background",
			"eunuch_southern_background",
			"farmhand_background",
			"fisherman_background",
			"fisherman_southern_background",
			"flagellant_background",
			"gambler_background",
			"gambler_southern_background",
			"gladiator_background",
			"gravedigger_background",
			"graverobber_background",
			"hedge_knight_background",
			"historian_background",
			"houndmaster_background",
			"hunter_background",
			"juggler_background",
			"juggler_southern_background",
			"killer_on_the_run_background",
			"lindwurm_slayer_background",
			"lumberjack_background",
			"manhunter_background",
			"mason_background",
			"messenger_background",
			"militia_background",
			"miner_background",
			"minstrel_background",
			"monk_background",
			"nomad_background",
			"nomad_ranged_background",
			"paladin_background",
			"peddler_background",
			"peddler_southern_background",
			"pimp_background",
			"poacher_background",
			"raider_background",
			"ratcatcher_background",
			"refugee_background",
			"retired_soldier_background",
			"sellsword_background",
			"servant_background",
			"servant_southern_background",
			"shepherd_background",
			"shepherd_southern_background",
			"slave_background",
			"slave_barbarian_background",
			"slave_southern_background",
			"squire_background",
			"swordmaster_background",
			"tailor_background",
			"tailor_southern_background",
			"thief_background",
			"thief_southern_background",
			"vagabond_background",
			"wildman_background",
			"witchhunter_background"
					]);
				}
				xxlonexx.m.HireTime = this.Time.getVirtualTimeF();
				xxlonexx.m.PerkPoints = 1;
				xxlonexx.m.LevelUps = 1;
				xxlonexx.m.Level = 2;
				xxlonexx.m.Talents = [];
				xxlonexx.m.Attributes = [];
				xxlonexx.getBaseProperties().Hitpoints += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().Bravery += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().Stamina += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().MeleeSkill += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().RangedSkill += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().MeleeDefense += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().RangedDefense += this.Math.rand(0, 5);
				xxlonexx.getBaseProperties().Initiative += this.Math.rand(0, 5);
				local talents = xxlonexx.getTalents();
				talents.resize(this.Const.Attributes.COUNT, 0);
				talents[this.Const.Attributes.Hitpoints] = 3;
				talents[this.Const.Attributes.Bravery] = 3;
				talents[this.Const.Attributes.Fatigue] = 3;
				talents[this.Const.Attributes.MeleeSkill] = 3;
				talents[this.Const.Attributes.RangedSkill] = 3;
				talents[this.Const.Attributes.MeleeDefense] = 3;
				talents[this.Const.Attributes.RangedDefense] = 3;
				talents[this.Const.Attributes.Initiative] = 3;
				xxlonexx.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
				this.List.push({
					id = 11,
					icon = "ui/perks/perk_28_active.png",
					text = "A new brother joins the party"
				});
				return 0;
			}
		});
//FfinalBbattle////
		this.m.Screens.push({
			ID = "FinaleBattle",
			Text = "[img]gfx/ui/events/event_50.png[/img]{Every story must come to an end. And now, it is time to place the final period. All the battles fought, the sacrifices made, and the moments of choice you\'ve faced have led to this single moment. Only those who are truly prepared have the right to face this grand finale. Now, the most majestic, legendary, and greatest finale is about to unfold. Are you ready? Now, everything moves toward its end.\n\n[color=#999999]This battle cannot be retreated from once it begins.[/color]}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "For the most glorious battle!",
					function getResult( _event )
					{
						_event.m.ChaosPoint = _event.m.ChaosPoint - 9999;
						local pp = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						pp.Music = this.Const.Music.NobleTracks;
						pp.Entities = [];
						local unit;
						pp.BeforeDeploymentCallback = function ()
						{
							local size = this.Tactical.getMapSize();
							for( local x = 0; x < size.X; x = ++x )
							{
								for( local y = 0; y < size.Y; y = ++y )
								{
									local tile = this.Tactical.getTileSquare(x, y);
									tile.Level = this.Math.min(1, tile.Level);
									if (this.Math.rand(0, 2) != 1)
									{
										tile.removeObject();
										tile.clear();
									}
								}
							}
						};
						pp.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
						pp.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
						for( local i = 0; i < 4; i = ++i )
						{
							unit = clone this.Const.World.Spawn.Troops.CultistAmbush;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.BanditLeader;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.BanditRaiderWolf;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.HedgeKnight;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.MercenaryRanged;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.GoblinWolfrider;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.OrcBerserker;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.OrcWarrior;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.GoblinAmbusher;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.ZombieKnight;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.SkeletonHeavyPolearm;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.Vampire;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.Ghost;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							if (this.Const.DLC.Unhold && this.Const.DLC.Wildmen && this.Const.DLC.Desert)
							{
								unit = clone this.Const.World.Spawn.Troops.BarbarianChampion;
								unit.Faction <- this.Const.Faction.Enemy;
								pp.Entities.push(unit);
								unit = clone this.Const.World.Spawn.Troops.Assassin;
								unit.Faction <- this.Const.Faction.Enemy;
								pp.Entities.push(unit);
								unit = clone this.Const.World.Spawn.Troops.Gunner;
								unit.Faction <- this.Const.Faction.Enemy;
								pp.Entities.push(unit);
							}
							else
							{
								unit = clone this.Const.World.Spawn.Troops.HedgeKnight;
								unit.Faction <- this.Const.Faction.Enemy;
								pp.Entities.push(unit);
								unit = clone this.Const.World.Spawn.Troops.HedgeKnight;
								unit.Faction <- this.Const.Faction.Enemy;
								pp.Entities.push(unit);
								unit = clone this.Const.World.Spawn.Troops.BountyHunterRanged;
								unit.Faction <- this.Const.Faction.Enemy;
								pp.Entities.push(unit);
							}
							unit = clone this.Const.World.Spawn.Troops.GhoulHIGH;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
						}
						for( local i = 0; i < 2; i = ++i )
						{
							unit = clone this.Const.World.Spawn.Troops.SkeletonPriest;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.OrcWarlord;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.GoblinShaman;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.GoblinOverseer;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.Lindwurm;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.DirewolfHIGH;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.Necromancer;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.Swordmaster;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							unit = clone this.Const.World.Spawn.Troops.MasterArcher;
							unit.Faction <- this.Const.Faction.Enemy;
							pp.Entities.push(unit);
							pp.Entities.push({
								ID = this.Const.EntityType.AlpShadow,
								Variant = 0,
								Row = this.Math.min(2, 4),
								Script = "scripts/entity/tactical/enemies/xxmob_bannerman",
								Faction = this.Const.Faction.Enemy
							});
						}
						unit = clone this.Const.World.Spawn.Troops.UnholdFrost;
						unit.Faction <- this.Const.Faction.Enemy;
						pp.Entities.push(unit);
						unit = clone this.Const.World.Spawn.Troops.UnholdBog;
						unit.Faction <- this.Const.Faction.Enemy;
						pp.Entities.push(unit);
						unit = clone this.Const.World.Spawn.Troops.Unhold;
						unit.Faction <- this.Const.Faction.Enemy;
						pp.Entities.push(unit);
						pp.Entities.push({
							ID = this.Const.EntityType.AlpShadow,
							Variant = 0,
							Row = this.Math.min(2, 4),
							Script = "scripts/entity/tactical/enemies/xxmob_battlemaster",
							Faction = this.Const.Faction.Enemy
						});
						pp.Entities.push({
							ID = this.Const.EntityType.AlpShadow,
							Variant = 0,
							Row = 5,
							Script = "scripts/entity/tactical/enemies/xxmob_aboss",
							Faction = this.Const.Faction.Enemy
						});
						pp.IsFleeingProhibited = true;
						pp.IsLootingProhibited = true;
						pp.IsWithoutAmbience = true;
						_event.registerToShowAfterCombat("FinaleBattleV", "Defeat");
						this.World.State.startScriptedCombat(pp, false, false, true);
						return 0;
					}
				},
				{
					Text = "Not ready yet.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				_event.m.Title = "An audience with the Grand Finale";
			}
		});
		this.m.Screens.push({
			ID = "FinaleBattleV",
			Text = "[img]gfx/ui/events/event_28.png[/img]{You did it. You overcame the greatest trials and have finally arrived at this moment. Battling through the storm of fate and navigating the flames of hardship, you have now reached the pinnacle. Now, it is time to face what lies beyond.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The %companyname% needs their commander!",
					function getResult( _event )
					{
						return 0;
					}
				},
				{
					Text = "It\'s time to retire from mercenary life. (End Campaign)",
					function getResult( _event )
					{
						this.World.State.getMenuStack().pop(true);
						this.World.State.showGameFinishScreen(true);
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.World.Assets.addMoney(77777);
				this.World.Assets.addScore(7777);
				this.World.Assets.addBusinessReputation(7777);
				this.World.Statistics.getFlags().increment("GreaterEvilsDefeated");
				this.World.Statistics.getFlags().increment("GreaterEvilsDefeated");
				this.World.Statistics.getFlags().increment("GreaterEvilsDefeated");
			}
		});
//ETC Option////
		this.m.Screens.push({
			ID = "SideJobEnd",
			Text = "[img]gfx/ui/events/event_72.png[/img]{Members of the %companyname% helped out at a nearby {pig farm | stable | cowshed}. They had a hard time with the foul smell of filth and hard labor. | Members of the %companyname% sweep and polish throughout the day, running errands and chores for the guild. | Members of the %companyname% have spent an exhausting and irritating time running errands and guarding the brothel. | Members of the %companyname% did hard manual labor on a nearby farm. | The town was large and prosperous, but there was always a lack of hands for the dirty and hard work. Members of %companyname% earned a small amount by doing hard odd jobs. %randombrother% grumbled annoyedly%SPEECH_ON%{I didn\'t become a mercenary to do this damn thing... | I want to stop doing this fucking shit and do some mercenary work! | Damn, give me some real work instead of this!}%SPEECH_OFF%}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "That\'s enough.",
					function getResult( _event )
					{
						return "Start1";
					}
				}
			],
			function start( _event )
			{
				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					local rr = this.Math.rand(1, 15)
					if (rr == 1)
					{
						bro.worsenMood(1, "was disappointed with this")
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
					else
					if (rr == 2)
					{
						bro.worsenMood(this.Math.rand(2, 3), "was furious with the company\'s decision")
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
					else
					if (rr == 3)
					{
						local effect = this.new("scripts/skills/effects_world/exhausted_effect");
						bro.getSkills().add(effect);
						this.List.push({
							id = 10,
							icon = effect.getIcon(),
							text = bro.getName() + " is exhausted"
						});
					}
					else
					if (rr == 4)
					{
						local effect = this.new("scripts/skills/effects_world/hangover_effect");
						effect.m.Name = "Overworked";
						effect.m.Description = "This character has recently been overworked and has muscle pain";
						bro.getSkills().add(effect);
						this.List.push({
							id = 10,
							icon = effect.getIcon(),
							text = bro.getName() + " is overworked"
						});
					}
					else
					if (rr == 5)
					{
						local injury;
						if (this.Math.rand(1, 100) <= 50)
						{
							injury = bro.addInjury(this.Const.Injury.Brawl);
						}
						else
						{
							injury = bro.addInjury(this.Const.Injury.PiercingBody);
						}
						bro.addLightInjury();
						this.List.push({
							id = 10,
							icon = injury.getIcon(),
							text = bro.getName() + " suffers " + injury.getNameOnly()
						});
					}
				}
				local gmoney = this.Math.rand(100, 400);
				this.World.Assets.addMoney(gmoney);
				this.List.push({
					id = 10,
					icon = "ui/items/supplies/money.png",
					text = "Earned [color=#56e64c]" + gmoney + "[/color] crowns"
				});
			}
		});
		this.m.Screens.push({
			ID = "Start2B",
			Text = "[img]gfx/ui/events/event_24.png[/img]{Members of the %companyname% ate and drank with your money and had a fun and hot time.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Have fun.",
					function getResult( _event )
					{
						return "Start2";
					}
				}
			],
			function start( _event )
			{
				local brothers = this.World.getPlayerRoster().getAll();
				foreach( bro in brothers )
				{
					local rr = this.Math.rand(1, 25);
					if (rr == 1)
					{
						bro.improveMood(10, "Celebrated with the company");
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
					else
					if (rr == 2)
					{
						bro.improveMood(this.Math.rand(1, 5), "Celebrated with the company");
						local effect = this.new("scripts/skills/effects_world/drunk_effect");
						bro.getSkills().add(effect);
						this.List.push({
							id = 10,
							icon = effect.getIcon(),
							text = bro.getName()  + " is now drunk."
						});
					}
					else
					if (rr == 3)
					{
						bro.improveMood(this.Math.rand(1, 5), "Celebrated with the company");
						local effect = this.new("scripts/skills/effects_world/exhausted_effect");
						bro.getSkills().add(effect);
						this.List.push({
							id = 10,
							icon = effect.getIcon(),
							text = bro.getName() + " is exhausted"
						});
					}
					else
					if (rr == 4)
					{
						bro.improveMood(this.Math.rand(1, 5), "Celebrated with the company");
						bro.getSkills().removeByType(this.Const.SkillType.TemporaryInjury);
						bro.getSkills().removeByID("effects.hangover");
						bro.getSkills().removeByID("effects.exhausted");
						bro.setHitpoints(bro.getHitpointsMax());
						bro.getSkills().update();
						this.List.push({
							id = 10,
							icon = "ui/icons/asset_business_reputation.png",
							text = bro.getName()  + " is fully recovered!"
						});
					}
					else
					{
						bro.improveMood(this.Math.rand(1, 5), "Celebrated with the company");
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}
				this.List.push({
					id = 11,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + 500 + "[/color] Crowns"
				});
			}
		});
		this.m.Screens.push({
			ID = "Start2C1",
			Text = "[img]gfx/ui/events/event_62.png[/img]{Who would you like to bet on?}",
			Image = "",
			Characters = [],
			List = [],
			Options = [],
			function start( _event )
			{
				local fname = this.Const.Strings.CharacterNames;
				fname.extend(this.Const.Strings.BarbarianNames);
				fname.extend(this.Const.Strings.AncientDeadNames);
				local sname = this.Const.Strings.GladiatorTitles;
				sname.extend(this.Const.Strings.BarbarianTitles);
				sname.extend(this.Const.Strings.SellswordTitles);
				sname.extend(this.Const.Strings.HedgeKnightTitles);
				sname.extend(this.Const.Strings.GoblinTitles);
				local xfname = fname[this.Math.rand(0, fname.len() - 1)];
				local xsname = sname[this.Math.rand(0, sname.len() - 1)];
				local champ1c = this.Math.rand(501, 1000);
				local champ1 = xfname + " " + xsname;
				xfname = fname[this.Math.rand(0, fname.len() - 1)];
				xsname = sname[this.Math.rand(0, sname.len() - 1)];
				local champ2c = this.Math.rand(501, 1000);
				local champ2 = xfname + " " + xsname + " (" + champ2c + " Crowns)";
				local btype = this.Math.rand(7, 11);
				champ1 = champ1 + " (" + champ1c + " Crowns)";
				this.Options.push({
					Text = champ1,
					function getResult( _event )
					{
						if (btype == 7 || btype == 8)
						{
							_event.m.GambleMoney = champ1c;
						}
						else
						{
							_event.m.GambleMoney = 0;
						}
						return "Start2C2";
					}
				});
				this.Options.push({
					Text = champ2,
					function getResult( _event )
					{
						if (btype == 9 || btype == 10)
						{
							_event.m.GambleMoney = champ2c;
						}
						else
						{
							_event.m.GambleMoney = 0;
						}
						return "Start2C2";
					}
				});
			}
		});
		this.m.Screens.push({
			ID = "Start2C2",
			Text = "[img]gfx/ui/events/event_62.png[/img]{You were engrossed in betting, unaware of the passing of time.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "{Betting is like life. Win or lose. | Betting always comes with rewards or lessons. | Lost track of time.}",
					function getResult( _event )
					{
						return "Start2";
					}
				}
			],
			function start( _event )
			{
				this.World.Assets.addMoney(_event.m.GambleMoney);
				this.List.push({
					id = 10,
					icon = "ui/items/supplies/money.png",
					text = "You used 500 crowns and now have [color=#56e64c]" + _event.m.GambleMoney + "[/color] crowns"
				});
			}
		});
		this.m.Screens.push({
			ID = "Getout",
			Text = "[img]gfx/ui/events/event_70.png[/img]{Request denied. Please review the requirements.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "{Feel like shit | What? | Damn! | What a joke}",
					function getResult( _event )
					{
						return _event.BackHome( _event );
					}
				}
			],
			function start( _event )
			{
			}
		});
	}

	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onDetermineStartScreen()
	{
		local settlements = this.World.EntityManager.getLocations();
		local currentTile = this.World.State.getPlayer().getTile();
		local closest = null;
		foreach (s in settlements)
		{
			if (s.m.Name != "Fantasy Town" || s.m.VisibilityMult != 1.5)
			{
				continue;
			}

			this.m.OutCheck = s;
		}
		return "Start1";
	}

	function onClear()
	{
	}

	function BackHome( _event )
	{
		if (_event.m.OutCheck != null)
		{
		        ::World.State.getMenuStack().popAll(true);
			this.Time.scheduleEvent(this.TimeUnit.Real, 1, function ( _t )
			{
				::World.State.enterLocation(_event.m.OutCheck);
			}, null);
		}
		return 0;
	}

	function onSerialize( _out )
	{
		_out.writeF32(this.m.ChaosPoint);
		_out.writeF32(this.m.DivinePoint);
		_out.writeF32(this.m.GodPoint);
		_out.writeF32(this.m.TimePoint);
		_out.writeF32(this.m.TimeDay);
	}

	function onDeserialize( _in )
	{
		this.m.ChaosPoint = _in.readF32();
		this.m.DivinePoint = _in.readF32();
		this.m.GodPoint = _in.readF32();
		this.m.TimePoint = _in.readF32();
		this.m.TimeDay = _in.readF32();
	}

});

