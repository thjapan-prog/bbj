local gt = this.getroottable();
local translation = gt.translation;
local events = translation.events;
local contracts = translation.contracts;
local contract_template = contracts["contract.template"];
local backgrounds = translation.backgrounds;
local perks = translation.perks;
local situations = translation.situations;
local ambitions = translation.ambitions;
local rumors = translation.rumors;
local t_strings = translation.strings;
local t_scenarios = translation.scenarios;
local t_items = translation.items;
local t_skills_actives = translation.skills_actives;


::mods_registerMod("mod_translation_ja", 1, "Unofficial Japanese Translation");
::mods_registerCSS("fonts_ja.css");
::mods_registerJS("translation_ja.js");
::mods_registerJS("translation_tooltip2_ja.js");
::mods_registerJS("tooltip_module_replace.js");


local replaceText = function(text, substr, replace) {
	if (substr == "") {
		return text;
	}
	local right = text;
	local ret = "";
	local i = right.find(substr);
	while (i != null) {
		local left = right.slice(0, i);
		right = right.slice(i + substr.len());
		ret = ret + left + replace;
		i = right.find(substr);
	}
	ret += right;
	return ret;
}

local replaceConstString = function(str) {
	str = replaceText(str, "${Const.UI.Color.PositiveValue}", gt.Const.UI.Color.PositiveValue);
	str = replaceText(str, "${Const.UI.Color.NegativeValue}", gt.Const.UI.Color.NegativeValue);
	str = replaceText(str, "${Const.UI.Color.DamageValue}", gt.Const.UI.Color.DamageValue);
	return str;
}

local replaceConst = function(t) {
	t.t = replaceConstString(t.t);
	t.b = replaceConstString(t.b);
}

/*
 Hook all items, which require template id instead of item instance id.
*/
foreach (t_item in t_items) {
	if ("gettooltips" in t_item) {
		foreach (t in t_item.gettooltips) {
			replaceConst(t);
		}
	}
}

//::mods_addHook("new", function(scriptName, obj) {

local itemClasses = [
	"items/item", 
	"items/accessory/accessory", 
	"items/ammo/ammo", 
	"items/armor/armor", "items/armor/named/named_armor", "items/armor_upgrades/armor_upgrade", 
	"items/helmets/helmet", "items/helmets/named/named_helmet", 
	"items/shields/shield", "items/shields/named/named_shield", 
	"items/supplies/food_item", 
	"items/trade/trading_good_item",
	"items/weapons/weapon", "items/weapons/named/named_weapon"
];
foreach (c in itemClasses) {
::mods_hookBaseClass(c, function(obj) {
//::mods_hookBaseClass("items/item", function(obj) {
	
	if ("create" in obj) {
		local orig_create = obj.create;
		obj.create = function() {
			orig_create();
			local id = this.getID();
			if (id == "") {
				return;
			} else if (!(id in t_items)) {
				this.logDebug("translation_ja | hook item id not found " + id);
				return;
			}
			
			local t_item = t_items[id];

			local t_parents = [];
			local self = this;
			t_parents.push([t_item, self]);
			while ("SuperName" in self) {
				local key = "base." + self.SuperName;
				//parents.push(self.SuperName);
				//this.logDebug("translation_ja | parents. " + self.SuperName);
				self = self[self.SuperName];
				if (key in t_items) {
					t_parents.push([t_items[key], self]);
				}
			}
			
			if ("name" in t_item) {
				this.m.Name = t_item.name;
			} else if ("names" in t_item) {
				foreach (t in t_item.names) {
					this.m.Name = replaceText(this.m.Name, t.b, t.t);
				}
			}
			if ("description" in t_item) {
				this.m.Description = t_item.description;
			}
			
			foreach (p in t_parents) {
				local t_parent_item = p[0];
				local that = p[1];
				if ("getTooltip" in that && "gettooltips" in t_parent_item) {
					local orig_getTooltip = that.getTooltip;
					that.getTooltip = function() {
						local ret = orig_getTooltip();
						foreach (r in ret) {
							if ("text" in r) {
								if ("gettooltips" in t_parent_item) {
									local t_gettooltips = t_parent_item.gettooltips;
									foreach (t in t_gettooltips) {
										r.text = replaceText(r.text, t.b, t.t);
									}
								}
							}
						}
						return ret;
					}
				}
				
				if ("getValueString" in that && "getvaluestrings" in t_parent_item) {
					local orig_getValueString = that.getValueString;
					that.getValueString = function() {
						local text = orig_getValueString();
						foreach (t in t_parent_item.getvaluestrings) {
							text =  replaceText(text, t.b, t.t);
						}
						return text;
					}
				}
			}
		}
	} 
});
}

