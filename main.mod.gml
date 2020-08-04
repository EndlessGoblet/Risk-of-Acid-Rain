#macro item mod_variable_get("mod", "itemlib", "ItemDirectory");

#define init
	// --- META DATA ---
	global.version = "1.7";
	global.released = false;

	global.sprInteractSplat  = sprite_add("sprites/other/sprInteractSplat.png", 1, 0, 0);
	global.sprItemChestParty = sprite_add_weapon("sprites/chests/sprItemChestParty.png", 8, 8);

	#macro savefile "RoAR_Settings.txt" //Remembering settings
	if instance_exists(CharSelect) sound_play_pitch(sndLevelUltra, 0.9)
	//DEBUG
	global.debug = false;
	//Create important initial variables
	global.AnomalyGet  = 0;
	global.HardmodeGet = 0;
	global.FlaskGet    = 0;
	global.FragmentGet = 0;

	global.spawnCredits = 0;
	global.wavetimer = 7 * 30;

	global.difficulty = 0;
	global.fancy = true;
	global.time = 0;
	global.frame = 0;
	global.seconds = 0;
	global.minutes = 0;
	global.hours = 0;
	global.coins = 3;
	global.teleporter = false;
	global.reset = 3;
	global.BossesLeft = 0;
	global.perfected = false;

	global.NitrogenCountdown = 0;

	global.CircleSurf = -1;

	//spawn arrays  average of 7 seconds of charging = 210 credits to spend
	global.spwDesert     = [Bandit, Bandit, Bandit, Scorpion, Scorpion, BigMaggot, Maggot, Maggot]
	global.cosDesert     = [    40,     40,     40,       70,       70,       100,     20,     20]
	global.spwSewers     = [Rat, Rat, Rat, Ratking, Gator, Gator, BuffGator, Bandit, Bandit]
	global.cosSewers     = [ 70,  70,  70,     180,    90,    90,       150,     30,     30]
	global.spwScrapyard  = [Bandit, Bandit, Raven, Raven, MeleeBandit, Sniper, Salamander]
	global.cosScrapyard  = [		40,     40,    70,    70,          80,     60,        120]
	global.spwCaves      = [LaserCrystal, LaserCrystal, LaserCrystal, LightningCrystal, Spider, Spider, Spider, Gator]
	global.cosCaves      = [				 125, 				 125,          125, 						 200,     85,     85,     85,    90]
	global.spwIce        = [Bandit, SnowTank, SnowBot, SnowBot, Wolf]
	global.cosIce        = [ 		45, 		 160, 		 70, 			70,   90]
	global.spwLabs       = [Freak, Freak, Turret, ExploFreak, Necromancer, RhinoFreak]
	global.cosLabs       = [	 35, 		35, 	 100, 				80, 				150, 				180]
	global.spwPalace     = [DogGuardian, Guardian, Guardian, Guardian, Guardian, ExploGuardian, ExploGuardian]
	global.cosPalace     = [				240, 			100, 			100, 			100, 			100, 					 120, 					120]
	global.spwPizza      = [Turtle, Rat]
	global.cosPizza      = [		70,  70]
	global.spwOasis      = [BoneFish, BoneFish, BoneFish, BoneFish, BoneFish, Bandit, Bandit, Bandit, Bandit, Bandit, Crab]
	global.cosOasis      = [			65, 			65, 			65, 			65, 			65, 		40, 		40, 		40, 		40, 		40,  150]
	global.spwMansion    = [FireBaller, SuperFireBaller, Jock, Molefish, Molesarge]
	global.cosMansion    = [				90, 						160, 	115, 			 60, 				70]
	global.spwCursed     = [InvLaserCrystal, InvSpider]
	global.cosCursed     = [						125,        85]
	global.spwEverything = [Bandit, Scorpion, BigMaggot, Maggot, Rat, Ratking, Gator, BuffGator, Raven, MeleeBandit, Sniper, Salamander, LaserCrystal, LightningCrystal, Spider, Bandit, SnowTank, SnowBot, Wolf, Turret, Freak, ExploFreak, Necromancer, RhinoFreak, ExploGuardian, Guardian, DogGuardian, Turtle, BoneFish, Crab, FireBaller, SuperFireBaller, Jock, Molefish, Molesarge, InvLaserCrystal, InvSpider]
	global.cosEverything = [		37, 		  79, 			103, 		 17,  63, 		171, 		95, 			143, 		63, 				 77, 		 53, 				111, 					119, 							187, 		 81, 		 37, 			151, 			63,   85, 		67, 	 31, 				 81, 				 147, 			 171, 					127, 			 93, 				 235, 		63, 			61,  149, 				81, 			  	  157,  109, 			 53, 				65, 						121, 				83]
	global.spwJungle     = [JungleAssassinHide, JungleBandit, JungleFly]
	global.cosJungle     = [								80, 					60, 			120]
	global.spwNight      = [Bandit, Bandit]
	global.cosNight      = [		55, 		55]

	global.charge = 0;
	global.chargeF = 0;
	global.areaChoice = 0
	global.subareaChoice = 0
	global.BarLength = 0;
	global.DarkCircle = false;
	global.respawn = 0;
	global.MenuIndex	 = -1; // -1 = no menu, 0 = modes, 1 = info, 2 = options
	global.Gamemode  	 = 0;  // 0 = normal mode, 1 = hardmode
	global.MenuXoffset = 3;

	global.preformanceMode = false; // Turn on to avoid lag (recommended)
	global.hpBars 				 = true;
	global.bossBars 			 = true;
	global.doubleChests    = false;
	global.doubleShrines   = false;
	global.forceSupport    = false;
	global.sixtyFPS = false;

	global.crownVault = false;
	if (instance_exists(Player)) Player.debug = false;

	global.shrineIcons = sprite_add("sprites/shrines/shrineIcons.png", 16, 13, 13)

	//Main Menu (Splash screen?)
	global.menu = false;
	global.sprSplash  = sprite_add("sprites/other/splash.png", 1, 320, 240);

	global.sprTeleporterIdle   = sprite_add("sprites/teleporter/sprTeleporterIdle.png"  , 1, 24, 20);
	global.sprTeleporterSiphon = sprite_add("sprites/teleporter/sprTeleporterSiphon.png", 2, 24, 20);
	global.mskTeleporter       = sprite_add("sprites/teleporter/mskTeleporter.png"      , 1, 24, 20);

	global.sprButtons  		  = sprite_add("sprites/other/sprButtons.png", 3, 12, 12);
	global.sprButtonsSplat  = sprite_add("sprites/other/sprButtonsSplat.png", 1, 14, 14);
	global.sprModes 		    = sprite_add("sprites/other/sprModes.png", 3, 41, 41);
	global.sprCoinSplatMain = sprite_add("sprites/other/sprCoinSplatMain.png", 1, 0, 0);

	if (instance_exists(CharSelect)) global.menu = true;

	load_save()
	save_save()
	//set new level function
	global.newLevel = instance_exists(GenCont);
	global.hasGenCont = false;
	while(true)
	{
		if(instance_exists(GenCont)) global.newLevel = 1;
		else if(global.newLevel)
		{
			global.spawnCredits = 0
			if global.seconds > 0 || global.minutes > 0 || global.hours > 0{
				var _hasdone = false;
				if _hasdone = false && global.time < global.timeControl / 3																						 {_hasdone = true; global.time = global.timeControl / 3 - 1}
				if _hasdone = false && global.time > global.timeControl * 2 / 3																				 {_hasdone = true; global.time = 0; global.difficulty++}
				if _hasdone = false && global.time > global.timeControl / 3 && global.time < global.timeControl * 2 / 3{_hasdone = true; global.time = global.timeControl * 2 / 3 - 1}
			}
			global.newLevel = 0;
			level_start();
					if item_get_count("spent flower") > 0 {get_item(item[? "flower"], item_get_count("spent flower")); remove_item(item[? "spent flower"], item_get_count("spent flower"))}
		}
		var hadGenCont = global.hasGenCont;
		global.hasGenCont = instance_exists(GenCont);
		wait 1;
	}

#macro c_fel $FF271C;
#macro c_inv merge_colour(merge_colour(c_aqua, c_blue, .35), c_white, .3);

