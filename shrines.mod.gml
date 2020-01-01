#define init
global.sprRadSplat  	= sprite_add("sprites/other/sprRadSplat.png" 		, 1, 0, 0);
global.sprCoinSplat 	= sprite_add("sprites/other/sprCoinSplat.png"		, 1, 0, 0);
global.sprMaxHPSplat  = sprite_add("sprites/other/sprMaxHPSplat.png"  , 1, 0, 0);
global.sprHealthSplat = sprite_add("sprites/other/sprHealthSplat.png" , 1, 0, 0);

global.sprShrineHatred = sprThroneStatue //sprite_add("sprites/shrines/sprShrineHatred.png", 1, 16, 50);

global.sprNo = sprite_add("sprites/other/sprNo.png", 1, 6, 6);

#macro item 				 mod_variable_get("mod", "itemlib", "ItemDirectory");
#macro CommonItems   mod_variable_get("mod", "items", "CommonItems"    );
#macro UncommonItems mod_variable_get("mod", "items", "UncommonItems"  );
#macro RareItems     mod_variable_get("mod", "items", "RareItems"      );
#macro c_gold $86C9DF

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
	uses = 1; // how many shrine uses are left before destruction

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

	// Shrine of Guns
	case   5: case "guns":    on_interact  = guns_interact;
														sprite_index = sprThroneStatue;
														sprite_broke = sprThroneStatueDead;
														cost    = 0;
														costval = 0; // change this back to 40

														upgrade[0] = -4;
														upgrade[1] = -4;
														upgrade[2] = -4;
														has_purchased = false;

														uses = 1 + round(item_get_power("paragon") > 0 ? item_get_power("paragon") + 1 : 0);
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
														costval = 0; // change this back to 1

														uses = 1 + round(item_get_power("paragon") > 0 ? item_get_power("paragon") + 1 : 0);
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
		case  0: _costvar = GameCont.rad;             								break;
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
		if uses <= 0 instance_destroy();
	}
}

#define shrine_destroy
with instance_create(x, y, ChestOpen){sprite_index = other.sprite_broke}
view_shake_at(x, y, 16);
sleep(15);

#define guns_interact // 5: Shrine of Guns
has_purchased = true;
weapon_upgrade(Player.wep)
if upgrade[0] = -4
{
	has_purchased = false;
	cost += costval
	sound_play(sndCursedReminder)
}
else
{
	var _wep = Player.wep;
	script_execute(draw);
	with instance_create(x, y, PopupText)
	{
		target = Player;
		mytext = string(weapon_get_name(Player.wep)) + "!";
	}
	if _wep != Player.wep
	{
		uses--;
		trace(uses)
	}
	else
	{
		has_purchased = false;
		cost += costval
	}
}

#define hatred_interact // 6: Shrine of Hatred
var _chest_index = -1, // 0 = rad can, 1 = ammo chest, 2 = weapon chest, 3 = item_chest
						  _i = 0,
					_timer = 0,
		 	 _maxtimer = (5 - round(1 + item_get_power("paragon"))) / current_time_scale,
				 _amount = 5 + roll(1 + item_get_power("paragon")),
				 	 _dist = 28,
					  _ang = random(360)