/*
 Hook all ammo, as same as item.
*/
::mods_hookBaseClass("items/ammo/ammo", function(obj) {
	//this.logDebug("translation_ja | tooltip hook install." + obj);
	if ("getTooltip" in obj) {
		//this.logDebug("translation_ja | getTooltip found. replace it.");
		local orig_getTooltip = obj.getTooltip;
		obj.getTooltip = function() {
			//this.logDebug("translation_ja | getTooltip() this: " + this);
			local result = orig_getTooltip();
			//this.logDebug("translation_ja | getTooltip() result: " + result);
			local id = this.getID();
			result[0].baseItemId <- id;
			return result;
		}
	}
});



/*
 Hook special.mood_check to get detail of the mood.
*/
::mods_hookClass("skills/special/mood_check", function(obj) {
	//this.logDebug("translation_ja | tooltip hook install." + obj);
	if ("getTooltip" in obj) {
		//this.logDebug("translation_ja | getTooltip found. replace it.");
		local orig_getTooltip = obj.getTooltip;
		obj.getTooltip = function() {
			//this.logDebug("translation_ja | getTooltip() this: " + this);
			local result = orig_getTooltip();
			//this.logDebug("translation_ja | getTooltip() result: " + result);
			local id = this.getID() + "." + this.getContainer().getActor().getMoodState();
			//this.logDebug("translation_ja | getTooltip() id: " + id);
			//local p = this.Math.round(this.getContainer().getActor().getMood() / (this.Const.MoodState.len() - 0.05) * 100.0);
			result[0].moodId <- id;
			result[0].moodStateName <- this.Const.MoodStateName[this.getContainer().getActor().getMoodState()];
			return result;
		}
	}
	return null;
});


/*
 Hook events
*/
::mods_hookBaseClass("events/event", function(o) {

	if ("create" in o) {
		//this.logDebug("translation_ja | hook event creation. ");
		local orig_create = o.create;
		o.create = function() {
			orig_create();
			local id = this.m.ID;
			
			if (!(id in events)) {
				//this.logDebug("translation_ja | translation for event not found. " + id);
				return;
			}
			
			local obj = o;
			if ("event" in obj) {
				obj = o.event;
			}

			local e_trans = events[id];
			this.m.Title = e_trans.title;
			
			//this.logDebug("translation_ja | translation for event found. " + id);
			
			foreach (s in this.m.Screens) {
				local screenId = s.ID;
				if (screenId in e_trans.screens) {
					//this.logDebug("translation_ja | hook event found screen with id  " + screenId);
					local s_trans = e_trans.screens[screenId];
					if ("start" in s) {
						local orig_start = s.start;
						s.start = function( _event ) {
							# this.logDebug("translation_ja | replace event text for " + id + ":" + screenId);
							orig_start( _event );
							if (s_trans.texts.len() == 1 && s_trans.texts[0].t != "") {
								//this.logDebug("translation_ja | replaced text form " + this.Text);
								this.Text = s_trans.texts[0].t;
								//this.logDebug("translation_ja | replaced text to " + this.Text);
							} else {
								//this.logDebug("translation_ja | replaced text form " + this.Text);
								foreach (t in s_trans.texts) {
									if (this.Text == t.b) {
										this.Text = t.t;
										break;
									}
								}
								//this.logDebug("translation_ja | replaced text to " + this.Text);
							}
							foreach (i, opt in this.Options) {
								foreach (o in s_trans.options) {
									if (opt.Text == o.b) {
										opt.Text = o.t;
										break;
									}
								}
							}
						}
					} else {
						if (s_trans.texts.len() == 1 && s_trans.texts[0].t != "") {
							s.Text = s_trans.texts[0].t;
						}
						
						foreach (i, opt in s.Options) {
							foreach (o in s_trans.options) {
								if (opt.Text == o.b) {
									opt.Text = o.t;
									break;
								}
							}
						}
					}
				} else {
					this.logDebug("translation_ja | screen not found with id " + screenId);
				}
			}
		}
	}
});