#define level_start
	global.BossesLeft = 0; // 0 at level start, after teleport activation = amount of boss enemies, at 0 again spawns an item

	if (global.Gamemode == 2) {
		global.perfected = true
	//Arena mode setup
	wait(1);
	var template = "regular"
	_roll = round(random_range(1, 7))
	if (_roll = 1) template = "crowded"
	if (_roll = 2) template = "scarce"
	if (_roll = 3) template = "filler"

	//Deleting everything
	with(Floor) instance_delete(self)
	with(Wall) instance_delete(self)
	with(Top) instance_delete(self)
	with(TopSmall) instance_delete(self)
	with(TopPot) instance_delete(self)
	with(TopDecalDesert) instance_delete(self)
	with(TopDecalCave) instance_delete(self)
	with(TopDecalCity) instance_delete(self)
	with(TopDecalInvCave) instance_delete(self)
	with(TopDecalJungle) instance_delete(self)
	with(TopDecalNightDesert) instance_delete(self)
	with(TopDecalPizzaSewers) instance_delete(self)
	with(TopDecalScrapyard) instance_delete(self)
	with(TopDecalSewers) instance_delete(self)
	with(Bones) instance_delete(self)
	with(Detail) instance_delete(self)
	with(enemy) instance_delete(self);
	with(prop) instance_delete(self);
	with(chestprop) instance_delete(self);
	//Creating the arenaaa

	for(o = 1; o < 14; o++)
	{ // Creating Floor
		for(i = 1; i <  7; i++)
		{
			with instance_create(Player.x - i * 32, 10032 - o * 16, Floor)
			{
				if !irandom( 9) styleb = true;
				if !irandom(14) instance_create(x - random_range(-12, 12), y - random_range(-12, 12), Detail)
			}
		} //Floor (X)
		for(i = 1; i > -5; i--)
		{
			with instance_create(Player.x - i * 32, 10032 - o * 16, Floor)
			{
				if !irandom( 9) styleb = true;
				if !irandom(14) instance_create(x - random_range(-12, 12), y - random_range(-12, 12), Detail)
			}
		} //Floor (Y)
	}
	for(i = 1; i < 15; i++)
	{
		instance_create (9808, 10048 - i * 16, Wall) //Left Wall
	  instance_create(10176, 10048 - i * 16, Wall)//Right Wall
	}
	for(i = 1; i < 24; i++)
	{
		instance_create(9808 + i*16, 10048, Wall) //Bottom Wall
	  instance_create(9808 + i*16,  9824, Wall) //Top Wall
	 }
	for(i = 1; i < 30; i++)
	{
		instance_create( 9808 - 16, 10048 - i * 8, Top) //Top of Left Wall
		instance_create(10176 + 16, 10048 - i * 8, Top) //Top of Right Wall
	}
	for(i = 1; i < 48; i++)
	{
		instance_create(9808 + i*8, 10048, Top) //Top of Bottom Wall
		instance_create(9808 + i*8,  9824, Top) //Top of Bottom Wall
	}

	// Area specific things
	var _c = irandom(4) + 2
	switch GameCont.area
	{
		case 1: repeat(_c) instance_create(Wall.x, Wall.y, TopDecalDesert); break;
		case 2: repeat(_c) instance_create(Wall.x, Wall.y, TopDecalSewers); break;
		case 3: repeat(_c) instance_create(Wall.x, Wall.y, TopDecalScrapyard); break;
		case 4: repeat(_c) instance_create(Wall.x, Wall.y, TopDecalCave); break;
		case 5: repeat(_c) instance_create(Wall.x, Wall.y, TopDecalCity); break;
		case 7: repeat(_c) instance_create(Wall.x, Wall.y, TopDecalPalace); break;
	}

	//Creating extra walls
	var _x
	var _y
	var DWall = 3;
	var m = 1
	if template == "crowded" m = 1.5
	if template == "scarce" m = 0.4
	if template == "filler" m = 0.2
	if (GameCont.area == 1) DWall = 24
	if (GameCont.area == 101) DWall = 12
	if (GameCont.area == 2) DWall = 8
	if (GameCont.area == 3) DWall = 4
	DWall = round(DWall*m)
	if (GameCont.area == 2) && DWall < 2 DWall = 2 //Scrapyard always has at least 2 traps
	for(i = 1; i < DWall; i++) {
	var variety_y = round(random_range(1,13))
	var variety_x = round(random_range(1,23))
	_x = round(random_range(9808 + 16*variety_x,9808 + 16*variety_x))
	_y = round(random_range(9824 + 16*variety_y, 9824 + 16*variety_y)) //Draw random walls
	instance_create(_x, _y, Wall)
	if (GameCont.area = 3) instance_create(_x, _y, Trap)
	}
	//creating props
	var DProp = 3;
	var _prop = Cactus
	if template == "filler" m = 3


	for(i = 1; i < DProp; i++) {
		if (GameCont.area == 1) {
			_roll = round(random_range(1, 16))
			DProp = 24;
	_prop = Cactus
	if _roll = 1 _prop = BonePile//Barrel
	if _roll = 2 _prop = Barrel
	if _roll = 3 _prop = WeaponChest
	if _roll = 4 _prop = AmmoChest
	}
		if (GameCont.area == 2) {
			DProp = 8;
			_roll = round(random_range(1, 8))
	_prop = Pipe
	if _roll = 1 _prop = ToxicBarrel
	if _roll = 2 || _roll = 3 _prop = RadChest
	if _roll = 4 _prop = WeaponChest
	}
		if (GameCont.area == 3) {
			DProp = 8;
			_roll = round(random_range(1, 8))
	_prop = Tires
	if _roll = 1 _prop = Car
	if _roll = 2 = _prop = RadChest
	if _roll = 3 = _prop = AmmoChest
	if _roll = 4 _prop = WeaponChest
	}
		if (GameCont.area == 4) {
			DProp = 24;
	_prop = Cactus
	}
		if (GameCont.area == 5) {
			DProp = 24;
	_prop = Cactus
	}
		if (GameCont.area == 6) {
			DProp = 24;
	_prop = Cactus
	}
		if (GameCont.area == 7) {
			DProp = 24;
	_prop = Cactus
	}

	DProp = round(DProp*m)
	var variety_y = round(random_range(1,13))
	var variety_x = round(random_range(1,24))
	_x = round(random_range(9808 + 16*variety_x,9808 + 16*variety_x))
	_y = round(random_range(9824 + 16*variety_y, 9824 + 16*variety_y)) //Draw random walls
	instance_create(_x, _y, _prop)
	}

	with (prop) { //Delete props too close to each other or walls
	if distance_to_object(Wall) <= 16 {
		instance_delete(self);
	}}

	with (prop) {
	if distance_to_object(prop) <= 5 || distance_to_object(chestprop) <= 5{
		instance_delete(self);
	}}

	with (chestprop) {
	if distance_to_object(Wall) <= 5 {
		instance_delete(self);
	}}

	with (chestprop) {
	if distance_to_object(prop) <= 5 || distance_to_object(chestprop) <= 5{
		instance_delete(self);
	}}

	//removing dangerous props near player
	with (Barrel) || (ToxicBarrel) {
	if distance_to_object(Player) <= 35 {
		instance_delete(self);
	}}

	//Spawning Boss
	with (Player) var w = instance_furthest(x, y, Wall)
	var _boss_amount = 1;
	switch GameCont.area
					{
						case   1: _boss  = BanditBoss;
									  	sound_play_music( musBoss1);
									  	break;
						case   2: _boss  = FrogQueen;
									  	sound_play_music( musBoss5);
									  	break;
						case   3: _boss  = ScrapBoss;
									  	sound_play_music( musBoss2);
									  	break;
						case   4: _boss  = HyperCrystal;
											sound_play_music( musBoss6);
											break;
						case 	 5: _boss  = LilHunter;
											sound_play_music( musBoss3);
											break;
						case 	 6: _boss  = TechnoMancer;
											sound_play_music( musBoss7);
											break;
						case	 7: _boss  = Guardian;
											sound_play_music(musBoss4B);
											break;
						case   0: _boss  = Nothing2;
						 			  	sound_play_music( musBoss8);
									  	break;
						case 101: _boss  = OasisBoss;
											sound_play_music(musBoss3);
											break;
						case 102: _boss  = Turtle;
						 					sound_play_music(musBoss3);
											_boss_amount += 3;
											break;
						case 103: _boss  = SuperFireBaller;
											sound_play_music(mus104);
						    			_boss_amount += 4;
											break;
					}
					repeat(_boss_amount) with instance_create(w.x + 64, w.y + 64, _boss) {
						tag = "boss"
					}
	global.BossesLeft++
	if (GameCont.area == 1) GameCont.subarea = 1;
	}

	if (Player.fancy == 1) global.fancy = 1
	if (Player.fancy == 0) global.fancy = 0

	with instance_create(0, 0, CustomObject)
	{
		name = "RoRSurfaceHandler"
		depth = -1.9
		on_draw = circlesurface_draw
	}

	global.crownVault = false;
	//Reset vars
	global.subareaChoice = 0;
	global.areaChoice    = 0;

	global.respawn = irandom_range(6, 12) * (crown_current = 7 ? 2 : 1) // double enemies with cob
	//Spawn invincible anti-portal maggot
	if (GameCont.area != 100) with instance_create(Player.x-500, Player.y-500, Maggot) {
	    visible = false;
	    image_xscale = 0;
	    image_yscale = 0;
	    mask_index = mskNone;
	    meleedamage = 0;
	    canfly = true;
	    my_health = 999999999;
	    tag = "god"
	}

	if (global.Gamemode != 2)
	{
		with (WeaponChest)
		{
		  if (GameCont.area = 1 || GameCont.area == 101)
			{
		    wait(2)
		    if instance_exists(WeaponChest)
				{
			  	instance_create(x, y, BigWeaponChest)
			    instance_delete(self);
		    }
		  }
		}

		//SPAWN OBJECTS ON LEVEL START
		with Player
		{
			// Teleporter
			if GameCont.area != 100 && global.Gamemode != 2 with instance_create(instance_furthest(x, y, Floor).x - sprite_xoffset + sprite_width / 2, instance_furthest(x, y, Floor).y - sprite_yoffset + sprite_height / 2, CustomProp)
			{
				name      = "Teleporter"
				teledone  = false
				radifac   = random_range(.9, 1.1)
				portal    = "regular"
				addframes = room_speed * 2;
				currad    = 0;
				radius    = 0;
				maxradius = 100 * (1 + (item_get_count("focus") > 0 ? .15 : 0) + (item_get_count("siphon") > 0 ? .15 : 0));

				spr_idle   = global.sprTeleporterIdle
				spr_hurt   = global.sprTeleporterIdle
				spr_dead   = global.sprTeleporterIdle
				spr_shadow = mskNone
				mask_index   = global.mskTeleporter
				image_speed  = .5
				maxhealth    = 999999999999999999999999 // yeah
				my_health    = maxhealth

				var _i = 0,
				    _r = 72;
				do
				{
					with instance_nearest(x, y, Wall) if distance_to_object(other) <= _r
					{
						instance_create(x, y, FloorExplo);
						instance_destroy();
					}else{_i = _r}
					_i++;
				}until(_i >= _r)
				with Debris instance_delete(self);

				on_step  = teleporter_step
				on_draw  = teleporter_draw
			}
		}

		global.charge = 0;
		global.chargeF = 0;
		global.teleporter = false;
	}

