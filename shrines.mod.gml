#define init
global.sprRadSplat  	= sprite_add("sprites/other/sprRadSplat.png" 		, 1, 0, 0);
global.sprCoinSplat 	= sprite_add("sprites/other/sprCoinSplat.png"		, 1, 0, 0);
global.sprMaxHPSplat  = sprite_add("sprites/other/sprMaxHPSplat.png"  , 1, 0, 0);
global.sprHealthSplat = sprite_add("sprites/other/sprHealthSplat.png" , 1, 0, 0);

global.sprShrineHatred = sprThroneStatue //sprite_add("sprites/shrines/sprShrineHatred.png", 1, 16, 50);

#macro item 				 mod_variable_get("mod", "itemlib", "ItemDirectory");
#macro CommonItems   mod_variable_get("mod", "items", "CommonItems"    );
#macro UncommonItems mod_variable_get("mod", "items", "UncommonItems"  );
#macro RareItems     mod_variable_get("mod", "items", "RareItems"      );

#define shrine_create(X, Y)
var _s = instance_create(X, Y, CustomObject);
with _s
{
	mask_index = sprThroneStatue;
	name   = "shrine";
	near   = false;
	index  =  0;
	cost   = -1; // index of cost, -1 = nothing, 0 = rads, 1 = HP. 2 = Max HP, 3 = Cursed coin
	costval = 0; // how much of the cost needs to be spent
	canuse  = false; // whether or not the player has the currency for this shrine

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
	on_step 	 = shrine_step
	on_destroy = shrine_destroy
}
return _s;

#define shrine_setup()
switch index
{
	// Shrine of Death
	case   2: case "death":  	on_interact  = death_interact;
												  	sprite_index = sprThroneStatue;
														sprite_broke = sprThroneStatueDead;
												  	cost    = -1;
												  	costval = -1;
												  	break;
	// Shrine of Hatred
	case   6: case "hatred":  on_interact  = hatred_interact;
													  sprite_index = global.sprShrineHatred;
														sprite_broke = sprThroneStatueDead;
													  cost    = 3;
													  costval = 0; // change this back to 1
													  break;
	// Shrine of Destiny
	 case  8:	case "destiny": on_interact  = destiny_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprThroneStatueDead;
														cost    = 3;
														costval = 0; // change this back to 2
														break;
	// Shrine of Luck
	case 10: case "luck":     on_interact  = luck_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprThroneStatueDead;
														cost    = 3;
														costval = 1;
														break;
	// Shrine of Risk
	case 12: case "risk":     on_interact  = risk_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprThroneStatueDead;
														cost    = 2;
														costval = 2;
														break;
	// Printer
	case 14: case "printer":  on_interact  = destiny_interact;
												    sprite_index = sprThroneStatue;
														sprite_broke = sprThroneStatueDead;
												    cost    = -1;
												    costval = 1;
												    break;
}
mask_index = mskBanditBoss;

#define shrine_step
if place_meeting(x, y, Player){near = true}else{near = false}
canuse = false;

if near = true
{
	// Determining if player needs something to give to use or not
	var _costvar = -4;

	switch cost
	{
		case -1: _costvar = -4;  							         								break;
		case  0: _costvar = GameCont.rads;             								break;
		case  1: _costvar = Player.my_health;   									    break;
		case  2: _costvar = -4;                 									  	break;
		case  3: _costvar = mod_variable_get("mod", "main", "coins"); break;
	}
	if canuse = false
	{
		if button_pressed(Player.index, "pick")
		{
			if _costvar = -4
			{
				canuse = true;
			}
			else if _costvar >= costval
			{
				_costvar -= costval;
				canuse    = true;
				if cost = 3{mod_variable_set("mod", "main", "coins", mod_variable_get("mod", "main", "coins") - costval); save_save()}
			}
		}
		else{sound_play(sndCursedReminder)}
	}
	if canuse = true
	{
		script_execute(on_interact);
		if cost = 2{get_item(item[? "injury"], 2)}
		instance_destroy();
	}
}