/*
 Hook contracts
*/
::mods_hookBaseClass("contracts/contract", function(o) {

	local obj = o;
	if ("contract" in obj) {
		obj = obj.contract;
	}
	
	if ("setScreen" in obj) {
		//this.logDebug("translation_ja | hook contract setScreen found. " + obj);
		local orig_setScreen = obj.setScreen;
		obj.setScreen = function(_screen, _restartIfAlreadyActive = true) {
			local id =  this.m.Type;
			//this.logDebug("translation_ja | hook contract setScreen. " + id);
			if (id.find("contract.") != 0) {
				orig_setScreen(_screen, _restartIfAlreadyActive);
				return;
			}
			//this.logDebug("translation_ja | hook contract creationScreen. " + id);
			if (id in contracts) {
				//this.logDebug("translation_ja | hook contracts createScreen. " + id);
				local c_trans = contracts[id];
				if (typeof _screen == "string") {
					_screen = this.getScreen(_screen);
				}
				
				//foreach (s in this.m.Screens) {
				local s = _screen;
				if ("ID" in s) {
					local screenId = s.ID;
					if (screenId in c_trans.screens) {
						local s_trans = c_trans.screens[screenId];
						if ("start" in s) {
							local orig_start = s.start;
							s.start = function() {
								orig_start();
								if (s_trans.title != "") {
									this.Title = s_trans.title;
								}
								if (s_trans.text != "") {
									this.Text = s_trans.text;
								}
								foreach (i, opt in this.Options) {
									if (i < s_trans.options.len() && s_trans.options[i] != "") {
										opt.Text = s_trans.options[i];
									}
								}
							}
						} else {
							if (s_trans.title != "") {
								s.Title = s_trans.title;
							}
							if (s_trans.text != "") {
								s.Text = s_trans.text;
							}
							foreach (i, opt in s.Options) {
								if (i < s_trans.options.len() && s_trans.options[i] != "") {
									opt.Text = s_trans.options[i];
								}
							}
						}
					} else if (screenId in contract_template.screens) {
						local s_trans = contract_template.screens[screenId];
						if ("start" in s) {
							local orig_start = s.start;
							s.start = function() {
								//this.logDebug("translation_ja | hooked start: " + screenId);
								orig_start();
								if (s_trans.title != "") {
									this.Title = s_trans.title;
								}
								foreach (text in s_trans.texts) {
									this.Text = replaceText(this.Text, text.b, text.t);
								}
								foreach (i, opt in this.Options) {
									//this.logDebug("translation_ja | option: " + opt.Text);
									foreach (option in s_trans.options) {
										if (opt.Text == option.b) {
											opt.Text = option.t;
											break;
										}
									}
								}
							}
						} else {
							if (s_trans.title != "") {
								s.Title = s_trans.title;
							}

							//this.logDebug("translation_ja | text: " + this.Text);
							foreach (text in s_trans.texts) {
								if (s.Text == text.b) {
									s.Text = text.t;
									break;
								}
							}
							foreach (i, opt in s.Options) {
								//this.logDebug("translation_ja | option: " + opt.Text);
								foreach (option in s_trans.options) {
									if (opt.Text == option.b) {
										opt.Text = option.t;
										break;
									}
								}
							}
						}
					}
				}
			}
			orig_setScreen(_screen);
		}
	} else {
		this.logDebug("translation_ja | hook contract setScreen not found. " + obj);
		foreach (k, p in obj) {
			this.logDebug("translation_ja | hook props are " + k + ", " +p);
		}
	}
});


