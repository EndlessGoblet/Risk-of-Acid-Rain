#define init

#macro CommonItems   mod_variable_get("mod", "items", "CommonItems" );
#macro UncommonItems mod_variable_get("mod", "items", "UncmmonItems");
#macro RareItems     mod_variable_get("mod", "items", "RareItems"   );

#define shrine_create(X, Y)
var _s = instance_create(X, Y, CustomObject);
with _s
{
	mask_index = sprThroneStatue;
	index  =  0;
	cost   = -1; // index of cost, -1 = nothing, 0 = rads, 1 = HP. 2 = Max HP, "item name" = item, "rarity" = item of certain rarity, "currency" = Cursed coin
	costval = 0; // how much of the cost needs to be spent

	var _i = 0;
	do
	{
		with instance_nearest(x, y, Wall) if distance_to_object(other) <= 32
		{
			instance_create(x, y, FloorExplo);
			instance_destroy();
		}
		_i++;
	}until(_i = 24)
	with Debris instance_delete(self);

	shrine_setup()
	on_step = shrine_step
}
return _s;

#define shrine_setup()
switch index
{
	// Shrine of Death
	case   2: case "death":  	on_interact  = death_interact;
												  	sprite_index = sprThroneStatue;
														sprite_broke = sprYVStatueDead;
												  	cost    = -1;
												  	costval = -1;
												  	break;
	// Shrine of Hatred
	case   6: case "hatred":  on_interact  = hatred_interact;
													  sprite_index = sprThroneStatue;
														sprite_broke = sprYVStatueDead;
													  cost    = "currency";
													  costval = 1;
													  break;
	// Shrine of Destiny
	 case  8:	case "destiny": on_interact  = destiny_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprYVStatueDead;
														cost    = "currency";
														costval = 2;
														break;
	// Shrine of Luck
	case 10: case "luck":     on_interact  = luck_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprYVStatueDead;
														cost    = "currency";
														costval = 1;
														break;
	// Shrine of Risk
	case 12: case "risk":     on_interact  = risk_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprYVStatueDead;
														cost    = 2;
														costval = 1;
														break;
	// Printer
	case 14: case "printer":  on_interact  = destiny_interact;
												    sprite_index = sprThroneStatue;
														sprite_broke = sprYVStatueDead;
												    cost    = -1;
												    costval = 1;
												    break;
}

#define shrine_step
if place_meeting(x, y, Player)
{
	script_execute(on_interact);
	instance_destroy();
}

#define hatred_interact // 6: Shrine of Hatred
for(var _i = 0, _amount = 5, _ang = random(360); _i < _amount; _i++)
{
	instance_create(x + lengthdir_x(40, _ang), y + lengthdir_y(40, _ang), choose(RadChest, AmmoChest, WeaponChest))
	_ang += 360 / _amount;
}

#define destiny_interact // 8: Shrine of Destiny
reorder();
sound_play_pitch(sndLilHunterAppear, 0.5)
with instance_create(Player.x, Player.y, PopupText)
{
	 text = "@qIT @qIS @qDONE"
	 time = 20
}
instance_destroy()

#define luck_interact // 10: Shrine of Luck
var _roll          = irandom(99),
    _reward        = -4,
		_reward_amount = -1;

if _roll <= 29							 { _reward        = item[? "currency"];
															 _reward_amount = choose(1, 2, 2, 2, 2, 3, 3, 4);
		  											 } // 30 % Chance at cursed coin
if _roll <= 49 && _roll > 29 { _reward 			  = CommonItems[irandom_range(0, array_length(CommonItems) - 1)];
															 _reward_amount = choose(1, 1, 1, 2, 2, 2, 3, 3, 4);
														 } // 20 % Chance at common item
if _roll <= 57 && _roll > 49 { _reward 			  = UncommonItems[irandom_range(0, array_length(UncommonItems) - 1)];
															 _reward_amount = choose(1, 1, 1, 1, 2, 2, 2, 3, 3);
														 } // 8 % Chance at uncommon item
if _roll <= 59 && _roll > 57 { _reward 			  = RareItems[irandom_range(0, array_length(RareItems) - 1)];
															 _reward_amount = choose(1, 1, 1, 1, 1, 2, 2, 2, 3);
														 } // 2 % Chance at rare item
if _roll <= 99 && _roll > 59 { _reward 			  = choose(AmmoPickup)
															 _reward_amount = choose(1, 1, 1, 2, 2, 2, 2, 3, 3);
														 } // 40 % Chance at pickup
repeat(_reward_amount){instance_create(x, y, _reward)}

#define risk_interact // 12: Shrine of Risk
with instance_create(Player.x, Player.y, PopupText) {text = "-" + string(carnage) + " MAX HP"; target = Player}
sound_play_pitch(sndFreakDead,0.8)
sound_play_pitch(sndBloodLauncherExplo, 1)
var _ang = random(360),
		_i   = 0;
with obj_create(Player.x + lengthdir_x(26, _ang + _i * 180), Player.y + lengthdir_y(26, _ang + _i * 180), "ItemChest")
{
	tag = "item"
	item_index = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]
	chest_setup(tag)
}
get_item(item[? "injury"])

#define shrine_interact

//  2: Shrine of Death

//  3: Shrine of Life

//  4: Shrine of Haste

//  5: Shrine of Guns

//  7: Shrine of Blood

//  9: Shrine of Love

// 11: Shrine of Curses

// 13: Shrine of Protection

// Printer

// Uncursing Pool

#define reorder() 										return mod_script_call("mod", "items", "reorder");
#define get_item(ITEM)								return mod_script_call("mod", "items", "get_item", ITEM);
#define chest_setup() 								return mod_script_call("mod", "items", "chest_setup");
#define obj_create(X, Y, OBJECT_NAME) return mod_script_call("mod", "items", "obj_create", X, Y, OBJECT_NAME);