#define enemySpawn
	if instance_exists(Player)
	{
		var _place = -4,
				_cost  = -4;
		switch GameCont.area
		{
			case   1: _place = global.spwDesert;
								_cost  = global.cosDesert;    break;
			case   2: _place = global.spwSewers;
								_cost  = global.cosSewers;    break;
			case   3: _place = global.spwScrapyard;
								_cost  = global.cosScrapyard; break;
			case   4: _place = global.spwCaves;
								_cost  = global.cosCaves;     break;
			case   5: _place = global.spwIce;
								_cost  = global.cosIce;    		break;
			case   6: _place = global.spwLabs;
								_cost  = global.cosLabs;      break;
			case   7: _place = global.spwPalace;
								_cost  = global.cosPalace;    break;
			case   0: _place = global.spwNight;
								_cost  = global.cosNight;    	break;
			case 100: _place = global.spwPalace;
								_cost  = global.cosPalace;    break;
			case 101: _place = global.spwOasis;
								_cost  = global.cosOasis;     break;
			case 102: _place = global.spwPizza;
								_cost  = global.cosPizza;     break;
			case 103: _place = global.spwMansion;
								_cost  = global.cosMansion;   break;
			case 104: if global.teleporter = true
								{
									_place = global.spwEverything;
									_cost  = global.cosEverything;
									break;
								}
								else
								{
									_place = global.spwCursed;
									_cost  = global.cosCursed;
									break;
								}
			case 105: _place = global.spwJungle;
								_cost  = global.cosJungle; break;
			default:  _place = global.spwNight;
			 					_cost  = global.cosNight; break;
		}



		// Chests
		var  _floorq = ds_list_create(), // put all available floor tiles into a list
			   _i = 0;

		with Floor // get a list of all "unoccupied" Floors
		{
			var _d = 0;
			if instance_exists(Player) && distance_to_object(Player) > 92 && !place_meeting(x, y, hitme) && !instance_is(self, FloorExplo) &&  distance_to_object(instance_nearest(x, y, Wall)) > 32
			{
				_floorq[| _i] = self; // add eligible floor tiles to the list
				_i++;
			}
		}
		ds_list_shuffle(_floorq)

		if instance_number(enemy) < (10 + global.difficulty * 2){
			var         _n = round(random_range(0, array_length(_place) - 1)),
		     enemyChoice = _place[_n],
				 enemyCost   = _cost[_n];

			global.spawnCredits += current_time_scale * (.8 + global.difficulty / 100 - global.teleporter * .35);

			global.wavetimer -= current_time_scale
			if global.wavetimer <= 0{
				global.wavetimer = 30 * irandom_range(6, 10)

				do{
					if !is_undefined(_floorq[| 0]) with instance_create(_floorq[| 0].x, _floorq[| 0].y, enemyChoice)
					{
						sound_play_pitch(sndIDPDPortalSpawn, 1.8)
						global.spawnCredits -= enemyCost;
						if place_meeting(x, y, Wall) || place_meeting(x, y, FloorExplo) || !place_meeting(x, y, Floor) || distance_to_object(Player) <= 32
						{

							instance_delete(self)
							exit
						}
					}
				}until enemyCost > global.spawnCredits
			}
		}
	}