/*
 Hook background
*/
::mods_hookBaseClass("skills/backgrounds/character_background", function(o) {

	local obj = o;
	
	if ("create" in obj) {
		local orig_create = obj.create;
		obj.create = function() {
			orig_create();
			local id = this.m.ID;
			
			// this.logDebug("translation_ja | hook background: " + obj);
			
			if (!(id in backgrounds)) {
				this.logDebug("translation_ja | hook background: id not found " + id);
				return;
			}
			
			local b_trans = backgrounds[id];
			
			if ("name" in b_trans) {
				this.m.Name = b_trans.name;
			}
			if ("backgrounddesc" in b_trans) {
				//this.logDebug("translation_ja | hook background: backgrounddesc <- : " + this.m.BackgroundDescription + ", to " + b_trans.backgrounddesc);
				this.m.BackgroundDescription = b_trans.backgrounddesc;
			}
			if ("goodending" in b_trans) {
				this.m.GoodEnding = b_trans.goodending;
			}
			if ("badending" in b_trans) {
				this.m.BadEnding = b_trans.badending;
			}
			if ("description" in b_trans) {
				this.onBuildDescription = function() {
					return b_trans.description;
				}
			} else if ("descriptions" in b_trans) {
				local orig_desc = this.onBuildDescription();
				foreach (i, t in b_trans.descriptions) {
					if (t.b != "") {
						orig_desc = replaceText(orig_desc, t.b, t.t);
					}
				}
				this.onBuildDescription = function() {
					return orig_desc;
				}
			}
			

			local base_name = "生い立ち: ";
			if (!("getName" in this)) {
				local orig_getName = this.getName;
				this.getName <- function() {
					local orig = orig_getName();
					local replaced = base_name + this.m.Name;
					//this.logDebug("translation_ja | hook background: getname <- : " + orig + ", to " + replaced);
					return replaced;
				}
			}
			
			if ("options" in b_trans) {
				local orig_getTooltip = this.getTooltip;
				this.getTooltip = function() {
					local tooltip = orig_getTooltip();
					//this.logDebug("translation_ja | hook background: getTooltip = : " + tooltip);
					for (local i = 2; i < tooltip.len(); i++) {
						local tooltipData = tooltip[i];
						if ("text" in tooltipData) {
							foreach (i, t in b_trans.options) {
								tooltipData.text = replaceText(tooltipData.text, t.b, t.t);
							}
						}
					}
					return tooltip;
				}
			}
		}
	} else {
		this.logDebug("mod_translation_ja | tried to hook background, but create function does not found");
	}

});

/*
 Hook Perk
*/
//root_state.onInit
::mods_addHook("root_state.onInit", function(rootState) {
//beforeCampaignLoad
//::mods_addHook("beforeCampaignLoad", function() {
	//this.logDebug("translation_ja | replace Perk name and descriptions");
	
	local perks_array = gt.Const.Perks.Perks;
	local const_perkname = gt.Const.Strings.PerkName;
	local const_perkdesc = gt.Const.Strings.PerkDescription;
	
	foreach (p_trans in perks) {
		p_trans.description = replaceText(p_trans.description, "${Const.UI.Color.PositiveValue}", gt.Const.UI.Color.PositiveValue);
		p_trans.description = replaceText(p_trans.description, "${Const.UI.Color.NegativeValue}", gt.Const.UI.Color.NegativeValue);
		if ("effectdescriptions" in p_trans) {
			foreach (t in p_trans.effectdescriptions) {
				replaceConst(t);
			}
		}
	}
	
	//this.logDebug("translation_ja | perks " + perks_array);
	foreach (perks_for_level in perks_array) {
		foreach (p in perks_for_level) {
			local id = p.ID;
			if (id in perks) {
				local p_trans = perks[id];
				local origName = p.Name;
				
				foreach (key, value in const_perkname) {
					if (value == origName) {
						//this.logDebug("translation_ja | found in const " + value + ", key:" + key);
						if (key in const_perkdesc) {
							const_perkname[key] = p_trans.name;
							const_perkdesc[key] = p_trans.description;
						}
					}
				}
				
				p.Name = p_trans.name;
				p.Tooltip = p_trans.description;
			}
		}
	}
});

