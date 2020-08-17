#define init
	global.sprRadSplat  	= sprite_add("sprites/other/sprRadSplat.png" 		, 1, 0, 0);
	global.sprCoinSplat 	= sprite_add("sprites/other/sprCoinSplat.png"		, 1, 0, 0);
	global.sprMaxHPSplat  = sprite_add("sprites/other/sprMaxHPSplat.png"  , 1, 0, 0);
	global.sprHealthSplat = sprite_add("sprites/other/sprHealthSplat.png" , 1, 0, 0);

	global.shrineIcons = sprite_add("sprites/shrines/shrineIcons.png", 16, 13, 13)

	global.sprItems = sprite_add("sprites/items/sprItems.png", 101, 17, 17);

	global.mskShrineGuns = sprite_add("sprites/other/mskShrineGuns.png", 1, 21, 16);
	
	global.sprPrinter = sprite_add("sprites/shrines/sprPrinter.png", 1, 15, 12);

	global.sprShrineHatred = sprThroneStatue //sprite_add("sprites/shrines/sprShrineHatred.png", 1, 16, 50);

	global.sprNo = sprite_add("sprites/other/sprNo.png", 1, 6, 6);

#macro item 				 mod_variable_get("mod", "itemlib","ItemDirectory" );
#macro CommonItems   mod_variable_get("mod", "items"  , "CommonItems"  );
#macro UncommonItems mod_variable_get("mod", "items"  , "UncommonItems");
#macro RareItems     mod_variable_get("mod", "items"  , "RareItems"    );
#macro UniqueItems   mod_variable_get("mod", "items"  , "UniqueItems"  );
#macro CursedItems   mod_variable_get("mod", "items"  , "CursedItems"  );
#macro PlayerItems	 mod_variable_get("mod", "items"  , "PlayerItems"  );
#macro c_gold $86C9DF

 #define step 

 #define shrine_create(X, Y)
	var _s = instance_create(X, Y, CustomObject);
	with _s
	{
		sprite_shadow = shd16;
		shadow_y = 7;
		mask_index = sprThroneStatue;
		name   = "shrine";
		near   = false;
		index  =  0;
		cost   = -1; // index of cost, -1 = nothing, 0 = rads, 1 = HP. 2 = Max HP, 3 = Cursed coin, 4 = Nothing
		costval = 0; // how much of the cost needs to be spent
		canuse  = false; // whether or not the player has the currency for this shrine
		uses = 1; // how many shrine uses are left before destruction
		pause = room_speed * 1; // time buffer between successful uses
		is_shrine = true;// whether or not this interactable is a shrine for the 'on_shrine' effects
		deathtimer = -1;

		var _i = 0;
		with instances_matching(CustomObject, "name", "Teleporter"){
			if distance_to_object(other) < 48{
				with other{
					do{
						x -= lengthdir_x(1, point_direction(x, y, other.x, other.y));
						y -= lengthdir_y(1, point_direction(x, y, other.x, other.y));
						if place_meeting(x, y, Wall){
							with instance_nearest(x, y, Wall){
								instance_create(x, y, FloorExplo);
								instance_destroy();
							}
						}
						_i++;
					}until distance_to_object(other) >= 48 || _i = 48
				}
			}
		}

		_i = 0;
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
		case   2: case "death": on_interact  = death_interact;
		
								sprite_index  = sprThroneStatue;
								sprite_broke  = sprThroneStatueDead;
									
								iconNum = 10;
								cost    = 0;
								costval = 50 * GameCont.level;
								subname = "DEATH"
								uses 	= 4;
								originaltimer = (room_speed * 7 + round(item_get_power("paragon") > 0 ? item_get_power("paragon") * 2 : 0));
								timer 	= 0;
								has_purchased = true
								break;
		// Shrine of Guns
		case   5: case "guns":  on_interact  = guns_interact;
		
								sprite_index = sprThroneStatue;
								sprite_broke = sprThroneStatueDead;
								mask_index = global.mskShrineGuns;
								
								conNum  = 9;
								cost    = 0;
								costval = 40 * GameCont.level;
								subname = "GUNS"
								upgrade[0] = -4;
								upgrade[1] = -4;
								upgrade[2] = -4;
								has_purchased = false;
								uses = 1 + round(item_get_power("paragon") > 0 ? item_get_power("paragon") + 1 : 0);
								break;
		// Shrine of Hatred
		case   6: case "hatred": on_interact  = hatred_interact;
		
								sprite_index = global.sprShrineHatred;
								sprite_broke = sprThroneStatueDead;
								
								iconNum = 14;
								cost    = 3;
								costval = 1;
								subname = "HATRED"
								break;
		// Shrine of Destiny
		case   8:	case "destiny": on_interact  = destiny_interact;
															sprite_index = sprThroneStatue;
															sprite_broke = sprThroneStatueDead;
															cost    = 3;
															costval = 1;
															iconNum = 5;

															subname = "DESTINY"
															uses = 1 + round(item_get_power("paragon") > 0 ? item_get_power("paragon") + 1 : 0);
															break;
		// Shrine of Luck
		case 10: case "luck":     on_interact  = luck_interact;
															sprite_index = sprThroneStatue;
															sprite_broke = sprThroneStatueDead;
															cost    = 3;
															costval = 1;
															iconNum = 15;
															subname = "LUCK"
															break;
		// Shrine of Curses
		case 11: case "curses":   on_interact  = curses_interact;
															sprite_index = sprThroneStatue;
															sprite_broke = sprThroneStatueDead;
															iconNum = 8;
															cost    = 3;
															costval = 1;

															subname = "CURSES";
															uses = 3;
															break;
		// Shrine of Risk
		case 12: case "risk":     on_interact  = risk_interact;
															sprite_index = sprThroneStatue;
															sprite_broke = sprThroneStatueDead;
															iconNum = 13;
															cost    = 2;
															costval = 2;

															subname = "RISK"
															break;
		// Shrine of Protection
		case 13: case "protection": on_interact  = protection_interact;
		
									sprite_index = sprThroneStatue;
									sprite_broke = sprThroneStatueDead;
									
									iconNum = 4;
									cost    = 0;
									costval = 30 * GameCont.level;

									subname 		= "PROTECTION"
									maxradius   = 79 + irandom(6);
									radius      = 0;
									shrinkspeed = .14;
									maxinv      = room_speed * 5  * current_time_scale;
									addframes   = 12;
									currad      = 0;
									break;
		// Printer
		case 14: case "printer": on_interact  = printer_interact;
		
								sprite_index  = global.sprPrinter;
								sprite_broke  = global.sprPrinter;
								sprite_shadow = shd48;
								shadow_y      = -5;
								
								iconNum =  6;
								cost    = -1;
								costval =  1;
								is_shrine = false;
								
								pool = CommonItems;
								if !irandom(  	   4) pool = UncommonItems;
								if !irandom( 	  34) pool = RareItems;
								if !irandom(99999999) pool = UniqueItems;
								item_index = pool[round(random_range(0, array_length_1d(pool) - 1))]
								subname = "PRINT"
								 break;
		// Portal ultra energizer
		case 15: case "energizer": on_interact  = energizer_interact;
		
								   sprite_index = sprThroneStatue;
								   sprite_broke = sprThroneStatueDead;
								   
								   iconNum = 7;
								   cost    = 0;
								   costval = 20 * GameCont.level;
								   is_shrine = false;

								   subname = "VAULT KEY"
								   break;
		// Challenger
		case 16: case "challenger": on_interact  = challenger_interact;
									sprite_index = sprThroneStatue;
									sprite_broke = sprThroneStatueDead;
									iconNum = 3;
									cost    = 4;
									costval = 0;

									subname = "BOSS CHALLENGE"
									break;
	}
	mask_index = mskBanditBoss;

 #define shrine_step
	if place_meeting(x, y, Player){near = true}else{near = false}
	canuse = false;

	if deathtimer > 0{
		deathtimer -= current_time_scale
		if deathtimer <= 0{
			instance_destroy();
			exit;
		}
	}

	if pause > 0 {pause--}
	if near = true && pause <= 0
	{
		// Determining if player needs something to give to use or not
		var _costvar = -4;

		switch cost
		{
			case -1: _costvar = -4;  							          break;
			case  0: _costvar = GameCont.rad;             				  break;
			case  1: _costvar = Player.my_health;   					  break;
			case  2: _costvar = -4;                 					  break;
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
				else{sound_play(sndCursedReminder)}
			}
		}
		if canuse = true
		{
			var _p = random_range(.8, 1.2)
			sound_play_pitchvol(sndPortalOpen, 1.4 * _p, 1.5)
			sound_play_pitchvol(sndWallBreak, 2 * _p, 1)
			sound_play_pitchvol(Player.snd_chst, 1, 1)
			pause = room_speed * 1
			sleep(10)
			script_execute(on_interact);
			if !instance_exists(self){exit}
			view_shake_max_at(x, y, 8);
			repeat(12) with instance_create(x, y, Dust) {motion_add(random(360), random_range(3, 6))}
			if cost = 2{get_item(item[? "injury"], 2)}

			// Small Accolade
			var _amount = item_get_power("accolade") > 0 ? item_get_power("accolade") * 2 : 0;
			if _amount > 0 && is_shrine = true
			{
				var _hp = roll(_amount);
				Player.my_health += _hp;
				sound_play(sndHealthChest);
				instance_create(x, y, HealFX);
				if Player.my_health >= Player.maxhealth
				{
					Player.my_health = Player.maxhealth
					with instance_create(x, y, PopupText)
					{
						target = Player;
						mytext = "MAX HP"
					}
				}
				else
				{
					with instance_create(x, y, PopupText)
					{
						target = Player;
						mytext = "+" + string(_hp) + " HP"
					}
				}
			}
			
			
			if uses <= 0 instance_destroy();
		}
	}

 #define shrine_destroy
	with instance_create(x, y, ChestOpen){sprite_index = other.sprite_broke}
	view_shake_at(x, y, 16);
	sleep(15);

 #define death_interact// 2: Shrine of Death
	has_purchased = true;
	uses--;
	timer = originaltimer + item_get_power("paragon") * 4 * room_speed;

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
					 _amount = 4 + roll(1 + item_get_power("paragon")),
					 	 _dist = 28,
						  _ang = random(360)
	do
	{
		if _timer <= 0
		{
			_i++
			_chest_index = choose("RadChest?", "AmmoChest", "WeaponChest?", "RadChest?", "AmmoChest", "WeaponChest?", "ItemChest");
			var _extradist = round(1 + item_get_power("paragon")) / 2;
			if crown_current = crwn_hatred && _i = _amount - 1 _chest_index = "HealthChest"
			with obj_create(x + lengthdir_x(_dist + _extradist, _ang) * 2, y + lengthdir_y(_dist + _extradist, _ang) * 2, _chest_index)
			{
				image_index = 1;
				repeat(12){with instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Dust){motion_add(random(360), random_range(5, 8))}}
				do
				{
					with instance_nearest(x, y, Wall) if distance_to_object(other) <= 16
					{
						instance_create(x, y, FloorExplo);
						instance_destroy();
					}
				}until(distance_to_object(instance_nearest(x, y, Wall)) > 16)
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
	uses--;
	instance_destroy()

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



#define curses_interact // 11: Shrine of Curses
	uses--;
	costval++;
	var _dir = point_direction(x, y, Player.x, Player.y)
	with obj_create(x + lengthdir_x(-24, _dir), y + lengthdir_y(-24, _dir), "dropitem")
	{
		item_index = CursedItems[round(random_range(0, array_length_1d(CursedItems) - 1))]
	}

#define risk_interact // 12: Shrine of Risk
	with instance_create(Player.x, Player.y, PopupText) {text = string(other.costval * -1) + " MAX HP"; target = Player}
	sound_play_pitch(sndFreakDead,0.8)
	sound_play_pitch(sndBloodLauncherExplo, 1)
	var _ang = point_direction(Player.x, Player.y, x, y),
			_i   = 0;
	repeat(roll(1 + item_get_power("paragon"))) with obj_create(Player.x + lengthdir_x(26, _ang), Player.y + lengthdir_y(26, _ang), "dropitem")
	{
		item_index = UncommonItems[round(random_range(0, array_length_1d(UncommonItems) - 1))]
	}
	uses--;

#define protection_interact // 13: Shrine of Protection
	currad = addframes;
	costval += 10;

#define printer_interact // 14: Printer
	var _tierarray = [];

	for (var _i = 0, _j = 0, _iLen = array_length_1d(PlayerItems); _i < _iLen; _i++)
	{
		if PlayerItems[_i].key != item_index.key && PlayerItems[_i].tier = item_index.tier
		{
			_tierarray[_j] = PlayerItems[_i]
			_j++
		}
	}

	if array_length_1d(_tierarray) > 0
	{
		var _item = _tierarray[round(random_range(0, array_length_1d(_tierarray) - 1))]
		with instance_create(x, y, PopupText){
			target = Player;
			mytext = "- " + _item.name
		}
		remove_item(_item, 1);
		with obj_create(x, y, "dropitem"){item_index = other.item_index}
	}
	else
	{
		sound_play(sndCursedReminder)
		with instance_create(x, y, PopupText)
		{
			target = Player;
			mytext = "NOT ENOUGH ITEMS";
		}
	}

#define energizer_interact // 15: Crown vault portal
	uses--;
	with instances_matching(CustomProp, "name", "Teleporter")
	{
		portal = "vault"
		instance_create(x, y, Guardian)
	}

#define challenger_interact // 16: Challenger
	uses--;
	Player.s_Challenge++;

//  3: Shrine of Life

//  4: Shrine of Haste

//  7: Shrine of Blood
// süawn strong, marked enemies with lowered rad gain, cost low rads, on all their death spawn item at altar, used once

//  9: Shrine of Love

// Uncursing Pool

#define draw
	with instances_matching(CustomObject, "name", "shrine")
	{
		if index = "printer" || index = 14
		{
			draw_set_alpha(.7)
			draw_sprite(global.sprItems, item_index.spr_index, x + sprite_get_width(global.sprItems)/2 - 8, y - 8)
			draw_set_alpha(1)
		}
		if near = true
		{
			var _splat = mskNone;
			switch cost
			{
				case 0: _splat = global.sprRadSplat   ; break;
				case 1: _splat = global.sprHealthSplat; break;
				case 2: _splat = global.sprMaxHPSplat ; break;
				case 3: _splat = global.sprCoinSplat  ; break;
			}
			if pause <= 0
			{
				draw_set_halign(fa_center)
				draw_text_nt(x, y - 30, subname);
				draw_sprite(sprEPickup, 0, x, y - 7)
				draw_sprite(_splat, 0, x - sprite_get_width(_splat)/2, y)
				draw_set_color(c_white)
				if cost != 4 && cost != -1 draw_text(x - sprite_get_width(_splat)/2 + 20, y + 6, string(costval))
			}
			else
			{
				d3d_set_fog(true, c_white, 0, 0)
				draw_set_alpha((pause / room_speed))
				draw_sprite(sprite_index, image_index, x, y)
				draw_set_alpha(1)
				d3d_set_fog(false, c_white, 0, 0)
			}
			if index = crwn_guns && near = true
			{
				weapon_upgrade(Player.wep)

				var _branches = 0,
									 _i = 0,
						 _xmargin = 25,
						 _ymargin = 45,
						  _bbox_x = 12,
							_bbox_y = 15,
							 _abs_l = 0,
					 _sprmargin = 0,
					     _texty = 0,
							    _px = (Player.bbox_left + Player.bbox_right) / 2,
									_sx = bbox_right - bbox_left;

				if upgrade[0] > -4 {_branches++; _abs_l += sprite_get_width(weapon_get_sprite(upgrade[0])); if sprite_get_width(weapon_get_sprite(upgrade[0])) > _sprmargin _sprmargin = sprite_get_width(weapon_get_sprite(upgrade[0])); if sprite_get_height(weapon_get_sprite(upgrade[0])) > _texty _texty = sprite_get_height(weapon_get_sprite(upgrade[0]))}
				if upgrade[1] > -4 {_branches++; _abs_l += sprite_get_width(weapon_get_sprite(upgrade[1])); if sprite_get_width(weapon_get_sprite(upgrade[1])) > _sprmargin _sprmargin = sprite_get_width(weapon_get_sprite(upgrade[1])); if sprite_get_height(weapon_get_sprite(upgrade[1])) > _texty _texty = sprite_get_height(weapon_get_sprite(upgrade[1]))}
				if upgrade[2] > -4 {_branches++; _abs_l += sprite_get_width(weapon_get_sprite(upgrade[2])); if sprite_get_width(weapon_get_sprite(upgrade[2])) > _sprmargin _sprmargin = sprite_get_width(weapon_get_sprite(upgrade[2])); if sprite_get_height(weapon_get_sprite(upgrade[2])) > _texty _texty = sprite_get_height(weapon_get_sprite(upgrade[2]))}
				_texty++;

				if _branches > 0 repeat(_branches)
				{
					var _xpos = x + (sprite_get_xoffset(weapon_get_sprite(upgrade[_i])) - sprite_get_width(weapon_get_sprite(upgrade[_i])) / 2) + _sprmargin * _i - _sprmargin * (_branches - 1) / 2
					_bbox_x = _sprmargin / 2;
					_bbox_y = sprite_get_height(weapon_get_sprite(upgrade[_i]));
					var _rect = point_in_rectangle(_px, Player.y, (x - _sx / 2) + (_sx / _branches * (_i)) - 2, bbox_top - 8, (x - _sx / 2) + (_sx / _branches * (_i + 1)) + 2, bbox_bottom + 8)
					draw_weapon(weapon_get_sprite(upgrade[_i]), _xpos, y - _ymargin - _rect, _rect = true ? (weapon_get_gold(upgrade[_i]) ? c_gold : c_white) : (weapon_get_gold(upgrade[_i]) ? merge_color(c_gold, c_dkgray, .5) : c_ltgray))
					if _rect
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
					_ymargin -= 10;
					draw_weapon(weapon_get_sprite(Player.wep), x - sprite_get_width(weapon_get_sprite(Player.wep)) / 2 + sprite_get_xoffset(weapon_get_sprite(Player.wep)), y - sprite_get_height(weapon_get_sprite(Player.wep)) + sprite_get_yoffset(weapon_get_sprite(Player.wep)) - _ymargin, c_red);
					draw_sprite(global.sprNo, 0, x, y - sprite_get_height(weapon_get_sprite(Player.wep)) + sprite_get_yoffset(weapon_get_sprite(Player.wep)) - _ymargin + 1);
					draw_text_nt(x, y - sprite_get_height(weapon_get_sprite(Player.wep)) + sprite_get_yoffset(weapon_get_sprite(Player.wep)) - _ymargin - 16, "CANNOT UPGRADE")
				}
			}
		} else {
		if index != "printer" && index != 14{
			d3d_set_fog(true, c_black, 0, 0);
			draw_sprite(global.shrineIcons, iconNum, x+7, y-20)
			draw_sprite(global.shrineIcons, iconNum, x+6, y-19)
			d3d_set_fog(false, c_white, 0, 0);
			draw_sprite(global.shrineIcons, iconNum, x+6, y-20)
			}
		}
		if index = crwn_protection
		{
			if currad > 0
			{
				currad--;
				radius += (maxradius - radius) * (addframes - currad) / addframes
			}
			if radius > 0
			{
				with Player
				{
					if distance_to_object(other) < max(1, (other.radius - (sprite_get_width(sprite_index) + sprite_get_height(sprite_index))/2) + 6)
					{
						other.radius -= other.shrinkspeed * (item_get_power("paragon") > 0 ? 1 / (1 + item_get_power("paragon") * .1) : 1);
						var _inv = mod_variable_get("mod", "items", "InvisibleTimer");
						if _inv < (other.maxinv + item_get_power("paragon") * room_speed * current_time_scale * 2) mod_variable_set("mod", "items", "InvisibleTimer", mod_variable_get("mod", "items", "InvisibleTimer") + room_speed / 8 * current_time_scale)
					}
				}
				if radius <= 16 radius = 16
			}
			else{radius = 0}
		}
		if index = crwn_death
		{
			if timer > 0
			{
				timer -= current_time_scale;
				if current_frame mod (max(1, round(timer / 10)) / current_time_scale) = 0
				repeat(choose(2, 2, 3)){
					var _list = ds_list_create();
					with hitme{ds_list_add(_list, id)}
					ds_list_shuffle(_list);

					with obj_create(x, y, "deathnade")
					{
						motion_add(point_direction(x, y, _list[| 1].x + random_range(-16, 16), _list[| 1].y + random_range(-16, 16)), sqrt(point_distance(_list[| 1].x ,_list[| 1].y ,x,y)))
						zspeed = 24 + irandom(12)
					}
					ds_list_clear(_list);
				}
			}
			else if uses = 1 instance_destroy()
		}
	}

#define draw_shadows
	with instances_matching(CustomObject, "name", "shrine")
	{
		if uses > 0
		{
			draw_sprite(sprite_shadow, 1, x, y + shadow_y)
		}
	}
	with instances_matching(CustomProjectile, "name", "dropitem")
	{
		draw_sprite_ext(shd16, 1, x, y - 2, clamp((maxzspeed / z) + .2, .2, 1), clamp((maxzspeed / z) + .2, .2, 1), 0, c_white, 1)
	}
	with instances_matching(CustomProjectile, "name", "death grenade")
	{
		var _shd = size > 1 ? shd16 : shd24
		draw_sprite_ext(_shd, 1, x, y - 2, clamp((zbase / z) + .2, .2, 1), clamp((zbase / z) + .2, .2, 1), 0, c_white, 1)
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
		case wep_golden_machinegun : upgrade[0] = wep_golden_assault_rifle;
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
														 	    upgrade[1] = -4;
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
		case wep_lightning_pistol 	 : upgrade[0] = wep_lightning_smg;
															  	 upgrade[1] = wep_lightning_rifle;
															  	 upgrade[2] = wep_lightning_shotgun;
															  	 break;
	  case wep_lightning_rifle 	   : upgrade[0] = wep_lightning_cannon;
																	 upgrade[1] = -4;
																	 upgrade[2] = -4;
																	 break;
	  case wep_lightning_shotgun 	 : upgrade[0] = wep_lightning_cannon;
																	 upgrade[1] = -4;
																	 upgrade[2] = -4;
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
#define remove_item(ITEM, AMOUNT)     return mod_script_call("mod", "items","remove_item", ITEM, AMOUNT)
#define obj_create(X, Y, OBJECT_NAME) return mod_script_call("mod", "items", "obj_create", X, Y, OBJECT_NAME);
#define chest_setup() 								return mod_script_call("mod", "items", "chest_setup");
#define item_get_power(ITEM)          return mod_script_call("mod", "items", "item_get_power",ITEM);