uses--;
do
{
	if _timer <= 0
	{
		_i++
		_chest_index = choose("RadChest?", "AmmoChest", "WeaponChest?","RadChest?", "AmmoChest", "WeaponChest?", "ItemChest");
		var _extradist = round(1 + item_get_power("paragon")) / 2;
		if crown_current = crwn_hatred && _i = _amount - 1 _chest_index = "HealthChest"
		with obj_create(x + lengthdir_x(_dist + _extradist, _ang) * 2, y + lengthdir_y(_dist + _extradist, _ang) * 2, _chest_index)
		{
			image_index = 1;
			repeat(12){with instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Dust){motion_add(random(360), random_range(5, 8))}}
			do
			{
				with instance_nearest(x, y, Wall) if distance_to_object(other) <= 10
				{
					instance_create(x, y, FloorExplo);
					instance_destroy();
				}
			}until(distance_to_object(instance_nearest(x, y, Wall)) > 10)
		}
		view_shake_max_at(x, y, 10)
		wait(6)
		sleep(20)
		_ang += (360 / (_amount)) * (_amount * 2 + 1);
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
uses--;

#define luck_interact // 10: Shrine of Luck


#define risk_interact // 12: Shrine of Risk
with instance_create(Player.x, Player.y, PopupText) {text = string(other.costval * -1) + " MAX HP"; target = Player}
sound_play_pitch(sndFreakDead,0.8)
sound_play_pitch(sndBloodLauncherExplo, 1)
var _ang = point_direction(Player.x, Player.y, x, y),
		_i   = 0;
repeat(roll(1 + item_get_power("paragon"))) with obj_create(Player.x + lengthdir_x(26, _ang), Player.y + lengthdir_y(26, _ang), "Item")
{
	item_index = UncommonItems[round(random_range(0, array_length_1d(UncommonItems) - 1))]
}
uses--;

#define shrine_interact

//  2: Shrine of Death

//  3: Shrine of Life

//  4: Shrine of Haste

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
		draw_text(x - sprite_get_width(_splat)/2 + 18, y + 3, string(costval))

		if index = crwn_guns
		{
			weapon_upgrade(Player.wep)

			var _branches = 0,
								 _i = 0,
					 _xmargin = 25,
					 _ymargin = 20,
					  _bbox_x = 12,
						_bbox_y = 15,
						 _abs_l = 0,
				 _sprmargin = 0,
				     _texty = 0;

			if upgrade[0] > -4 {_branches++; _abs_l += sprite_get_width(weapon_get_sprite(upgrade[0])); if sprite_get_width(weapon_get_sprite(upgrade[0])) > _sprmargin _sprmargin = sprite_get_width(weapon_get_sprite(upgrade[0])); if sprite_get_height(weapon_get_sprite(upgrade[0])) > _texty _texty = sprite_get_height(weapon_get_sprite(upgrade[0]))}
			if upgrade[1] > -4 {_branches++; _abs_l += sprite_get_width(weapon_get_sprite(upgrade[1])); if sprite_get_width(weapon_get_sprite(upgrade[1])) > _sprmargin _sprmargin = sprite_get_width(weapon_get_sprite(upgrade[1])); if sprite_get_height(weapon_get_sprite(upgrade[1])) > _texty _texty = sprite_get_height(weapon_get_sprite(upgrade[1]))}
			if upgrade[2] > -4 {_branches++; _abs_l += sprite_get_width(weapon_get_sprite(upgrade[2])); if sprite_get_width(weapon_get_sprite(upgrade[2])) > _sprmargin _sprmargin = sprite_get_width(weapon_get_sprite(upgrade[2])); if sprite_get_height(weapon_get_sprite(upgrade[2])) > _texty _texty = sprite_get_height(weapon_get_sprite(upgrade[2]))}
			_texty++;

			if _branches > 0 repeat(_branches)
			{
				var _xpos = x + (sprite_get_xoffset(weapon_get_sprite(upgrade[_i])) - sprite_get_width(weapon_get_sprite(upgrade[_i])) / 2) + _sprmargin * _i - _sprmargin * (_branches - 1) / 2
				_bbox_x = _sprmargin / 2;
				_bbox_y = sprite_get_height(weapon_get_sprite(upgrade[_i]));
				var _rect = point_in_rectangle(mouse_x, mouse_y, _xpos - _bbox_x + sprite_get_xoffset(weapon_get_sprite(upgrade[_i])), y - _ymargin - sprite_get_yoffset(weapon_get_sprite(upgrade[_i])), _xpos + sprite_get_xoffset(weapon_get_sprite(upgrade[_i])) + _bbox_x, y - _ymargin - sprite_get_yoffset(weapon_get_sprite(upgrade[_i])) + _bbox_y)
				draw_weapon(weapon_get_sprite(upgrade[_i]), _xpos, y - _ymargin - _rect, _rect = true ? (weapon_get_gold(upgrade[_i]) ? c_gold : c_white) : (weapon_get_gold(upgrade[_i]) ? merge_color(c_gold, c_dkgray, .5) : c_ltgray))
				if point_in_rectangle(mouse_x, mouse_y, _xpos - _bbox_x + sprite_get_xoffset(weapon_get_sprite(upgrade[_i])), y - _ymargin - sprite_get_yoffset(weapon_get_sprite(upgrade[_i])), _xpos + sprite_get_xoffset(weapon_get_sprite(upgrade[_i])) + _bbox_x, y - _ymargin - sprite_get_yoffset(weapon_get_sprite(upgrade[_i])) + _bbox_y)
				{
					draw_text_nt(x, y - _ymargin - _texty, weapon_get_name(upgrade[_i]))
					if has_purchased = true
					{
						Player.wep = upgrade[_i]
						has_purchased = false;
					}
				}
				_i++;
			}
			else
			{
				draw_weapon(weapon_get_sprite(Player.wep), x - sprite_get_width(weapon_get_sprite(Player.wep)) / 2 + sprite_get_xoffset(weapon_get_sprite(Player.wep)), y - sprite_get_height(weapon_get_sprite(Player.wep)) + sprite_get_yoffset(weapon_get_sprite(Player.wep)) - _ymargin, c_red);
				draw_sprite(global.sprNo, 0, x, y - sprite_get_height(weapon_get_sprite(Player.wep)) + sprite_get_yoffset(weapon_get_sprite(Player.wep)) - _ymargin + 1);
				draw_text_nt(x, y - sprite_get_height(weapon_get_sprite(Player.wep)) + sprite_get_yoffset(weapon_get_sprite(Player.wep)) - _ymargin - 16, "CANNOT UPGRADE")
			}
		}
	}
}