#define step
	// force some area changes
	switch GameCont.area{
		case 1: background_color =  6983599; break;
		case 2: background_color =  4610380; break;
		case 3: background_color = 10393226; break;
		case 4: background_color = 12341889; break;
		case 5: background_color = 12959156; break;
		case 6: background_color =  2104329; break;
		case 7: background_color =  2366817; break;
		case 101: background_color = 13160785; break;
		case 102: background_color =  6507424; break;
		case 103: background_color = 15921390; break;
		case 104: background_color =  2333951; break;
		//case 105: background_color =   623338; break;
	}

	if GameCont.subarea = 2{
		if GameCont.area = 3{
			GameCont.area = 4;
		}
		if GameCont.area = 5{
			GameCont.area = 6	;
		}
		if GameCont.area = 7{
			GameCont.area = 1	;
		}
		GameCont.subarea = 1;
	}

 	if button_pressed(0, "horn") = true global.difficulty++

	with instances_matching_le(instances_matching(enemy, "tag", "boss"),"my_health",0) global.BossesLeft--

	 // special horror drop
	 with instances_matching_le(EnemyHorror, "my_health", 0)
	 {
		 with obj_create(x, y, "dropitem")
		 {
			 item_index = item[? "core"]
		 }
	 }

	 //Boss Rush stuff
 	 if global.Gamemode == 2 && instance_exists(Player)
	 {
	 	 //Guardian Boss
	 	 with (Guardian)
		 {
		   if ("tag" in self) && (tag == "boss")
			 {
				 if ('GuardianBuff' not in self)
				 {
					 GuardianBuff = true;
					 team = 2;
					 maxhealth = 800;
					 image_blend = merge_color(c_blue, c_white, 0.5)
				 }
				 for(i = 0; i < 5; i++){alarm_set(i, alarm_get(i) + 1)}
				 with instances_matching_le(enemy,"my_health",0)
				 {
				 	 with instances_matching(Guardian, "tag", "boss") my_health -= 50;
				 }
				 _roll = irandom_range(1,5)
				 if (_roll = 1)with instance_create(x + random_range(-25, 25), y+random_range(-25,25), Smoke){image_blend = merge_color(c_blue, c_white, 0.5)}
			 }
	   }

		 //BOSSES GAINS WALL DESTRUCTION MEGA POWERS
		 with instances_matching(enemy, "tag", "boss")
		 {
			 if place_meeting(x, y, Wall) with instance_nearest(x, y, Wall) {instance_create(x, y, FloorExplo); instance_destroy()}
		 }

		 with (Player) if my_health < lsthealth && global.perfected = true{global.perfected = false}
		 with instances_matching_le(enemy,"my_health",0)
		 {
			 var _chance = global.doubleChests == true ? irandom_range(1, 9) : irandom_range(1, 18)
			 if _chance = 1 && global.BossesLeft >= 1
			 {
				 with obj_create(x, y, "ItemChest")
				 {
					 tag = "item"
					 item_index = mod_variable_get("mod", "items", "CommonItems")[random_range(0, array_length(mod_variable_get("mod", "items", "CommonItems")) - 1)]
					 chest_setup(tag)
				 }
			 }
			 if (_chance == 2) && global.BossesLeft >= 1 {instance_create(x, y, WeaponChest)}
		 }

		 with (Floor)
		 {
			 chance = irandom_range(1, room_speed * 200)
			 if (chance = 1) instance_create(x + 16, y + 16, AmmoPickup)
		 }
		 if instance_exists(Player)
		 {
			 if (Player.portalTimer > 0) Player.portalTimer--
			 if (Player.portalTimer = 0) && global.BossesLeft == 0
			 {
				 var f_ = instance_find(Floor, irandom(instance_number(Floor) - 1));
				 GameCont.subarea = 3;
				 instance_create(f_.x, f_.y, Portal)
			 }
			 if instance_exists(Portal) || instance_exists(SpiralCont)Player.portalTimer = (room_speed * 10)
		 }
	 }

	if mod_variable_get("mod", "items", "forceSave") == 1{
		mod_variable_set("mod", "items", "forceSave", 0)
		save_save()
	}

	with instances_matching(Maggot, "tag", "god"){
		x = -10000;
		y = -10000;
	}

	if global.sixtyFPS == true
	{
		room_speed = 60
		current_time_scale = 0.5
	}
	else
	{
		room_speed = 30
		current_time_scale = 1
	}

	var BossRushModifier = 0;
	if global.Gamemode = 2
	{
		BossRushModifier = 10
		if (GameCont.area == 7) && (GameCont.subarea = 1) BossRushModifier = 0.5
	}
	//if irandom(instance_number(enemy) + (BossRushModifier * 20) + room_speed * (1 - (crown_current = 7 ? .25 : 0))) = 0 && !instance_exists(Portal) && GameCont.area != 100 && !instance_exists(SpiralCont) enemySpawn()
	if !instance_exists(Portal) && GameCont.area != 100 && !instance_exists(SpiralCont) enemySpawn()

	//Crown Vault Fix
	if instance_exists(CrownPed) global.crownVault = true;
	if instance_exists(Portal) && global.crownVault == true
	{
	  GameCont.area = (GameCont.lastarea);
	  GameCont.subarea = 3;
	}

	//bosses item spawn code
	 if instance_exists(Player) with instances_matching(hitme, "tag", "boss")
	{
		if my_health <= 0
		{
			if global.Gamemode == 2 && global.perfected == true
			{
				with instance_create(Player.x, Player.y, PopupText)
				{
					time = 20;
					text = "@yPERFECT!"
				}
				repeat(50) with instance_create(Player.x, Player.y, Confetti)
				{
					direction = random_range(0, 360)
					speed = random_range(1, 10)
				}
				sound_play_pitch(choose(sndConfetti1, sndConfetti2, sndConfetti3, sndConfetti4, sndConfetti5), 1)
				with obj_create(x, y, "ItemChest")
				{
					tag = "none"
					sprite_index = global.sprItemChestParty
				}
			}
			repeat(Player.s_Challenge) with obj_create(x, y, "dropitem")
			{
				if (global.Gamemode != 2)
				{
					item_index = mod_variable_get("mod", "items", "UncommonItems")[random_range(0, array_length(mod_variable_get("mod", "items", "UncommonItems")) - 1)]
				}
				else
				{
					item_index = mod_variable_get("mod", "items", "UncommonItems")[random_range(0, array_length(mod_variable_get("mod", "items", "UncommonItems")) - 1)]
					Player.portalTimer = (room_speed * 16)
				}
			}
		}
	}

	var minutes_ = 3 //How many minutes for difficulty to go up
	if (global.Gamemode == 1) var minutes_ = 5
	//global.timeControl = 60 * 60 * (21600) //Time Control
	global.timeControl = (minutes_ * 2) * (60 * 60)

	//Hard Mode
	if (item_get_count("times") > 0) {
	with (enemy) {
	for(i = 0; i < 5; i++){
				var _speed_hardmode = global.Gamemode = 1 ? 1 : 0,
				    _speed_times    = .2 * item_get_count("times"),
						_speed_boss     = "boss_buff" in self ? 1 : 0;
				if(alarm_get(i) > 2){
					alarm_set(i, alarm_get(i) - (_speed_hardmode + _speed_times + _speed_boss));
				}
			}

	if "convert" not in self && global.Gamemode = 1 {
		    var _roll = round(max(random_range(1, 7.25 - .25 * item_get_count("times")), 1))
		    if (_roll == 1) {
		if (object_index == Scorpion) {
		instance_create(x, y, GoldScorpion);
		instance_delete(self);
		break;
		}
		if (object_index == Gator) {
		instance_create(x, y, BuffGator);
		instance_delete(self);
		break;
		}
		if (object_index == Exploder) {
		instance_create(x, y, SuperFrog);
		instance_delete(self);
		break;
		}
		if (object_index == FireBaller) {
		instance_create(x, y, SuperFireBaller);
		instance_delete(self);
		break;
		}
		if (object_index == Grunt) {
		instance_create(x, y, EliteGrunt);
		instance_delete(self);
		break;
		}
		if (object_index == Inspector) {
		instance_create(x, y, EliteInspector);
		instance_delete(self);
		break;
		}
		if (object_index == Shielder) {
		instance_create(x, y, EliteShielder);
		instance_delete(self);
		break;
		}
		if (object_index == SnowTank) {
		instance_create(x, y, GoldSnowTank);
		instance_delete(self);
		break;
		}
		if (object_index == LaserCrystal) {
		instance_create(x, y, LightningCrystal);
		instance_delete(self);
		break;
		}
		}
		convert = true;
		}
	} }

	if global.AnomalyGet = false && instance_exists(Player) && Player.race = "horror"
	{
		if ultra_get("horror", 2) = true
		{
			global.AnomalyGet = true
			get_item(item[? "energy"], 2)
		}
	}
	if global.FragmentGet = false && instance_exists(Player) && Player.race = "crystal"
	{
		if ultra_get("crystal", 1) = true || ultra_get("crystal", 2) = true
		{
			global.FragmentGet = true
			get_item(item[? "fragment"], 4)
		}
	}
	if global.FlaskGet = false && instance_exists(Player) && Player.race = "frog"
	{
		if ultra_get("frog", 1) = true || ultra_get("frog", 2) = true
		{
			global.FlaskGet = true
			get_item(item[? "flask"], 1)
		}
	}

	if global.HardmodeGet = false && global.Gamemode = 1 && instance_exists(Player) && !instance_exists(SpiralCont)
	{
		global.HardmodeGet = true
		get_item(item[? "times"], 2)
	}

	if instance_exists(CharSelect) {
	if "debugSet" in self {
	global.debug = CharSelect.debugSet
	} else {
	CharSelect.debugSet = false;
	}

	}
	if instance_exists(Player) {
	    Player.debug = global.debug;
	} else if instance_exists(CharSelect) {
	    CharSelect.debug = global.debug
	}

	//enemy Spawner
	with (enemy)
	{
		if distance_to_object(Player) <= 450
		{
			Close = "true"
	  }
		else
		{
	    Close = "false"
	  }
		if place_meeting(x, y, Wall) || !place_meeting(x, y, Floor) Close = "true"
	}

	/*var AMOUNT = 0;
	with (enemy) if (Close == "true") && instance_exists(self) AMOUNT++
	var scale = 3 + (round(GameCont.hard / 4) + (5 * GameCont.loops))
	var amountNum = 3
	if (global.teleporter == true) amountNum = 8 * (GameCont.loops + 1)
	with (Player) if ("s_Combat" in self) if AMOUNT <= scale || Player.s_Combat > 0
	{
	if !instance_exists(SpiralCont) && global.crownVault != true enemySpawn();
	}

	with (Player) if "s_Combat" in self && (s_Combat > 0) {
		Player.s_Combat--
		global.respawn += 1;
		enemySpawn();
	}*/

	with(FloorMaker) if GameCont.area != 0 && GameCont.area != 2 && GameCont.area != 4 && GameCont.area != 6 && GameCont.area != 100//Make areas larger
	{
		goal = 160
	  if (GameCont.area == 3) goal = 110
	}

	//Difficulty Changes
	with (enemy) {
	    if ("boost") not in self { //Boost non-boosted enemies based on difficulty
	if (global.difficulty == 1) {maxhealth *= 1.3; my_health *= 1.3;if (meleedamage >= 1) meleedamage = round(meleedamage * 1.5); boost = true; }
	if (global.difficulty == 2) {maxhealth *= 1.6; my_health *= 1.6;if (meleedamage >= 1) meleedamage *=  2; boost = true; }
	if (global.difficulty == 3) {maxhealth *= 1.9; my_health *= 1.9;if (meleedamage >= 1) meleedamage *=  3; boost = true; }
	if (global.difficulty == 4) {maxhealth *= 2.2; my_health *= 2.2;if (meleedamage >= 1) meleedamage *=  4; boost = true; }
	if (global.difficulty == 5) {maxhealth *= 2.5; my_health *= 2.5;if (meleedamage >= 1) meleedamage *=  5; boost = true; }
	if (global.difficulty == 6) {maxhealth *= 2.8; my_health *= 2.8;if (meleedamage >= 1) meleedamage = round(meleedamage * 6.5); boost = true; }
	if (global.difficulty == 7) {maxhealth *= 3.1; my_health *= 3.1;if (meleedamage >= 1) meleedamage *=  8; boost = true; }
	if (global.difficulty == 8) {maxhealth *= 3.4; my_health *= 3.4;if (meleedamage >= 1) meleedamage *= 10; boost = true; }
	    }
	}

	with (projectile) {  //Boost non-boosted projectiles based on difficulty
	    if team != 2 && "boost" not in self {
	     if (global.difficulty == 1) {damage = round(damage * 1.5); boost = true;}
	     if (global.difficulty == 2) {damage *= 2; boost = true;}
	     if (global.difficulty == 3) {damage = round(damage * 3); boost = true;}
	     if (global.difficulty == 4) {damage *= 4; boost = true;}
	     if (global.difficulty == 5) {damage *= 5; boost = true;}
	     if (global.difficulty == 6) {damage *= 6.5; boost = true;}
	     if (global.difficulty == 7) {damage *= 8; boost = true;}
	     if (global.difficulty == 8) {damage *= 10; boost = true;}
	    }
	}


	//CHEAT VARIABLES
	speed = (0) + (room_speed / 28)

	//TIME SYSTEM
	if instance_exists(Player) && !instance_exists(GenCont) global.frame += speed * current_time_scale
	if global.frame == room_speed {
	    global.frame = 0
	    global.seconds++
	}
	if global.seconds == 60 {
	    global.seconds = 0
	    global.minutes++
	}
	if global.minutes == 60 {
	    global.minutes = 0
	    global.hours++
	}
	//TIME SYSTEM END

	//DIFFICULTY INCREASING TIMER
	if !instance_exists(GenCont) && instance_exists(Player) global.time += speed * 3 * (1 + item_get_count("times") * 1.4)
	if global.time >= global.timeControl && global.difficulty != 8 { //increases every 3 minutes //11520
	global.time = 0;
	global.difficulty++ //difficulty increase
	sound_play_pitchvol(sndCursedPickup, 1.3, 1.5)
	}

	if global.difficulty == 8 {global.time = global.timeControl}
	//DIFFICULTY INCREASING TIMER END

	//Make cursed crytal caves have cursed music
	if GameCont.area = 104 && global.teleporter = true {
	var rando = [musBoss1, musBoss2, musBoss3, musBoss4B, musBoss5, musBoss6, musBoss7, musBoss8, mus104]
	var roll = round(random_range(1, 240))
	var roll2 = round(random_range(0, 8))
	var roll3 = random_range(0.5, 1.5)
	if (roll = 1) sound_stop_all()
	if (roll = 1) sound_play_pitch(rando[roll2], roll3)

	with (enemy) {
	    var roll = round(random_range(1, 20))
	    //var roll2 = round(random_range(1, array_length_1d(rollColor) - 1))
	    if (roll = 20) x += random_range(-5, 5)
	    if (roll = 20) y += random_range(-5, 5)
	    if (roll < 16) image_index = round(random_range(1, 10))
	    if (roll <= 2) image_speed = random_range(0.1, 3)
	    if (roll > 15) image_speed = 1
	    if (roll = 19) my_health -= random_range(-5, 5)
	   if (roll = 1) image_blend = merge_color(c_black, c_white, 0.2); if (roll = 1) image_xscale = random_range(0.8, 1.2); if (roll = 3) image_yscale = random_range(0.8, 1.2);
	   if (roll = 2) image_blend = merge_color(c_blue, c_white, 0.2); if (roll = 2) image_xscale = random_range(0.5, 1.5); if (roll = 4) image_yscale = random_range(0.5, 1.5);
	   if (roll = 3) image_blend = merge_color(c_orange, c_white, 0.2); if (roll > 2) image_xscale = 1
	   if (roll = 4) image_blend = merge_color(c_purple, c_white, 0.2); if (roll > 4) || (roll < 3) image_yscale = 1
	   if (roll = 5) image_blend = merge_color(c_red, c_white, 0.2);
	   if (roll = 6) image_blend = merge_color(c_green, c_white, 0.2);
	   if (roll >= 7) image_blend = merge_color(c_green, c_white, 1);
	}}

#define game_start
	Player.portalTimer = (room_speed * 5)
	if (global.Gamemode == 2) 	Player.bossKilled = false

	save_save()
	global.AnomalyGet  = 0;
	global.HardmodeGet = 0;
	global.FlaskGet    = 0;
	global.FragmentGet = 0;
	Player.debug1 = 0;

	if irandom(19) = 1 && global.Gamemode != 2{
		GameCont.area        = 101;
		global.areaChoice    = 101;
		global.subareaChoice = 1;
	}
	else{
		global.areaChoice    = 1;
		global.subareaChoice = 1;
	}
	//reset variables on run start
	global.difficulty = 0;
	global.time = 0;
	global.frame = 0;
	global.seconds = 0;
	global.minutes = 0;
	global.hours = 0;
	global.teleporter = false;
	global.MenuIndex = -1;
	//global.Gamemode  = 0;