::mods_hookBaseClass("skills/skill", function(obj) {
	//this.logDebug("translation_ja | hook will try replace perks description: " + obj);

	if ("getDescription" in obj) {
		if ("create" in obj) {
			local orig_create = obj.create;
			obj.create = function() {
				orig_create();
			
				local id = this.m.ID;
				if (id in perks) {
					local t_perk = perks[id];
					if ("effectdescriptions" in t_perk) {
						local t_effectdescriptions = t_perk.effectdescriptions;
						//this.logDebug("translation_ja | found id in perks" + id);
						local orig_getDescription = this.getDescription;
						this.getDescription = function() {
							local text = orig_getDescription();
							foreach (t in t_effectdescriptions) {
								text = replaceText(text, t.b, t.t);
							}
							return text;
						}
					}
				}
			}
		}
	}
});

/*
 Hook situations
*/
::mods_hookBaseClass("entity/world/settlements/situations/situation", function(o) {

	local obj = o;
	
	if ("create" in obj) {
		local orig_create = obj.create;
		obj.create = function() {
			orig_create();
			local id = this.m.ID;
			
			//this.logDebug("translation_ja | hook situation: " + obj + ", id: " + id);
			
			if (!(id in situations)) {
				this.logDebug("translation_ja | hook situation: id not found " + id);
				return;
			}
			
			local s_trans = situations[id];
			
			if ("name" in s_trans) {
				this.m.Name = s_trans.name;
			}
			if ("description" in s_trans) {
				this.m.Description = s_trans.description;
			}
			if ("addstring" in s_trans) {
				if ("addString" in obj) {
					local text = s_trans.addstring;
					obj.addString = function( _s ) {
						local t1 = replaceText(text, "%_s%", _s);
						t1 = replaceText(t1, "%name%", this.m.Name);
						return t1;
					}
				}
			}
			if ("removestring" in s_trans) {
				if ("removeString" in obj) {
					local text = s_trans.removestring;
					obj.removeString = function( _s ) {
						local t1 = replaceText(text, "%_s%", _s);
						t1 = replaceText(t1, "%name%", this.m.Name);
						return t1;
					}
				}
			}

			if ("rumors" in s_trans) {
				this.m.Rumors = [];
				foreach (r in s_trans.rumors) {
					this.m.Rumors.push(r.t);
				}
			}
		}
	} else {
		this.logDebug("mod_translation_ja | tried to hook situation, but create function does not found");
	}

});

/*
 Hook ambitions
*/

local ambition_template = ambitions["ambition_template"];

foreach (amb in ambitions) {
	if ("successlist" in amb) {
		local successlist = amb.successlist;
		foreach (t in successlist)
		{
			replaceConst(t);
		}
	}
}