#define draw_weapon(SPRITE_INDEX, X, Y, COLOUR)
draw_sprite_ext(SPRITE_INDEX, 1, X - 1, Y, 1, 1, 0, COLOUR, 1);
draw_sprite_ext(SPRITE_INDEX, 1, X, Y - 1, 1, 1, 0, COLOUR, 1);
draw_sprite_ext(SPRITE_INDEX, 1, X + 1, Y, 1, 1, 0, COLOUR, 1);
draw_sprite_ext(SPRITE_INDEX, 1, X, Y + 1, 1, 1, 0, COLOUR, 1);
draw_set_fog(true, c_black,  0, 0);
draw_sprite(SPRITE_INDEX, 1, X, Y);
draw_set_fog(false, c_white,  0, 0);

#define weapon_upgrade(WEAPON)
switch WEAPON
{
	case wep_revolver          : upgrade[0] = wep_machinegun;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_machinegun        : upgrade[0] = wep_smg;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_smg               : upgrade[0] = wep_smart_gun;
															 upgrade[1] = wep_bouncer_smg;
															 upgrade[2] = wep_minigun;
															 break;
	case wep_bouncer_smg       : upgrade[0] = wep_bouncer_shotgun;
													 		 upgrade[1] = -4;
													 		 upgrade[2] = -4;
													 		 break;
	case wep_assault_rifle     : upgrade[0] = wep_hyper_rifle;
															 upgrade[1] = wep_heavy_assault_rifle;
															 upgrade[2] = -4;
															 break;
	case wep_heavy_revolver    : upgrade[0] = wep_heavy_machinegun;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_heavy_machinegun  : upgrade[0] = wep_heavy_assault_rifle;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_minigun           : upgrade[0] = wep_double_minigun;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_triple_machinegun : upgrade[0] = wep_quadruple_machinegun;
															 upgrade[1] = wep_incinerator;
															 upgrade[2] = -4;
															 break;
	case wep_pop_rifle         : upgrade[0] = wep_pop_gun;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_rusty_revolver    : upgrade[0] = wep_revolver;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
  case wep_golden_revolver   : upgrade[0] = wep_golden_machinegun;
															 upgrade[1] = -4;
															 upgrade[2] = -4;
															 break;
	case wep_golden_machinegun  : upgrade[0] = wep_golden_assault_rifle;
													 		 upgrade[1] = -4;
													 		 upgrade[2] = -4;
													 		 break;
	case wep_rogue_rifle       : upgrade[0] = wep_assault_rifle;
															 upgrade[1] = wep_machinegun;
															 upgrade[2] = -4;
															 break;

  case wep_shotgun			 		  : upgrade[0] = wep_double_shotgun;
												  	 		upgrade[1] = wep_flame_shotgun;
												  	 		upgrade[2] = -4;
												  	 		break;
  case wep_double_shotgun  		: upgrade[0] = wep_double_flame_shotgun;
											  		 		upgrade[1] = -4;
										  			 		upgrade[2] = -4;
												  	 		break;
	case wep_auto_shotgun       : upgrade[0] = wep_auto_flame_shotgun;
														 		upgrade[1] = -4;
														 		upgrade[2] = -4;
														 		break;
	case wep_flame_shotgun      : upgrade[0] = wep_double_flame_shotgun;
												     	  upgrade[1] = wep_auto_flame_shotgun;
												   	    upgrade[2] = -4;
	case wep_auto_flame_shotgun : upgrade[0] = wep_incinerator;
													 	    upgrade[1] = wep_auto_flame_shotgun;
													 	    upgrade[2] = -4;
												  	 		break;
  case wep_slugger        		: upgrade[0] = wep_assault_slugger;
													   		upgrade[1] = wep_flak_cannon;
													   		upgrade[2] = wep_heavy_slugger;
													   		break;
  case wep_heavy_slugger  		: upgrade[0] = wep_hyper_slugger;
													   		upgrade[1] = -4;
													   		upgrade[2] = -4;
													   		break;
	case wep_assault_slugger 		: upgrade[0] = wep_super_slugger;
												     		upgrade[1] = wep_flak_cannon;
												  	 		upgrade[2] = -4;
												   	 		break;
	case wep_flak_cannon     		: upgrade[0] = wep_super_flak_cannon;
											  		 		upgrade[1] = -4;
											 	  	 		upgrade[2] = -4;
											 	  	 		break;
	case wep_golden_shotgun  		: upgrade[0] = wep_golden_slugger;
												  	 		upgrade[1] = -4;
												  	 		upgrade[2] = -4;
												  	 		break;

	case wep_flare_gun	     	 	  	 : upgrade[0] = wep_flame_cannon;
												      			 upgrade[1] = wep_sticky_launcher;
												      			 upgrade[2] = -4;
												      			 break;
	case wep_blood_launcher  		  	 : upgrade[0] = wep_blood_cannon;
											 	      			 upgrade[1] = -4;
											 	 		  			 upgrade[2] = -4;
											 	 		  			 break;
	case wep_grenade_launcher 			 : upgrade[0] = wep_sticky_launcher;
														  			 upgrade[1] = wep_bazooka;
														  			 upgrade[2] = wep_toxic_launcher;
														  			 break;
	case wep_bazooka          			 : upgrade[0] = wep_gatling_bazooka;
																		 upgrade[1] = wep_super_bazooka;
																		 upgrade[2] = wep_nuke_launcher;
																		 break;
	case wep_sticky_launcher  			 : upgrade[0] = wep_heavy_grenade_launcher;
																		 upgrade[1] = wep_blood_launcher;
																		 upgrade[2] = wep_hyper_launcher;
																		  break;
	case wep_auto_grenade_shotgun 	 : upgrade[0] = wep_heavy_grenade_launcher;
																		 upgrade[1] = -4;
																		 upgrade[2] = -4;
																		 break;
	case wep_flamethrower						 : upgrade[0] = wep_dragon;
																		 upgrade[1] = -4;
																		 upgrade[2] = -4;
																		 break;
	case wep_golden_grenade_launcher : upgrade[0] = wep_golden_bazooka;
																   	 upgrade[1] = -4;
																		 upgrade[2] = -4;
																		 break;
	case wep_golden_bazooka 				 : upgrade[0] = wep_nuke_launcher;
																		 upgrade[1] = -4;
																		 upgrade[2] = -4;
																		 break;

	case wep_crossbow 			 : upgrade[0] = wep_heavy_crossbow;
														 upgrade[1] = wep_splinter_gun;
													   upgrade[2] = wep_toxic_bow;
														 break;
	case wep_splinter_gun    : upgrade[0] = wep_super_splinter_gun;
													   upgrade[1] = wep_splinter_pistol;
													   upgrade[2] = wep_seeker_pistol;
													   break;
  case wep_seeker_pistol   : upgrade[0] = wep_seeker_shotgun;
													   upgrade[1] = -4;
													   upgrade[2] = -4;
													   break;
	case wep_heavy_crossbow  : upgrade[0] = wep_super_crossbow;
							 							 upgrade[1] = wep_auto_crossbow;
							 							 upgrade[2] = -4;
							 							 break;
	case wep_auto_crossbow   : upgrade[0] = wep_heavy_auto_crossbow;
														 upgrade[1] = -4;
														 upgrade[2] = -4;
														 break;
	case wep_disc_gun        : upgrade[0] = wep_super_disc_gun;
												  	 upgrade[1] = wep_blood_hammer;
													   upgrade[2] = -4;
													   break;
  case wep_golden_crossbow : upgrade[0] = wep_golden_splinter_gun;
														 upgrade[1] = -4;
														 upgrade[2] = -4;
														 break;

	case wep_laser_pistol  	     : upgrade[0] = wep_laser_rifle;
																 upgrade[1] = wep_plasma_gun;
																 upgrade[2] = wep_lightning_pistol;
																 break;
	case wep_laser_rifle   	     : upgrade[0] = wep_laser_minigun;
																 upgrade[1] = wep_laser_cannon;
																 upgrade[2] = -4;
																 break;
	case wep_plasma_gun    	  	 : upgrade[0] = wep_plasma_cannon;
																 upgrade[1] = wep_plasma_rifle;
																 upgrade[2] = -4;
																 break;
	case wep_plasma_cannon 	 	   : upgrade[0] = wep_super_plasma_cannon;
																 upgrade[1] = wep_devastator;
																 upgrade[2] = -4;
																 break;
	case wep_plasma_rifle  	 	   : upgrade[0] = wep_plasma_minigun;
																 upgrade[1] = -4;
																 upgrade[2] = -4;
																 break;
	case wep_lightning_pistol 	 : upgrade[0] = wep_lightning_cannon;
														  	 upgrade[1] = wep_lightning_rifle;
														  	 upgrade[2] = wep_lightning_shotgun;
														  	 break;
	case wep_golden_laser_pistol : upgrade[0] = wep_golden_plasma_gun;
																 upgrade[1] = -4;
																 upgrade[2] = -4;
																 break;

	case wep_screwdriver 	 			: upgrade[0] = wep_wrench;
												 	 			upgrade[1] = wep_energy_screwdriver;
												 	 			upgrade[2] = -4;
												 	 			break;
	case wep_wrench 			 			: upgrade[0] = wep_sledgehammer;
												 	 			upgrade[1] = wep_shovel;
												 	 			upgrade[2] = wep_energy_sword;
												 	 			break;
	case wep_sledgehammer  			: upgrade[0] = wep_energy_hammer;
												 	 			upgrade[1] = wep_jackhammer;
												 	 			upgrade[2] = wep_lightning_hammer;
												 	 			break;
	case wep_golden_screwdriver : upgrade[0] = wep_golden_wrench;
									  		 	 			upgrade[1] = -4;
										  	   			upgrade[2] = -4;
												   			break;
	case wep_chicken_sword 			: upgrade[0] = wep_black_sword;
													 			upgrade[1] = wep_energy_sword;
													 			upgrade[2] = -4;
													 			break;
	case wep_frog_pistol  			: upgrade[0] = wep_golden_frog_pistol;
																upgrade[1] = -4;
																upgrade[2] = -4;
																break;
	case wep_eggplant			 			: upgrade[0] = wep_sentry_gun;
																upgrade[1] = wep_ion_cannon;
																upgrade[2] = wep_party_gun;
																break;
	default                			: upgrade[0] = -4;
													 			upgrade[1] = -4;
													 			upgrade[2] = -4;
													 			break;
}

#define roll(VALUE)										return mod_script_call("mod", "items", "roll", VALUE);
#define reorder() 										return mod_script_call("mod", "items", "reorder");
#define save_save()                   return mod_script_call("mod", "main" , "save_save");
#define get_item(ITEM, AMOUNT)				return mod_script_call("mod", "items", "get_item", ITEM, AMOUNT);
#define add_item(ITEM, AMOUNT)				return mod_script_call("mod", "items", "add_item", ITEM, AMOUNT);
#define obj_create(X, Y, OBJECT_NAME) return mod_script_call("mod", "items", "obj_create", X, Y, OBJECT_NAME);
#define chest_setup() 								return mod_script_call("mod", "items", "chest_setup");
#define item_get_power(ITEM)          return mod_script_call("mod", "items", "item_get_power",ITEM);