#define teleporter_draw
	draw_self()
	if item_get_count("siphon") > 0
	{
		draw_sprite(global.sprTeleporterSiphon, portal = "vault" ? 1 : 0, x, y)
	}

#define teleporter_step
	if my_health < maxhealth my_health = maxhealth

	var _tele = self;
	with (Player)
	{
		if !instance_exists(Spiral) && instance_exists(Player) && global.teleporter = true && point_in_circle(Player.x, Player.y, _tele.x - 4, _tele.y, _tele.radius)
		{
			global.chargeF++
			if global.chargeF >= round(room_speed - (global.BossesLeft > 0 ? 0 : 45)) // 22
			{
				global.chargeF = 0;
				global.charge++; //CHANGE HOW FAST THE TELEPORTER CHARGES-----------DEFAULT 1
			}
			global.charge = clamp(global.charge, 0, max(100 - item_get_count("energy") * 10, 1))
			if global.charge >= clamp(100 - item_get_count("energy") * 10, 1, 100 - item_get_count("energy") * 10) && global.BossesLeft <= 0 && other.teledone = false // fully charged
			{
				other.teledone = true
				view_shake_max_at(x, y, 64)
				sleep(200)
			  GameCont.hard += 2

				//Area choose
			  global.subareaChoice = 1

				switch GameCont.area
				{
					case 106: global.areaChoice = 7;
										break;
					case 105: global.areaChoice = 6
										break;
					case 104: global.areaChoice = 5
										break;
					case 103: global.areaChoice = 4
										break;
					case 102: global.areaChoice = 3
										break;
				  case 101: global.areaChoice = 2
										break;
					case   1: global.areaChoice = 2
										break;
					case   2: global.areaChoice = 3
										break;
					case   3: global.areaChoice = 4
										break;
				  case   4: global.areaChoice = 5
										break;
				  case   5: global.areaChoice = 6
										break;
				  case   6: global.areaChoice = 7
										break;
					case   7: global.areaChoice = 1
										break;

				}
				// determine if next area is a secret one
				if irandom(14) = 0 && GameCont.area != 0 && GameCont.area != 6 && GameCont.area != 7{global.areaChoice += 100}

				with instance_create(_tele.x, _tele.y, Portal){if _tele.portal = "vault" {GameCont.area = 100; type = 2}else{type = 1}}
			  global.charge = 0;
			  global.teleporter = false;
			}
		}
	}


/// DRAW-RELATED FUNCTIONS ///