::mods_hookBaseClass("ambitions/ambition", function(o) {

	local obj = o;
	local simple_prop_map = {buttontext = "ButtonText", rewardtooltip="RewardTooltip", uitext="UIText", tooltiptext="TooltipText", successtext="SuccessText", successbuttontext="SuccessButtonText" };
	
	if ("create" in obj) {
		local orig_create = obj.create;
		obj.create = function() {
			orig_create();
			local id = this.m.ID;
			
			//this.logDebug("translation_ja | hook ambition: " + obj + ", id: " + id);
			
			if (!(id in ambitions)) {
				this.logDebug("translation_ja | hook ambition: id not found " + id);
				return;
			}
			
			local a_trans = ambitions[id];
			local md = this.m;
			
			if ("buttontext" in a_trans) {
				this.m.ButtonText = a_trans.buttontext;
			}
			if ("rewardtooltip" in a_trans) {
				this.m.RewardTooltip = a_trans.rewardtooltip;
			}
			if ("uitext" in a_trans) {
				this.m.UIText = a_trans.uitext;
			}
			if ("tooltiptext" in a_trans) {
				this.m.TooltipText = a_trans.tooltiptext;
			}
			if ("successtext" in a_trans) {
				this.m.SuccessText = a_trans.successtext;
			}
			if ("successbuttontext" in a_trans) {
				this.m.SuccessButtonText = a_trans.successbuttontext;
			}

			if ("getuitexts" in a_trans) {
				if ("getUIText" in obj) {
					local orig_getUIText = this.getUIText;
					this.getUIText = function() {
						local text = orig_getUIText();
						foreach (t in a_trans.getuitexts) {
							text = replaceText(text, t.b, t.t);
						}
						return text;
					}
				}
			}
			
			if ("successlist" in a_trans) {
				if ("onReward" in this) {
					local orig_onReward = this.onReward;
					obj.onReward = function() {
						orig_onReward();
						foreach (item in this.m.SuccessList) {
							if ("text" in item) {
								foreach (t in a_trans.successlist) {
									item.text = replaceText(item.text, t.b, t.t);
								}
							}
						}
					}
				}
			}
			
			if ("buttontooltips" in a_trans) {
				if ("getButtonTooltip" in this) {
					local orig_getButtonTooltip = this.getButtonTooltip;
					this.getButtonTooltip = function() {
						local ret = orig_getButtonTooltip();
						foreach (tp in ret) {
							foreach (t in a_trans.buttontooltips) {
								tp.text = replaceText(tp.text, t.b, t.t);
							}
						}
						return ret;
					}
				}
			}
		}
		
		//Replace getButtonTooltip
		local tooltip_obj = obj;
		if ("ambition" in tooltip_obj) {
			tooltip_obj = tooltip_obj.ambition;
		}
		if ("getButtonTooltip" in tooltip_obj) {
			local orig_getButtonTooltip = tooltip_obj.getButtonTooltip;
			tooltip_obj.getButtonTooltip = function() {
				local ret = orig_getButtonTooltip();
				foreach (tp in ret) {
					if (tp.id == 1 || tp.id == 4 || tp.id == 6) {
						foreach (t in ambition_template.buttontooltips) {
							tp.text = replaceText(tp.text, t.b, t.t);
						}
					}
				}
				return ret;
			}
		}

	} else {
		this.logDebug("mod_translation_ja | tried to hook ambition, but create function does not found");
	}

});

/*
 Hook Rumors
*/
::mods_addHook("root_state.onInit", function(rootState) {
	//this.logDebug("translation_ja | replace rumors.");
	
	local strings = gt.Const.Strings;
	
	foreach (key, r_trans in rumors) {
		if (key in strings) {
			if ("rumors" in r_trans) {
				//this.logDebug("translation_ja | rumors " + key  + " found array");
				local array = strings[key];
				for (local i = 0; i < array.len(); i++) {
					local text = array[i];
					foreach (t in r_trans.rumors) {
						text = replaceText(text, t.b, t.t);
					}
					array[i] = text;
				}
				strings[key] = array;
			} else if ("rumorsitems" in r_trans) {
				//this.logDebug("translation_ja | rumors " + key  + " found array of array");
				local array_of_array = strings[key];
				for (local j = 0; j < array_of_array.len(); j++) {
					local array = array_of_array[j];
					for (local i = 0; i < array.len(); i++) {
						local text = array[i];
						foreach (t in r_trans.rumorsitems) {
							text = replaceText(text, t.b, t.t);
						}
						array[i] = text;
					}
					array_of_array[j] = array;
				}
				strings[key] = array_of_array;
			}
		} else {
			
		}	
	}
});

::mods_hookClass("entity/world/settlements/buildings/tavern_building", function(obj) {
	local template = rumors["RumorsTemplate"];
	
	if ("getRumor" in obj) {
		local orig_getRumor = obj.getRumor;
		obj.getRumor = function( _isPaidFor = false ) {
			local text = orig_getRumor(_isPaidFor);
			foreach (t in template.rumorstemplate) {
				text = replaceText(text, t.b, t.t);
			}
			return text;
		}
	}
});

/*
 Hook constant strings
*/
::mods_addHook("root_state.onInit", function(rootState) {
	local strings = gt.Const.Strings;
	foreach (key, t_item in t_strings) {
		local tgt = strings;
		local dot = key.find(".");
		if (dot == null) {
			tgt = strings[key];
		} else {
			local key1 = key.slice(0, dot);
			local key2 = key.slice(dot + 1, key.len());
			tgt = strings[key1][key2];
		}
		
		if ("items" in t_item) {
			foreach (idx, value in tgt) {
				local text = value;
				foreach (t in t_item.items) {
					if (t.b != "") {
						text = replaceText(text, t.b, t.t);
					}
				}
				tgt[idx] = text;
			}
		} else if ("table" in t_item) {
			foreach (vkey, t in t_item.table) {
				if (vkey in tgt) {
					if (t.b != "") {
						tgt[vkey] = t.t;
					}
				}
			}
		}
	}
});