#define shrine_destroy
with instance_create(x, y, ChestOpen){sprite_index = other.sprite_broke}
view_shake_at(x, y, 16);
sleep(15);

#define hatred_interact // 6: Shrine of Hatred
var _chest_index = -1, // 0 = rad can, 1 = ammo chest, 2 = weapon chest, 3 = item_chest
						  _i = 0,
					_timer = 0,
		 	 _maxtimer = 5 / current_time_scale,
				 _amount = 5,
				 	 _dist = 36,
					  _ang = random(360)
do
{
	if _timer <= 0
	{
		_i++
		_chest_index = choose("RadChest", "AmmoChest", "WeaponChest?", "ItemChest");
		with obj_create(x + lengthdir_x(_dist, _ang), y + lengthdir_y(_dist, _ang), _chest_index)
		{
			image_index = 1;
			repeat(12){with instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Dust){motion_add(random(360), random_range(5, 8))}}
			do
			{
				with instance_nearest(x, y, Wall) if distance_to_object(other) <= 8
				{
					instance_create(x, y, FloorExplo);
					instance_destroy();
				}
			}until(distance_to_object(instance_nearest(x, y, Wall)) > 8)
		}
		view_shake_max_at(x, y, 10)
		wait(6)
		sleep(20)
		_ang += (360 / (_amount)) * 7;
		_timer = _maxtimer;
	}
	else
	{
		_timer--;
	}
} until (_i >= _amount)

#define destiny_interact // 8: Shrine of Destiny
if reorder() = false
{
	with instance_create(Player.x, Player.y, PopupText)
	{
		 text = "NOTHING TO BE REORDERED"
		 time = 20
	}
}
else
{
	sound_play_pitch(sndLilHunterAppear, 0.5)
	with instance_create(Player.x, Player.y, PopupText)
	{
		 text = "@qIT @qIS @qDONE"
		 time = 20
	}
}

#define luck_interact // 10: Shrine of Luck


#define risk_interact // 12: Shrine of Risk
with instance_create(Player.x, Player.y, PopupText) {text = string(other.costval * -1) + " MAX HP"; target = Player}
sound_play_pitch(sndFreakDead,0.8)
sound_play_pitch(sndBloodLauncherExplo, 1)
var _ang = point_direction(Player.x, Player.y, x, y),
		_i   = 0;
with obj_create(Player.x + lengthdir_x(26, _ang), Player.y + lengthdir_y(26, _ang), "Item")
{
	item_index = UncommonItems[round(random_range(0, array_length_1d(UncommonItems) - 1))]
}

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

#define draw
with instances_matching(CustomObject, "name", "shrine")
{
	if near = true
	{
		var _splat = mskNone;
		switch cost
		{
			case 0: _splat = global.sprRadSplat 	; break;
			case 1: _splat = global.sprHealthSplat; break;
			case 2: _splat = global.sprMaxHPSplat ; break;
			case 3: _splat = global.sprCoinSplat	; break;
		}
		draw_sprite(_splat, 0, x - sprite_get_width(_splat)/2, y)
		draw_text(x - sprite_get_width(_splat)/2 + 16, y + 3, string(costval))
	}
}

#define step

#define reorder() 										return mod_script_call("mod", "items", "reorder");
#define save_save()                   return mod_script_call("mod", "main" , "save_save");
#define get_item(ITEM, AMOUNT)				return mod_script_call("mod", "items", "get_item", ITEM, AMOUNT);
#define add_item(ITEM, AMOUNT)				return mod_script_call("mod", "items", "add_item", ITEM, AMOUNT);
#define chest_setup() 								return mod_script_call("mod", "items", "chest_setup");
#define obj_create(X, Y, OBJECT_NAME) return mod_script_call("mod", "items", "obj_create", X, Y, OBJECT_NAME);