#define draw_gui

	//Coin Count
	if !instance_exists(Player) draw_money(10, 34)
	if instance_exists(Player) draw_money(15, 48)

	// Black backdrop
	if global.MenuIndex > -1 // If any menu is open
	{
		draw_set_alpha(.75);
		draw_rectangle_colour(0, 36, game_width, game_height - 35, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		// Hide CharSelect
		if instance_exists(Menu)
		{
			var _hasmenu = false;
			with instances_matching(CustomObject, "name", "RoarMenu") _hasmenu = true;
			if _hasmenu = false
			{
				with instance_create(0, 0, CustomObject)
				{
					name = "RoarMenu";

					on_step 	 = roarmenu_step;
					on_destroy = roarmenu_destroy;
				}
			}
		}
	}

	if instance_exists(CharSelect)
	{

		/// GAMEMODES
	  draw_set_halign(fa_center)
	  if global.Gamemode = 2 // Boss mode Header
		{
			draw_set_alpha(0.5)
			//draw_text_nt(game_width / 2, sin(current_frame / 10) * 2/ (room_speed / 30) + 22, "@yBOSS RUSH")
			draw_text_nt(game_width / 2, sin(current_frame / 10 + 3) * 2/ (room_speed / 30) + 20, "@yBOSS RUSH")
			draw_set_alpha(1)
			draw_text_nt(game_width / 2, sin(current_frame / 10) * 2/ (room_speed / 30) + 20, "@yBOSS RUSH")
	  }

	  if global.Gamemode = 1 // Hardmode Header
		{
		  draw_set_alpha(0.7)
		  draw_text_nt(game_width / 2 + random_range(-2, 2), 20 + random_range(-2, 2), "@rHARD MODE")
		  draw_set_alpha(1)
		  draw_text_nt(game_width / 2, 20, "@rHARD MODE")
	  }
	  if global.Gamemode = 0 // Normal mode Header
		{
			draw_text_nt(game_width / 2, 20, "@wNORMAL MODE")
	  }

	  draw_set_halign(fa_left);
	  var _draw_x = 10,
	    	_draw_y = 62,
				_button_w = sprite_get_width(global.sprButtons),
				_button_h = sprite_get_height(global.sprButtons),
				_string_h = string_height("M") / 2,
				_active = false;

		// Button backdrop
		var _i = 0;
		repeat(3)
		{
			draw_sprite(global.sprButtonsSplat, 1, _draw_x - 3, _draw_y + _button_h * _i);
			_i++;
		}

	  for(var i = 0; i < 0.5; i += 1)
		{
			if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _draw_x - _button_w/2,  _draw_y - _button_h/2, _draw_x + _button_w/2, _draw_y + _button_h/2)
			{
				_active = true;
	      if button_pressed(i, "fire")
				{
	        if global.MenuIndex != 0
					{
						global.MenuIndex   = 0;
						global.MenuXoffset = 3;
					}
					else
					{
						global.MenuIndex = -1;
					}
					sound_play(sndClick);
				}
	    }

			if global.MenuIndex = 0  || _active = true
			{
				_active = true;
			}

					/// INFO
					_active = false;
					_draw_y += _button_h + 1;

					if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _draw_x - _button_w/2,  _draw_y - _button_h/2, _draw_x + _button_w/2, _draw_y + _button_h/2)
					{
						_active = true;
				    if button_pressed(i, "fire")
						{
					    if (global.MenuIndex) != 1
							{
									global.MenuIndex   = 1;
									global.MenuXoffset = 3;
					    }
							else
							{
					        global.MenuIndex = -1;
					    }
							sound_play_pitch(sndClick, 1)
				    }
			    }

					if _active = true
					{
						_active = true;
					}

					/// SETTINGS
					_active = false;
					_draw_y += _button_h + 1;
					if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _draw_x - _button_w/2,  _draw_y - _button_h/2, _draw_x + _button_w/2, _draw_y + _button_h/2)
					{
						_active = true;
						if button_pressed(i, "fire")
						{
							if (global.MenuIndex) != 2
							{
								global.MenuIndex   = 2;
								global.MenuXoffset = 3;
							}
							else
							{
							  global.MenuIndex = -1;
							}
							sound_play_pitch(sndClick, 1)
						}
					}

					if global.MenuIndex = 2 || _active = true
					{
						_active = true;
					}

					if button_pressed(0, "sout")
					{
						global.MenuIndex++
						if global.MenuIndex > 2 global.MenuIndex = 0
						global.MenuXoffset = 3
					}
					if button_pressed(0, "nort")
					{
						global.MenuIndex--
						if global.MenuIndex < 0 global.MenuIndex = 2
						global.MenuXoffset = 3
					}

					draw_set_font(fntSmall);
					var _strbutton = "";
					switch global.MenuIndex
					{
						case 0: _strbutton = "MODES"      ; break;
						case 1: _strbutton = "UPDATE#INFO"; break;
						case 2: _strbutton = "OPTIONS"    ; break;
					}
					for(var _i = 0, _sy = _draw_y - (_button_h + 1) * 2, _hover = false; _i <= 2; _i++)
					{
						if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _draw_x - _button_w/2, _sy + _i * (_button_h + 1) - _button_h/2, _draw_x + _button_w/2, _sy + _i * (_button_h + 1) + _button_h/2) || global.MenuIndex = _i
						{
							_hover = true
							switch global.MenuIndex
							{
								case 0: _strbutton = "MODES"      ; break;
								case 1: _strbutton = "UPDATE#INFO"; break;
								case 2: _strbutton = "OPTIONS"    ; break;
							}
						}
						draw_sprite_ext(global.sprButtons, _i, _draw_x, _sy + _i * (_button_h + 1) - _hover, 1, 1, 0, _hover = true ? c_white : c_ltgray, 1);
						_hover = false
					}
					draw_text_nt(_draw_x - 9, _draw_y  +  sprite_get_height(global.sprButtons) / 2 + 4, _strbutton);
					draw_set_font(fntM);

	    		if global.MenuIndex = 1
					{
						var _drawx = game_width / 2 - (120 + global.MenuXoffset);
		        draw_text_nt(_drawx, 42, (floor(current_frame/8)*30 % 20 ? "@sVERSION 1.7" : "@pVERSION 1.7"));
		        draw_text_nt(_drawx, 52, "@s[INSERT UPDATE RELEASE DATE]")
		        draw_text_nt(_drawx, 42, "@s            [CURSED UPDATE]")
		        var draw_y = -5
		        draw_text_nt(_drawx, 66 + draw_y, "@s-PATCH NOTES-")
		        draw_set_font(fntChat)
		        draw_text_nt(_drawx, 182 + draw_y, "ITEMS: 38")
						draw_text_nt(_drawx,  72 + draw_y, "@w-Added \# cursed items #-Added \# other items#-Polished Menus#-Increased Preformance#-Fancier Effects#@w-Options now @ysave#@w-Added @pCursed Coins, @wcan be used to open @pcursed chests")
		        draw_text_nt(_drawx, 191 + draw_y, "SHRINES: 9")
						if global.MenuXoffset != 0 global.MenuXoffset = 0;
					}

				// Draw the gamemode menu
		    if global.MenuIndex = 0
				{
					draw_x = 111 - global.MenuXoffset;
					draw_y = 79
					x_offset = 70 //space between each button
					y_offset = 15
	        draw_set_alpha(0.5)
	        draw_sprite(global.sprModes, 0, draw_x + 1           , draw_y + y_offset + 1)
	        draw_sprite(global.sprModes, 1, draw_x + 1 + x_offset, draw_y + y_offset + 1)
			draw_sprite(global.sprModes, 2, draw_x + 1 + x_offset * 2, draw_y + y_offset + 1)
	        draw_set_alpha(1)
	        draw_set_color(c_white)
	        draw_rectangle(draw_x - 42 + global.Gamemode * x_offset, draw_y - 27 , draw_x + global.Gamemode * x_offset, draw_y + 15, 0)

	        draw_sprite(global.sprModes, 0, draw_x           , draw_y + y_offset)
	        draw_sprite(global.sprModes, 1, draw_x + x_offset, draw_y + y_offset)
			draw_sprite(global.sprModes, 2, draw_x + x_offset * 2, draw_y + y_offset)
	        draw_set_color(c_white); draw_set_alpha(0.2);
					var _textx = 9,
					    _texty = 169,
							_strModeNormal = "@sThe default difficulty, for those who#don't wanna die every 2 seconds",
							_strModeHard   = "@s#Enemies have more @rhp@s, are more #@ragressive@s, @yelites@s spawn more often,#@wdifficulty@s scales faster, more #@pcursed coins @sand everything sucks"
							_strModeBoss   = "@s###Fight @wall bosses @sin a row, gaining #@yitems@s and @rweapons @son the way"
					draw_set_halign(fa_left)
					draw_set_alpha(1)
					if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -42, draw_y-27, draw_x+0, draw_y+10)
					{
						draw_backdrop(_textx, _texty - string_height(_strModeNormal) / 2, _textx + 298,  _texty + string_height(_strModeNormal), "Normal Mode")
		        draw_text_nt(_textx + 3, _texty, _strModeNormal)
		        if button_pressed(i, "fire")
						{
			        global.Gamemode = 0;
			        sound_play_pitch(sndClick, 1.2)
		        }
	        }
	        draw_x += x_offset
			  	if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -42, draw_y-27, draw_x+0, draw_y+10)
					{
		        draw_backdrop(_textx, _texty - string_height(_strModeNormal) * 4 / 3 - 2, _textx + 298,  _texty + string_height(_strModeNormal), "Hard Mode")
		        draw_text_nt(_textx + 3, _texty - string_height(_strModeNormal) * 4 / 3 - 2, _strModeHard)
		        if button_pressed(i, "fire")
						{
			        global.Gamemode = 1;
			        sound_play_pitch(sndClick, 1)
			        sound_play_pitch(sndMeatExplo, 1)
		        }
	        }

			draw_x += x_offset
			  	if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -42, draw_y-27, draw_x+0, draw_y+10)
					{
		        draw_backdrop(_textx, _texty - string_height(_strModeNormal) / 2, _textx + 298,  _texty + string_height(_strModeNormal), "Boss Rush")
		        draw_text_nt(_textx + 3, _texty - string_height(_strModeNormal) * 4 / 3 - 2, _strModeBoss)
		        if button_pressed(i, "fire")
						{
			        global.Gamemode = 2;
			        sound_play_pitch(sndClick, 1)
			        sound_play_pitch(sndSwapShotgun, 0.8)
		        }
	        }
					if global.MenuXoffset != 0 global.MenuXoffset = 0;
	    }

			// OPTIONS
			if global.MenuIndex = 2
			{
				var draw_x  = game_width / 2 - 120,
				 		draw_y  = 20,
						_str    = "PERFORMANCE MODE",
						_x1     = game_width / 2 - 120 - global.MenuXoffset,
						_x2     = _x1 + string_width(_str) + string_width(" OFF") + 6,
						_y1     = game_height / 2 - 70,
						_y2     = _y1 + string_height(_str),
						_c      = "@s",
						_inbox  = false,
						_varstr = global.preformanceMode = true ? " ON" : " OFF",
						_vardst = string_width(_str) + 12,
						_detstr = "",
						_dety   = game_height - 20,
						_chtstr = "";

				// Preformance Mode Toggle
				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "INCREASES PERFORMANCE IN FAVOUR OF QUALITY";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.preformanceMode = false global.preformanceMode = true else global.preformanceMode = false
					}
					save_save();
				}

				// Enemy Hp bars
				_str    = "HEALTH BARS";
				_y1    += string_height(_str) + 9;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = global.hpBars = true ? " ON" : " OFF";

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "SHOWS THE HEALTH OF ENEMIES";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.hpBars = false global.hpBars = true else global.hpBars = false
						save_save();
					}
				}

				// Boss Hp bars
				_str    = "BOSS HEALTH BARS";
				_y1    += string_height(_str) + 9;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = global.bossBars = true ? " ON" : " OFF";

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "SHOWS THE HEALTH OF BOSS ENEMIES";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.bossBars = false global.bossBars = true else global.bossBars = false
						save_save();
					}
				}

				// Force support
				_str    = "FORCE SUPPORT";
				_y1    += string_height(_str) + 9;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = global.forceSupport = true ? " ON" : " OFF";

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "FORCES CUSTOM PROJECTILES OF OTHER MODS TO BE AFFECTED BY THIS MOD";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.forceSupport = false global.forceSupport = true else global.forceSupport = false
						save_save();
					}
				}

				// 60 FPS
				_str    = "60 FPS";
				_y1    += string_height(_str) + 9;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = global.sixtyFPS = true ? " ON" : " OFF";

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "TOGGLES 60 FPS MODE, WHICH LOOKS SMOOTHER#MAY LAG THE GAME";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.sixtyFPS = false global.sixtyFPS = true else global.sixtyFPS = false
						save_save();
					}
				}

				// THE CHEATY ONES

				// Double chests
				_str    = "DOUBLE CHESTS";
				_y1    += string_height(_str) + 21;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = global.doubleChests = true ? " ON" : " OFF";

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "DOUBLES THE AMOUNT OF CHESTS GENERATED IN A LEVEL#MEANT TO HAVE A FUN TIME";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.doubleChests = false global.doubleChests = true else global.doubleChests = false
						save_save();
					}
				}
				if global.doubleChests = true
				{
					draw_set_font(fntSmall);
					draw_text_nt(_x2, _y1, "@rCHEAT ENABLED");
					draw_set_font(fntM);
				}

				// Double shrines
				_str    = "DOUBLE SHRINES";
				_y1    += string_height(_str) + 9;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = global.doubleShrines = true ? " ON" : " OFF";

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "DOUBLES THE AMOUNT OF SHRINES GENERATED IN A LEVEL#MEANT TO HAVE A FUN TIME";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, random_range(0.8, 1.2));
						if global.doubleShrines = false global.doubleShrines = true else global.doubleShrines = false
						save_save();
					}
				}
				if global.doubleShrines = true
				{
					draw_set_font(fntSmall);
					draw_text_nt(_x2, _y1, "@rCHEAT ENABLED");
					draw_set_font(fntM);
				}

				// RESET PROGRESS
				_str    = "RESET PROGRESS IN " + string(global.reset);
				_y1    += string_height(_str) + 21;
				_y2     = _y1 + string_height(_str);
				_c      = "@s";
				_inbox  = false;
				_varstr = " "

				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i], _x1, _y1, _x2, _y2)
				{
					_c 			= "@w";
					_inbox  = true;
					_detstr = "RESET ALL RISK OF ACID RAIN PROGRESS";
				}
				draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
				draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
				if _inbox = true
				{
					draw_sprite(sprDailySplat, 2, _x1 - 20, _y1 + 5);
					draw_text_nt(_x1, _y1 - (_inbox = true ? 1 : 0), _c + _str);
					draw_text_nt(_x1 + _vardst, _y1 - (_inbox = true ? 1 : 0), _c + _varstr);
					if button_pressed(i, "fire")
					{
						sound_play_pitch(sndClick, 0.8 - ((4 - global.reset * 1.5)/10));
						if (global.reset >= 1) global.reset--
						if (global.reset <= 0) reset_progress();
						save_save();
					}
				}

				draw_set_font(fntSmall);
				draw_text_nt(_x1, _dety, _detstr);
				if global.MenuXoffset > 0 global.MenuXoffset = 0;
			}
		}
	}

	///DEBUG
	if global.debug = true && instance_exists(Player)
	{
	    draw_set_halign(fa_right)
	    draw_set_font(fntChat)
	    draw_set_alpha(1)
	    draw_text_nt(game_width - 2, 229, string(Player.debug1))
	    draw_text_nt(game_width - 2, 219, string(GameCont.area) + "-" + string(GameCont.subarea)) //get_timer_nonsync()
	    draw_text_nt(game_width - 2, 209,  " @so-" + string(instance_number(Effect) + instance_number(Pickup)) +  " @rp-" + string(instance_number(projectile)) + " @ge-" + string(instance_number(enemy)) + " @bi-" + string(Player.debug2))
	    var strain = round(instance_number(enemy) / 2 + instance_number(projectile) / 5 + Player.debug2 + instance_number(Pickup) / 5 + instance_number(Effect) / 10 + instance_number(Floor) / 10)
	     draw_text_nt(game_width - 2, 199, "@y" + string(strain))
	    draw_set_font(fntM0)
	}

	draw_timehud(0,0);

	if instance_exists(CharSelect) {
	//Draw splash screen
	if global.menu == true {
		 draw_set_font(fntChat)
		 draw_set_halign(1)
		if (global.released = true) draw_text_nt(game_width - 5, game_height - 10, "@w" + string(global.version), )
		if (global.released = false) draw_text_nt(game_width - 8, game_height - 10, "@w" + string(global.version) + "@rU" )
		draw_set_font(fntM)
	    draw_set_alpha(0.8)
	    draw_set_color(c_black)
	    draw_rectangle(0, 0, game_width, game_height, 0);
	    draw_set_alpha(1)
	    draw_set_color(c_white)
	draw_sprite(global.sprSplash, 1, game_width / 2 + 160, game_height);
	draw_text_nt(game_width / 2 - 10, game_height / 2 + 10, "Click to continue")
	 draw_text_nt(game_width / 2 - 10, game_height / 2 + 10, (floor(current_frame/8)*30 % 20 ? "@wClick to continue" : "@sClick to continue"));

	 // draw_text_nt(game_width / 2 - 10, game_height / 2 + 25, (floor(current_frame/8)*30 % 20 ? "@sPress 1 to run at 30 FPS" : "@dPress 1 to run at 30 FPS"));
	for(var i = 0; i < 0.5; i += 1) {  if button_pressed(i, "fire") {
	global.menu = false;
	sound_play(sndHeavyRevoler)

	}}
	}
	}