/*
 Hook scenario strings
*/
::mods_hookBaseClass("scenarios/world/starting_scenario", function(obj) {
	if ("create" in obj) {
		local orig_create = obj.create;
		obj.create = function() {
			orig_create();
			local id = this.m.ID;
			if (id in t_scenarios) {
				local t_obj = t_scenarios[id];
				if ("name" in t_obj) {
					this.m.Name = t_obj.name;
				}
				if ("description" in t_obj) {
					this.m.Description = t_obj.description;
				}
				if ("brosrawdescriptions" in t_obj && "onSpawnAssets" in this) {
					local orig_onSpawnAssets = this.onSpawnAssets;
					this.onSpawnAssets = function() {
						orig_onSpawnAssets();
						local roster = this.World.getPlayerRoster();
						local bros = roster.getAll();
						foreach (idx, bro in bros) {
							local bg = bro.getBackground();
							foreach (t in t_obj.brosrawdescriptions) {
								bg.m.RawDescription = replaceText(bg.m.RawDescription, t.b, t.t);
							}
							if (bg.m.Description != "") {
								bg.buildDescription(true);
							}
						}
					}
				}
			}
		}
	}
});

/*
 Hook active skill
*/
foreach (t_skill in t_skills_actives) {
	local props = ["gettooltips", "getdescriptions", "getcoststrings", "getdefaulttooltips"];
	foreach (prop in props) {
		if (prop in t_skill) {
			foreach (t in t_skill[prop]) {
				replaceConst(t);
			}
		}
	}
	if ("description" in t_skill) {
		t_skill.description = replaceConstString(t_skill.description);
	}
}

local t_base_skill = t_skills_actives["base.skill"];

::mods_hookBaseClass("skills/skill", function(obj) {

	if ("skill" in obj) {
		local skill_obj = obj.skill;
		
		if ("getCostString" in skill_obj) {
			local orig_getCostString = skill_obj.getCostString;
			skill_obj.getCostString = function() {
				local text = orig_getCostString();
				foreach (t in t_base_skill.getcoststrings) {
					text = replaceText(text, t.b, t.t);
				}
				return text;
			}
		}

		if ("getDefaultTooltip" in skill_obj)
		{
			local orig_getDefaultTooltip = skill_obj.getDefaultTooltip;
			skill_obj.getDefaultTooltip = function() {
				local ret = orig_getDefaultTooltip();
				foreach (r in ret) {
					if ("text" in r) {
						foreach (t in t_base_skill.getdefaulttooltips) {
							r.text = replaceText(r.text, t.b, t.t);
						}
					}
				}
				return ret;
			}
		}
	}

	if ("create" in obj) {
		local orig_create = obj.create;
		obj.create = function() {
			orig_create();
			local id = this.getID();
			if (id == "") {
				return;
			} else if (!(id in t_skills_actives)) {
				if (id.find("active.") == 0) {
					this.logDebug("translation_ja | hook skill id not found " + id);
				}
				return;
			}
			
			local t_skill = t_skills_actives[id];
			
			
			if ("name" in t_skill) {
				this.m.Name = t_skill.name;
			} 
			if ("description" in t_skill) {
				this.m.Description = t_skill.description;
			}
			if ("descriptions" in t_skill && "getDescription" in this) {
				local orig_getDescription = this.getDescription;
				this.getDescription = function() {
					local text = orig_getDescription();
					foreach (t in t_skill.descriptions) {
						text = replaceText(text, t.b, t.t);
					}
					return text;
				}
			}
			if ("gettooltips" in t_skill && "getTooltip" in this) {
				local orig_getTooltip = this.getTooltip;
				this.getTooltip = function() {
					local ret = orig_getTooltip();
					foreach (r in ret) {
						if ("text" in r) {
							foreach (t in t_skill.gettooltips) {
								r.text = replaceText(r.text, t.b, t.t);
							}
						}
					}
					return ret;
				}
			}
		}
	} 
});