#define draw_pause
	var _e = false;
	if !instance_exists(menubutton) _e = true
	with OptionMenuButton  _e = true
	with AudioMenuButton   _e = true
	with VisualsMenuButton _e = true
	with GameMenuButton    _e = true
	with ControlMenuButton _e = true
	if _e = true exit
	draw_timehud(view_xview_nonsync, view_yview_nonsync);

#define draw
	draw_set_halign(fa_center)
	with instances_matching(CustomProp, "name", "Teleporter")
	{
		var _tele = self
		if (distance_to_object(Player) <= 8) && (global.teleporter == false)
		{
			with Player
			{
				if(button_pressed(index, "pick")) && global.teleporter == false //What to do when the activate teleporter
				{
					_tele.currad = _tele.addframes;
					sound_play(sndLevelUltra)
	        global.teleporter = true;
					var i = 0
					do
					{
						with instance_nearest(x, y, Wall) if distance_to_object(other)<= _tele.maxradius - 16
						{
							instance_create(x, y, FloorExplo)
							instance_destroy()
							sleep(2)
						}
						i++;
					}until(i = 1000 || distance_to_object(instance_nearest(x, y, Wall)) > _tele.maxradius - 16)

					sound_play_music(musBoss8)

	 				var _boss_amount = 1,
					    _boss        = CrownGuardianOld,
							_bosshp      = 2;
				  other._enemy = Guardian;
					switch GameCont.area
					{
						case   1: _boss  = BanditBoss;
											other._enemy = Bandit;
									  	sound_play_music( musBoss1);
									  	break;
						case   2: _boss  = FrogQueen;
											other._enemy = FastRat;
									  	sound_play_music( musBoss5);
											_bosshp = .6;
									  	break;
						case   3: _boss  = ScrapBoss;
											other._enemy = Raven;
									  	sound_play_music( musBoss2);
											_bosshp = 1.6;
									  	break;
						case   4: _boss  = HyperCrystal;
											other._enemy = Spider;
											sound_play_music( musBoss6);
											break;
						case 	 5: _boss  = LilHunter;
											other._enemy = Grunt;
											sound_play_music( musBoss3);
											break;
						case 	 6: _boss  = TechnoMancer;
											other._enemy = Freak;
											sound_play_music( musBoss7);
											break;
						case	 7: _boss  = Nothing2;
											other._enemy = Wind;
											sound_play_music(musBoss4B);
											break;
						case   0: _boss  = Nothing2;
											other._enemy = WindNight;
						 			  	sound_play_music( musBoss8);
									  	break;
						case 101: _boss  = OasisBoss;
											other._enemy = Bubble;
											sound_play_music(musBoss3);
											_bosshp = .7;
											break;
						case 102: _boss  = Turtle;
											other._enemy = Rat;
						 					sound_play_music(musBoss3);
											_boss_amount += 3;
											break;
						case 103: _boss  = SuperFireBaller;
											other._enemy = Molefish;
											sound_play_music(mus104);
						    			_boss_amount += 4;
											break;
					}
					if other.portal = "vault" other._enemy = Guardian;
					instance_create(other.x, other.y, PortalClear)
					_boss_amount *= Player.s_Challenge + 1

	        repeat(_boss_amount)
					{
						with instance_create(other.x, other.y, _boss)
						{
							global.BossesLeft++
							tag = "boss"
							maxhealth *= 1.55
							my_health = maxhealth
							if instance_exists(Player) && distance_to_object(Player) <= 64
							{
								var _i = 0;
								do
								{
									move_contact_solid(point_direction(Player.x, Player.y, x, y), 1)
									_i++;
								}until(_i = 100 or distance_to_object(Player) > 64)
							}
						}
					}
	    	}
			}


			//DRAW ACTIVATE TEXT
	    draw_x = 1; draw_y = 30;
			draw_set_halign(fa_middle)
			draw_text_nt(x, y - 60 + draw_y, "ACTIVATE");
			draw_sprite(sprEPickup, 0, x, y - 7)
			draw_set_halign(fa_left)
		}
		var _ang = random(360)
		if global.teleporter = true
		{
			currad--;
			radius += (maxradius - radius) * (addframes - currad) / addframes;

			if(current_frame mod (room_speed * 5)) = 0 && instance_number(_enemy) < 12
			{
				repeat(irandom(2) + 1) with instance_create(_tele.x, _tele.y, _enemy)
				{
					if instance_exists(Player) && distance_to_object(Player) <= 32
					{
						var _i = 0;
						do
						{
							_i++;
							move_contact_solid(point_direction(Player.x, Player.y, x, y) + random_range(-20, 20), 1)
						}until(_i = 84 or distance_to_object(Player) > 64)

						if place_meeting(x, y, Wall)
						{
							with instance_nearest(x, y, Wall)
							{
								instance_create(x, y, Wall)
								instance_destroy()
							}
						}
						repeat(6) with instance_create(x, y, Smoke){depth = other.depth - choose(0, 1, 1)}
					}
				}
			}
		}
	}
	with instances_matching(enemy, "tag", "boss") // make bosses more powerful
	{
		if "boss_buff" not in self
		{
			boss_buff = 1 + item_get_count("times") * .25 + global.Gamemode
			maxhealth *= boss_buff + _bosshp
			my_health = maxhealth
		}
	}
	with TopCont
	{
		with instances_matching(CustomProp, "name", "Teleporter") var _tele = self
		if instance_exists(Player)
		{
			if global.teleporter == true && _tele != Player
			{
				draw_x = 5
				draw_y = 20
				var _strTele      = string(global.charge) + "%",
						_strTeleBlink = point_distance(_tele.x, _tele.y, Player.x, Player.y) <= _tele.radius ? "@w" : (current_frame mod 5 <= 2 ? "@w" : "@r"),
						_x            = clamp(_tele.x + draw_x - 2, view_xview + string_width(_strTele)/2, view_xview + game_width  + 2 - string_width(_strTele)/2),
						_y            = clamp(_tele.y + 12        , view_yview                           , view_yview + game_height - string_height(_strTele)),
						_portal       = _tele.portal = "vault" ? sprProtoPortal : sprPortal
				draw_set_halign(1)
				draw_text_nt(_x, _y, _strTeleBlink + _strTele);
				draw_text_nt(_x, _y, _strTeleBlink + _strTele);
				draw_sprite_ext(_portal, (current_frame * .5) mod 4, _tele.x, _tele.y, .4 * (Player.x < _tele.x ? -1 : 1), .4, 0, c_white, 1)
			}
			else
			{
				if Player.s_Challenge > 0 && global.charge <= 0 && global.teleporter = false
				{
					var _i = 1;
					repeat(Player.s_Challenge)
					{
						draw_sprite_ext(global.shrineIcons, 3, _tele.x + 4, _tele.y -10 - (sprite_get_height(global.shrineIcons) + 1) * _i, 1, 1, 0, c_black, .5)
						draw_sprite_ext(global.shrineIcons, 3, _tele.x + 6, _tele.y -10 - (sprite_get_height(global.shrineIcons) + 1) * _i, 1, 1, 0, c_black, .5)
						draw_sprite_ext(global.shrineIcons, 3, _tele.x + 5, _tele.y -11 - (sprite_get_height(global.shrineIcons) + 1) * _i, 1, 1, 0, c_black, .5)
						draw_sprite_ext(global.shrineIcons, 3, _tele.x + 5, _tele.y  -9 - (sprite_get_height(global.shrineIcons) + 1) * _i, 1, 1, 0, c_black, .5)
						draw_sprite(global.shrineIcons, 3, _tele.x + 5, _tele.y -10 - (sprite_get_height(global.shrineIcons) + 1) * _i)
						_i++
					}
				}
			}
		}
	}

#define circlesurface_draw
	if !surface_exists((global.CircleSurf)){global.CircleSurf = surface_create(game_screen_get_width_nonsync(), game_screen_get_height_nonsync())}

	// Safety clear
	surface_set_target(global.CircleSurf);
	draw_clear_alpha(c_white,0);
	surface_reset_target();

	with instances_matching(CustomObject, "name", "shrine")
	{
		if index = crwn_protection
		{
			var _x = x - view_xview,
			    _y = y - view_yview;

			if (global.fancy == 1) surface_set_target(global.CircleSurf)
			draw_circle_colour(_x - 1, _y, radius, c_inv, c_inv, false);
			if (global.fancy == 1) surface_reset_target();
		}
	}

	with instances_matching(CustomProp, "name", "Teleporter")
	{
		//DRAW TELEPORTER CIRCLE
		if global.teleporter == true && instance_exists(Player)
		{
			//DRAW TELEPORTER PERCENT
			draw_x = 5
			draw_y = 20
			draw_sprite(global.sprInteractSplat, 0, draw_x, draw_y)
			var _x = x - view_xview,
			    _y = y - view_yview;

			if (global.fancy == 1) surface_set_target(global.CircleSurf)
			draw_circle_colour(_x, _y, radius, c_red, c_red, false);
			if (global.fancy == 1) surface_reset_target();
		}
	}
	with instances_matching(CustomSlash, "name", "Inv Area")
	{
		var _x = x - view_xview,
				_y = y - view_yview;

		if (global.fancy == 1) surface_set_target(global.CircleSurf)
		draw_circle_colour(_x, _y, image_xscale, c_fel, c_fel, false);
		if (global.fancy == 1) surface_reset_target();
	}




	with instances_matching(CustomObject, "name", "shrine")
	{
		if index = crwn_protection
		{
			var _x = x - view_xview,
					_y = y - view_yview;

			if (global.fancy == 1) surface_set_target(global.CircleSurf)
			draw_set_blend_mode(bm_subtract)
			draw_circle_colour(_x - 1, _y, radius - 2, c_white, c_white, false);
			draw_set_blend_mode(bm_normal)
			if (global.fancy == 1) surface_reset_target();

			draw_set_alpha(.15)
			draw_circle_colour(x - 1, y, radius, c_inv, c_inv, false)
			draw_set_alpha(1)
		}
	}

	with instances_matching(CustomProp, "name", "Teleporter")
	{
		//DRAW TELEPORTER CIRCLE
		if global.teleporter == true && instance_exists(Player)
		{
			//DRAW TELEPORTER PERCENT
			draw_x = 5
			draw_y = 20
			var _x = x - view_xview,
			    _y = y - view_yview;

			if (global.fancy == 1) surface_set_target(global.CircleSurf)
			draw_set_blend_mode(bm_subtract)
			draw_circle_colour(_x, _y, radius - 2, c_white, c_white, false);
			draw_set_blend_mode(bm_normal)
			if (global.fancy == 1) surface_reset_target();

			draw_set_alpha(.15)
			draw_circle_colour(x, y, radius, c_red, c_red, false)
			draw_set_alpha(1)
		}
	}





	with Player
	{
		if global.NitrogenCountdown > 0
		{
			var _x = x - view_xview,
			    _y = y - view_yview;

			if (global.fancy == 1) surface_set_target(global.CircleSurf)
			draw_set_alpha(global.NitrogenCountdown / 10)
			draw_circle_colour(_x - 1, _y, 46, c_blue, c_blue, false);
			draw_set_alpha(1)
			if (global.fancy == 1) surface_reset_target();
			global.NitrogenCountdown--;

			draw_set_alpha((global.NitrogenCountdown / 10) * .45)
			draw_circle_colour(_x - 1, _y, 46, c_blue, c_blue, false);
			draw_set_alpha(1)
		}
	}
	with Player
	{
		if global.NitrogenCountdown > 0
		{
			var _x = x - view_xview,
			    _y = y - view_yview;

			if (global.fancy == 1) surface_set_target(global.CircleSurf)
			draw_set_blend_mode(bm_subtract)
			draw_circle_colour(_x - 1, _y, 44, c_white, c_white, false);
			draw_set_blend_mode(bm_normal)
			if (global.fancy == 1) surface_reset_target();
		}
	}

	if surface_exists(global.CircleSurf)
	{
		if (global.fancy == 1) draw_surface_ext(global.CircleSurf, view_xview, view_yview, 1, 1, 0, c_white, .8)
		if (global.fancy == 1) surface_free(global.CircleSurf)
	}

#define point_in_teleporter(OBJECT)
	with instances_matching(CustomProp, "name", "Teleporter")
	{
		if distance_to_object(OBJECT) <= radius * radifac && global.charge > 0 {return true}else{return false}
	}
	return false;

#define draw_money(X, Y)
	draw_sprite(global.sprCoinSplatMain, 1, X - 14, Y - 3)
	draw_text_nt(X - 1, Y + 3, "@w" + string(global.coins))

#define draw_timehud(XOFFSET, YOFFSET)
	if !instance_exists(CharSelect)
	{
		draw_set_halign(fa_left)
		var 					_x = game_width - 73 + XOFFSET,
				          _y = 84 + YOFFSET - (!is_undefined(skill_get_at(0)) ? 0 : 20),
		_difficulty_name = "",
				 _bar_length = (global.time * 85) / global.timeControl,
				   _barwidth = 9;

		draw_backdrop(_x - 20, _y - 60, _x + 68, _y - 43, ""); //drawing black box

		//DRAWING THE PROGRESS BAR
		switch global.difficulty
		{
			case 0: 				 draw_set_color(make_colour_rgb( 66, 154,  60)); _difficulty_name = "EASY"			 ; break;
			case 1: 				 draw_set_color(make_colour_rgb(151, 123,  65)); _difficulty_name = "MEDIUM"		 ; break;
			case 2: 				 draw_set_color(make_colour_rgb(132,  94,  57)); _difficulty_name = "HARD"			 ; break;
			case 3: 				 draw_set_color(make_colour_rgb(141,  70,  60)); _difficulty_name = "VERY HARD"  ; break;
			case 4: 				 draw_set_color(make_colour_rgb(140,  67,  72)); _difficulty_name = "INSANE"		 ; break;
			case 5: 				 draw_set_color(make_colour_rgb(110,  83, 104)); _difficulty_name = "IMPOSSIBLE" ; break;
			case 6: 				 draw_set_color(make_colour_rgb( 69,  58,  80)); _difficulty_name = "I SEE YOU"  ; break;
			case 7: 				 draw_set_color(c_black)											 ; _difficulty_name = "I'M COMING" ; break;
			case 8: default: draw_set_color(c_black)											 ; _difficulty_name = "HAHAHAHAHA" ; break;
		}

		_y -= 51;
		_x -= 16;
		if _bar_length > .5 draw_rectangle( _x - 1, _y, _bar_length + _x - 1, _y + _barwidth, false)
		draw_set_alpha(0.4);
		draw_rectangle(_x - 1, _y, 84 + _x, _y +_barwidth, false)
		draw_set_color(c_white);
		draw_set_alpha(1);
		_y += 1;
		draw_text_nt(_x, _y, string(_difficulty_name));
		//DRAWING THE PROGRESS BAR END

		//DRAW TIME SYSTEM
		draw_set_font(fntSmall)

		draw_set_halign(fa_left)
		_x -= 1;
		_y -= 7;
		var _str_time = string(global.hours) + ":" + (global.minutes < 10 ? "0" + string(global.minutes) : string(global.minutes)) + ":" + (global.seconds < 10 ? "0" + string(global.seconds) : string(global.seconds))
		draw_text_nt(_x, _y, _str_time);

		var _strdifficulty = "";
		switch global.Gamemode
		{
			case 0: _strdifficulty = "NORMAL";		break;
			case 1: _strdifficulty = "HARD"; 			break;
			case 2: _strdifficulty = "BOSS RUSH"; break;
		}
		draw_set_halign(fa_right)
		_x += 87;
		draw_text_nt(_x, _y, _strdifficulty)
		draw_set_font(fntM)
		//DRAW TIME SYSTEM END
	}


/// SAVEFILE-RELATED FUNCTIONS ///

#define load_save

	wait file_load(savefile);
	if file_exists(savefile){
		/* */
			var _settings = string_load(savefile);
			_settings = string_split(_settings,"|");
			global.preformanceMode = real(_settings[0]);
			global.hpBars = real(_settings[1]);
			global.bossBars = real(_settings[2]);
			global.forceSupport = real(_settings[3]);
			global.sixtyFPS = real(_settings[4]);
			global.coins = real(_settings[5]);
			file_unload(savefile);

		}

#define save_save
	var _str = "" + string(global.preformanceMode) + "|" + string(global.hpBars) + "|" + string(global.bossBars)+ "|" + string(global.forceSupport) + "|" + string(global.sixtyFPS) + "|" + string(global.coins);
	string_save(_str,savefile);

#define reset_progress
	global.reset = 3
	sound_play_pitch(sndExplosion, 1)

	//Progress Reset: (Include all non-settings saved progress here)
	global.coins = 3;


/// OTHER ///

#define roarmenu_step
	var _f = button_pressed(0, "fire"), // yeah idunno either
	    _s = button_pressed(0, "spec"),
			_p = button_pressed(0, "paus");
	with(Menu)
	{
		mode = 0;
		charsplat = 1;
		for(var i = 0; i < array_length(charx); i++) charx[i] = 0;
		sound_volume(sndMenuCharSelect, 0);
	}
	with(Loadout) instance_destroy();
	with(loadbutton) instance_destroy();
	with(menubutton) instance_destroy();
	with(BackFromCharSelect) noinput = 10;
	var _close = false;
	if point_in_rectangle(mouse_x, mouse_y, -94, -52, -72, -26)
	{
		if _f = true
		{
			_close = true;
		}
	}
	if _s || _p || global.MenuIndex <= -1{_close = true}
	if _close = true
	{
		global.MenuIndex = -1
		instance_destroy()
	}

#define roarmenu_destroy
	MenuSplat = 1;
	sound_play(sndClickBack);

	with(Menu)
	{
		mode = 0;
		event_perform(ev_step, ev_step_end);
		sound_volume(sndMenuCharSelect, 1);
		sound_stop(sndMenuCharSelect);
		with(CharSelect) alarm0 = 2;
	}
	with(Loadout) selected = 0;


#define chest_setup(TAG)																 return mod_script_call("mod", "items","chest_setup"   , TAG)
#define obj_create(X, Y, OBJ_NAME)											 return mod_script_call("mod", "items","obj_create"    , X, Y, OBJ_NAME)
#define add_item(ITEM)																	 return mod_script_call("mod", "items","add_item"      , ITEM)
#define remove_item(ITEM, AMOUNT)     			             return mod_script_call("mod", "items","remove_item"   , ITEM, AMOUNT)
#define get_item(ITEM, AMOUNT)     			                 return mod_script_call("mod", "items","get_item"      , ITEM, AMOUNT)
#define item_get_count(ITEM)                             return mod_script_call("mod", "items","item_get_count", ITEM)
#define draw_backdrop(XSTART, YSTART, XEND, YEND, TITLE) return mod_script_call("mod", "items", "draw_backdrop", XSTART, YSTART, XEND, YEND, TITLE)
