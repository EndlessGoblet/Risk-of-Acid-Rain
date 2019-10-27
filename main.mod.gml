#macro item mod_variable_get("mod", "itemlib", "ItemDirectory");

#define init
if instance_exists(CharSelect) sound_play_pitch(sndLevelUltra, 0.9)
//DEBUG
global.debug = true;
//Create important initial variables
global.AnomalyGet  = 0;
global.HardmodeGet = 0;
global.difficulty = 0;

global.time = 0;
global.frame = 0;
global.seconds = 0;
global.minutes = 0;
global.hours = 0;

global.teleporter = false;

global.CircleSurf = -1;
//Garbo Variables
global.radi = 0;
global.maxradi = 150

//spawn arrays
global.spwDesert     = [Bandit, Bandit, Bandit, Scorpion, BigMaggot, BigMaggot, Maggot, Maggot]
global.spwSewers     = [Rat, Rat, Rat, Ratking, Gator, Gator, BuffGator, Bandit, Bandit]
global.spwScrapyard  = [Bandit, Bandit, Raven, Raven, MeleeBandit, Sniper, Salamander]
global.spwCaves      = [LaserCrystal, LightningCrystal, Spider, Gator]
global.spwIce        = [Bandit, SnowTank, SnowBot, Wolf]
global.spwLabs       = [Freak, Turret, Freak, ExploFreak, Necromancer, RhinoFreak]
global.spwPalace     = [ExploGuardian, DogGuardian, Guardian, Guardian, ExploGuardian]
global.spwPizza      = [Turtle, Rat]
global.spwOasis      = [BoneFish, Crab, BoneFish, BoneFish, BoneFish, Bandit, Bandit]
global.spwMansion    = [FireBaller, SuperFireBaller, Jock, Molefish, Molesarge]
global.spwCursed     = [InvLaserCrystal, InvSpider]
global.spwEverything = [Bandit, Scorpion, BigMaggot, Maggot, Rat, Ratking, Gator, BuffGator, Raven, MeleeBandit, Sniper, Salamander, LaserCrystal, LightningCrystal, Spider, Bandit, SnowTank, SnowBot, Wolf, Turret, Freak, ExploFreak, Necromancer, RhinoFreak, ExploGuardian, Guardian, DogGuardian, Turtle, BoneFish, Crab, FireBaller, SuperFireBaller, Jock, Molefish, Molesarge, InvLaserCrystal, InvSpider]
global.spwJungle     = [JungleAssassinHide, JungleBandit, JungleFly]
global.spwNight      = [Bandit, Bandit]

global.speed = 15;
global.charge = 0;
global.chargeF = 0;
global.areaChoice = 0
global.subareaChoice = 0
global.BarLength = 0;
global.DarkCircle = false;
global.respawn = 0;
global.info = false;
global.modesMenu = false;
global.mode = 0;
global.crownVault = false;
if (instance_exists(CharSelect)) CharSelect.closeSettings = true;
if (instance_exists(Player)) Player.debug = false;

global.shrineIcons = sprite_add("sprites/shrines/shrineIcons.png", 16, 13, 13)

//Main Menu (Splash screen?)
global.menu = false;
global.sprSplash  = sprite_add("sprites/other/splash.png", 1, 320, 240);
global.sprVersion = sprite_add("sprites/other/sprVersion.png", 1, 93, 20);
global.sprOutline = sprite_add("sprites/other/sprOutline.png", 1, 93, 20);

global.sprTeleporterIdle   = sprite_add("sprites/teleporter/sprTeleporterIdle.png"  , 1, 24, 20);
global.sprTeleporterSiphon = sprite_add("sprites/teleporter/sprTeleporterSiphon.png", 2, 24, 20);
global.mskTeleporter       = sprite_add("sprites/teleporter/mskTeleporter.png"      , 1, 24, 20);

global.sprMode  = sprite_add("sprites/other/sprMode.png", 1, 19, 13);
global.sprModes = sprite_add("sprites/other/sprModes.png", 2, 41, 41);
if (instance_exists(CharSelect)) global.menu = true;
//set new level function
global.newLevel = instance_exists(GenCont);
global.hasGenCont = false;
while(true){
	if(instance_exists(GenCont)) global.newLevel = 1;
	else if(global.newLevel){
		global.newLevel = 0;
		level_start();
	}
	var hadGenCont = global.hasGenCont;
	global.hasGenCont = instance_exists(GenCont);
	wait 1;
}

#macro c_fel $FF271C;

#define level_start
with instance_create(0, 0, CustomObject)
{
	name = "RoRSurfaceHandler"
	depth = -1.9
	on_draw = circlesurface_draw
}

global.crownVault = false;
//Reset vars
global.BossesLeft = 0 // 0 at level start, after teleport activation = amount of boss enemies, at 0 spawns an item
global.subareaChoice = 0
global.areaChoice = 0

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
if (global.mode == 1) {
with (WeaponChest) {
    if (GameCont.area == 1 || GameCont.area == 101) {
        wait(2)
        if instance_exists(WeaponChest) {
        instance_create(x, y, BigWeaponChest)
        instance_delete(self);
        }
    }
}}
//SPAWN OBJECTS ON LEVEL START
with Player
{
	if GameCont.area != 100 with instance_create(instance_furthest(x, y, Floor).x - sprite_xoffset + sprite_width / 2, instance_furthest(x, y, Floor).y - sprite_yoffset + sprite_height / 2, CustomProp)
	{
		name     = "Teleporter"
		teledone = false
		radifac  = random_range(.9, 1.1)
		portal   = "regular"

		spr_idle   = global.sprTeleporterIdle
		spr_hurt   = global.sprTeleporterIdle
		spr_dead   = global.sprTeleporterIdle
		spr_shadow = mskNone
		mask_index   = global.mskTeleporter
		image_speed  = .5
		maxhealth    = 999999999999999999999999 // yeah
		my_health    = maxhealth

		var _i = 0;
		do
		{
			with instance_nearest(x, y, Wall) if distance_to_object(other) <= 64
			{
				instance_create(x, y, FloorExplo);
				instance_destroy();
			}
			_i++;
		}until(_i = 64)
		with Debris instance_delete(self);

		on_step  = teleporter_step
		on_draw  = teleporter_draw
	}
}

global.radi = 0;
global.speed = 15;
global.charge = 0;
global.chargeF = 0;
global.teleporter = false;

#define enemySpawn
if instance_exists(Player)
{
	var _place = -4
	switch GameCont.area
	{
		case   1: _place = global.spwDesert;    break;
		case   2: _place = global.spwSewers;    break;
		case   3: _place = global.spwScrapyard; break;
		case   4: _place = global.spwCaves;     break;
		case   5: _place = global.spwIce;       break;
		case   6: _place = global.spwLabs;      break;
		case   7: _place = global.spwPalace;    break;
		case   0: _place = global.spwNight;     break;
		case 100: _place = global.spwPalace;    break;
		case 101: _place = global.spwOasis;     break;
		case 102: _place = global.spwPizza;     break;
		case 103: _place = global.spwMansion;   break;
		case 104: if global.teleporter = true
							{
								_place = global.spwEverything;
								break;
							}
							else
							{
								_place = global.spwCursed;
								break;
							}
		case 105: _place = global.spwJungle; break;
		default:  _place =  global.spwNight; break;
	}

	// CHESTS:
	var  _floorq = ds_list_create(), // put all available floor tiles into a list
		   _i = 0;

	with Floor // get a list of all "unoccupied" Floors
	{
		var _d = 0;
		if instance_exists(Player) && distance_to_object(Player) > 92 && !place_meeting(x, y, hitme) && self != FloorExplo &&  distance_to_object(instance_nearest(x, y, Wall)) > 16
		{
			_floorq[| _i] = self; // add eligible floor tiles to the list
			_i++;
		}
	}
	ds_list_shuffle(_floorq)


  var enemyChoice = _place[round(random_range(0, array_length(_place) - 1))]

	with instance_create(_floorq[| 0].x, _floorq[| 0].y, enemyChoice)
	{
		if place_meeting(x, y, Wall) || place_meeting(x, y, FloorExplo) || !place_meeting(x, y, Floor) || distance_to_object(Player) <= 32
		{
			instance_delete(self)
			exit
		}
	}
}

#define teleporter_draw
draw_self()
if item_get_count("siphon") > 0
{
	draw_sprite(global.sprTeleporterSiphon, portal = "vault" ? 1 : 0, x, y)
}

#define teleporter_step
//TELEPORTER EVENT

if my_health < maxhealth my_health = maxhealth

var _tele = self;
with (Player)
{
	if !instance_exists(Spiral) && instance_exists(Player) && global.teleporter = true && point_in_circle(Player.x, Player.y, _tele.x - 4, _tele.y, global.radi)
	{
		global.chargeF++
		if global.chargeF == round(room_speed / 1.5)
		{
			global.chargeF = 0;
			global.charge += 1 + (global.BossesLeft = 0 ? 3 : 0) //CHANGE HOW FAST THE TELEPORTER CHARGES-----------DEFAULT 1
			if (GameCont.area = 101) global.charge += 4 //Charge faster in oasis
			with instances_matching_le(enemy,"my_health",0)
			{
				if size > 0
				{
					if (irandom(9) = 0) instance_create(x, y, AmmoPickup)
				}
			}
		}
		global.charge = clamp(global.charge, 0, max(100 - item_get_count("energy") * 10, 1))
		if global.charge >= clamp(100 - item_get_count("energy") * 10, 1, 100 - item_get_count("energy") * 10) && global.BossesLeft <= 0 && other.teledone = false // fully charged
		{
			other.teledone = true
			view_shake_max_at(x, y, 64)
			sleep(200)
		  GameCont.hard += 2

			//Area choose
		  var _roll = round(random_range(1, 3))
		  global.areaChoice = GameCont.lastarea + 1
		  global.subareaChoice = 1

			switch GameCont.area
			{
				case 106: GameCont.area    = 7;
				          GameCont.subarea = 1;
									break;
				case 105: if _roll = 0
									{
										GameCont.area    = 106;
										GameCont.subarea = 5;
									}
									else
									{
										GameCont.area    = 5;
										GameCont.subarea = 3;
									}
									break;
				case 104: if _roll = 0
									{
										GameCont.area    = 105;
										GameCont.subarea = 1;
									}
									else
									{
										GameCont.area    = 3;
										GameCont.subarea = 3;
									}
									break;
				case 103: if _roll = 0
									{
										GameCont.area    = 104;
										GameCont.subarea = 1;
									}
									else
									{
										GameCont.area    = 3;
										GameCont.subarea = 3;
									}
									break;
				case 102: if _roll = 0
									{
										GameCont.area    = 103;
										GameCont.subarea = 1;
									}
									else
									{
										GameCont.area    = 2;
										GameCont.subarea = 1;
									}
									break;
			  case 101: if _roll = 0
									{
										GameCont.area    = 102;
										GameCont.subarea = 1;
									}
									else
									{
										GameCont.area    = 1;
										GameCont.subarea = 3;
									}
									break;
				case   1: if _roll = 0
									{
										GameCont.area = 102
									}
									break;
				case   2: if _roll = 0
									{
										GameCont.area = 103
									}
									break;
				case   3: if _roll = 0
					 				{
					 					GameCont.area = 104
					 				}
									break;
			  case   4: if _roll = 0
									{
										GameCont.area = 105
									}
									break;
			  case   5: if _roll = 0
									{
										GameCont.area = 106
									}
									break;
			}
			with instance_create(_tele.x, _tele.y, Portal){if _tele.portal = "vault" {GameCont.area = 100; type = 2}else{type = 1}}
		  global.charge = 0;
		  global.teleporter = false;
		}
	}
}

#define step
if irandom(instance_number(enemy) + room_speed * (1 - (crown_current = 7 ? .25 : 0))) = 0 && !instance_exists(Portal) && GameCont.area != 100 && !instance_exists(SpiralCont) enemySpawn()

//Crown Vault Fix
if instance_exists(CrownPed) global.crownVault = true;
if instance_exists(Portal) && global.crownVault == true {
  GameCont.area = (GameCont.lastarea );
  GameCont.subarea = 3;
}

//bosses item spawn code
 if instance_exists(Player) with instances_matching(hitme, "tag", "boss")
{
	if my_health <= 0
	{
		global.BossesLeft--
		if global.BossesLeft = 0
		{
			repeat(Player.s_Challenge) with obj_create(x, y, "ItemChest")
			{
				tag = "item"
				item_index = mod_variable_get("mod", "items", "UncommonItems")[random_range(0, array_length(mod_variable_get("mod", "items", "UncommonItems")) - 1)]
				chest_setup(tag)
			}
		}
	}
}

var minutes_ = 3 //How many minutes for difficulty to go up
if (global.mode == 1) var minutes_ = 5
//global.timeControl = 60 * 60 * (21600) //Time Control
global.timeControl = (minutes_ * 2) * (60 * 60)

//Hard Mode

with (enemy) {
for(i = 0; i < 5; i++){
			var _speed_hardmode = global.mode = 1 ? 1 : 0,
			    _speed_times    = .2 * item_get_count("times"),
					_speed_boss     = "boss_buff" in self ? 1 : 0;
			if(alarm_get(i) > 2){
				alarm_set(i, alarm_get(i) - (_speed_hardmode + _speed_times + _speed_boss));
			}
		}

if "convert" not in self && global.mode = 1 {
	    var _roll = round(max(random_range(1, 5.25 - .25 * item_get_count("times")), 1))
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
}

if global.AnomalyGet = false && instance_exists(Player) && Player.race = "horror"
{
	if ultra_get("horror", 2) = true
	{
		global.AnomalyGet = true
		get_item(item[? "energy"], 2)
	}
}

if global.HardmodeGet = false && global.mode = 1 && instance_exists(Player) && !instance_exists(SpiralCont)
{
	global.HardmodeGet = true
	get_item(item[? "times"], 1)
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
if instance_exists(CharSelect) && "closeSettings" not in self {
    CharSelect.closeSettings = false;
}
if instance_exists(CharSelect) && "closeInfo" not in self {
    CharSelect.closeInfo = false;
}
if instance_exists(CharSelect) && (CharSelect.closeInfo == true) {
    global.info = false;
    CharSelect.closeInfo = false;
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
	goal = 220
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
speed = (0) + (room_speed / 30)

//INCREASE GLOBAL.RADI
if global.radi < global.maxradi && global.teleporter == true
{
    global.radi += (1 * (global.speed));
    global.speed *= 0.9;
}

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
sound_play_pitch(sndDragonStop,1)
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
global.AnomalyGet  = false;
global.HardmodeGet = false;
Player.debug1 = 0;
var roll = round(random_range(1, 3))
if (roll = 1) {
GameCont.area = 101;
global.areaChoice = 101;
global.subareaChoice = 1
} else {
global.areaChoice = 1
global.subareaChoice = 1
}
//reset variables on run start
global.difficulty = 0;
global.time = 0;
global.frame = 0;
global.seconds = 0;
global.minutes = 0;
global.hours = 0;
global.teleporter = false;
global.modesMenu = false;
global.info = false;



#define draw_gui
//TO-DO
if instance_exists(CharSelect)  {
    draw_set_halign(fa_center)
    if (global.mode == 1) {
    draw_set_alpha(0.7)
    draw_text_nt(game_width / 2 + random_range(-2, 2), 20 + random_range(-2, 2), "@rHARD MODE")
    draw_set_alpha(1)
    draw_text_nt(game_width / 2, 20, "@rHARD MODE")
    }
    if (global.mode == 0) {
        draw_set_alpha(1)
draw_text_nt(game_width / 2, 20, "@wNORMAL MODE")
    }
        draw_set_halign(fa_left)
    var draw_x = -19
    var draw_y = 42
    draw_set_alpha(1)
    for(var i = 0; i < 0.5; i += 1) {
    if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x+15, draw_y-6, draw_x+4*10+2, draw_y+10) {
        draw_sprite(global.sprMode, 1, 20, 50)
        if button_pressed(i, "fire") {

        if (global.modesMenu == false) { global.modesMenu = true; global.info = false; sound_play(sndClick) } else { global.modesMenu = false; sound_play(sndClick)}

         }
    } else {
        draw_sprite(global.sprMode, 1, 20, 51)
    }

    var draw_x = game_width - 47; var draw_y = 44; draw_set_alpha(0); draw_rectangle(0+draw_x-52, draw_y-6, draw_x+4*10+2, draw_y+10, 0); draw_set_alpha(1) draw_set_color(c_white)
    if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-6, draw_x+4*10+2, draw_y+10) {
    draw_sprite_ext(global.sprOutline, 1, game_width - 5, 55, 1, 1, 0, c_white, 1 );
    draw_sprite_ext(global.sprVersion, 1, game_width - 5, 55, 1, 1, 0, c_white, 1 );
    if button_pressed(i, "fire") {
    if (global.info) == false {
        global.info = true;
        global.modesMenu = false;
        CharSelect.closeSettings = true;
        sound_play_pitch(sndClick, 0.8)
        wait(2)
        sound_play_pitch(sndClick, 0.9)
        wait(2)
        sound_play_pitch(sndClick, 1)
    } else {
        global.info = false;
        sound_play_pitch(sndClick, 1)
        wait(2)
        sound_play_pitch(sndClick, 0.9)
        wait(2)
        sound_play_pitch(sndClick, 0.8)
    }
    }
    } else {
    draw_sprite(global.sprVersion, 1, game_width - 5, 55)
    }
    if (global.modesMenu==true) || (global.info ==true) { draw_x = game_width / 2 + 35; draw_y = 20; draw_set_alpha(0.85); draw_set_color(c_black); draw_rectangle(120+draw_x, 20+draw_y, -190+draw_x, 180+draw_y, 0) }
    if global.info == true { //Draw menues here--------------
        //draw_x = game_width / 2 + 35; draw_y = 20; draw_set_alpha(0.85); draw_set_color(c_black); draw_rectangle(120+draw_x, 20+draw_y, -190+draw_x, 180+draw_y, 0)
        draw_set_alpha(1)
        //draw_text_nt(game_width / 2 - 152, 42, "@pVERSION 1.5")
         draw_text_nt(game_width / 2 - 152, 42, (floor(current_frame/8)*30 % 20 ? "@wVERSION 1.6" : "@gVERSION 1.6"));
        draw_text_nt(game_width / 2 - 152, 52, "@s10/20/19")
        draw_text_nt(game_width / 2 - 152, 42, "@s            [ITEMS AND ARMOR GALORE]")
        var draw_y = -5
        draw_text_nt(game_width / 2 - 152, 66 + draw_y, "@s-PATCH NOTES-")
        draw_set_font(fntChat)
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "@w-More balanced items")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "#@w-Added @yArmor @wand @gLuck")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "##@w-Added @rHARDMODE @dVia controller on the top-right")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "###@y-8 New Items")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "####@w-I'm 99% sure you can't get stuck in the crown vault anymore")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "#####@w-Added shrine of @rcarnage")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "######@w-Tons of bug fixes")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "#######@w-Added @gbig chests@w that give better items")
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "########@w-Reverted back to @rteleporter @wnot being able to be hit")
        draw_text_nt(game_width / 2 - 152, 182 + draw_y, "ITEMS: 38")
        draw_text_nt(game_width / 2 - 152, 191 + draw_y, "SHRINES: 9")

    }
    if global.modesMenu == true {
				draw_x = 141
				draw_y = 79
				x_offset = 70
				y_offset = 15
        draw_set_alpha(0.5)
        draw_sprite(global.sprModes, 0, draw_x + 1           , draw_y + y_offset + 1)
        draw_sprite(global.sprModes, 1, draw_x + 1 + x_offset, draw_y + y_offset + 1)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_rectangle(draw_x - 42 + global.mode * x_offset, draw_y - 27 , draw_x + global.mode * x_offset, draw_y + 15, 0)

        draw_sprite(global.sprModes, 0, draw_x           , draw_y + y_offset)
        draw_sprite(global.sprModes, 1, draw_x + x_offset, draw_y + y_offset)
        draw_set_color(c_white); draw_set_alpha(0.2);
				var _textx = 9,
				    _texty = 169,
						_strModeNormal = "@sThe default difficulty, for those who#don't wanna die every 2 seconds",
						_strModeHard   = "@s#Enemies have more @rhp@s, are more #@ragressive@s, @yelites@s spawn more often,#@wdifficulty@s scales faster, and #everything sucks"
				draw_set_halign(fa_left)
				draw_set_alpha(1)
				if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-30, draw_x-12, draw_y+10)
				{
					draw_backdrop(_textx, _texty - string_height(_strModeNormal) / 2, _textx + 298,  _texty + string_height(_strModeNormal), "Normal Mode")
	        draw_text_nt(_textx + 3, _texty, _strModeNormal)
	        if button_pressed(i, "fire")
					{
		        global.mode = 0;
		        sound_play_pitch(sndClick, 1.2)
	        }
        }
        draw_x += x_offset
		  	if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-30, draw_x-12, draw_y+10)
				{
	        draw_backdrop(_textx, _texty - string_height(_strModeNormal) * 4 / 3 - 2, _textx + 298,  _texty + string_height(_strModeNormal), "Hard Mode")
	        draw_text_nt(_textx + 3, _texty - string_height(_strModeNormal) * 4 / 3 - 2, _strModeHard)
	        if button_pressed(i, "fire")
					{
		        global.mode = 1;
		        sound_play_pitch(sndClick, 1)
		        sound_play_pitch(sndMeatExplo, 1)
	        }
        }
    }
}
}
//DEBUG
if global.debug == true && instance_exists(Player) {
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
if !instance_exists(CharSelect) {
draw_set_halign(fa_left) //_draw x = 115
  var	_drawX   = game_width - 73,
	    _drawY   = 82,
			y_offset = GameCont.level > 0 ? 20 : 0,
			_mutY    = !is_undefined(skill_get_at(0)) ? 20 : 0;
  draw_backdrop(_drawX-20, _drawY-60 - y_offset + _mutY, _drawX+68, _drawY-32 - y_offset + _mutY, ""); //drawing black box
//DRAWING THE PROGRESS BAR
var BarLength = (global.time * 83) / global.timeControl
draw_X = game_width - 89
draw_Y = 35  + _mutY

easy       = make_colour_rgb(66, 154, 60);  //easy
hard       = make_colour_rgb(132, 94, 57)   //hard
medium     = make_colour_rgb(151, 123, 65); //medium
veryhard   = make_colour_rgb(141, 70, 60);  //very hard
insane     = make_colour_rgb(140, 67, 72);  //insane
impossible = make_colour_rgb(110, 83, 104); //impossible
Iseeyou    = make_colour_rgb(69, 58, 80);   //I see you


if (global.difficulty == 0) draw_set_color(easy)
if (global.difficulty == 1) draw_set_color(medium)
if (global.difficulty == 2) draw_set_color(hard)
if (global.difficulty == 3) draw_set_color(veryhard)
if (global.difficulty == 4) draw_set_color(insane)
if (global.difficulty == 5) draw_set_color(impossible)
if (global.difficulty == 6) draw_set_color(Iseeyou)
if (global.difficulty == 7) draw_set_color(c_black)

draw_set_alpha(1);
draw_rectangle(0 + draw_X, 11 + draw_Y - y_offset, (BarLength) + draw_X, 1 + draw_Y - y_offset, false)
draw_set_alpha(0.4);
draw_rectangle(0 + draw_X, 11 + draw_Y - y_offset, (83) + draw_X, 1 + draw_Y - y_offset, false)
draw_set_alpha(1)

var difficultyName
if (global.difficulty == 0) { difficultyName = "EASY"; draw_set_color(c_white) }
if (global.difficulty == 1) { difficultyName = "MEDIUM"; draw_set_color(c_white) }
if (global.difficulty == 2) { difficultyName = "HARD"; draw_set_color(c_white) }
if (global.difficulty == 3) { difficultyName = "VERY HARD"; draw_set_color(c_white) }
if (global.difficulty == 4) difficultyName = "INSANE"
if (global.difficulty == 5) difficultyName = "IMPOSSIBLE"
if (global.difficulty == 6) difficultyName = "I SEE YOU"
if (global.difficulty == 7) difficultyName = "I'M COMING"
if (global.difficulty == 8) difficultyName = "HAHAHAHAHA"
draw_set_color(c_white);
draw_set_alpha(1);

draw_text_nt(game_width - 87, 38 - y_offset + _mutY, string(difficultyName));
//DRAWING THE PROGRESS BAR END

//DRAW TIME SYSTEM
draw_set_halign(fa_left)
draw_set_font(fntM)
draw_x = 68
draw_text_nt(game_width- 131 + draw_x, 28 - y_offset + _mutY, ":");
draw_text_nt(game_width- 151 + draw_x, 28 - y_offset + _mutY, ":");
draw_set_halign(fa_right)
draw_text_nt(game_width - 110 + draw_x, 28 - y_offset + _mutY, string(global.seconds));
draw_text_nt(game_width - 130 + draw_x, 28 - y_offset + _mutY, string(global.minutes));
draw_text_nt(game_width - 149 + draw_x, 28 - y_offset + _mutY, string(global.hours));
if global.seconds < 10 {
    draw_text_nt(game_width - 118 + draw_x, 28 - y_offset + _mutY, " 0");
}
if global.minutes < 10 {
    draw_text_nt(game_width - 138 + draw_x, 28 - y_offset + _mutY, " 0");
}
//DRAW TIME SYSTEM END
} else {
//Draw splash screen
if global.menu == true {
    draw_set_alpha(0.8)
    draw_set_color(c_black)
    draw_rectangle(0, 0, game_width, game_height, 0);
    draw_set_alpha(1)
    draw_set_color(c_white)
draw_sprite(global.sprSplash, 1, game_width / 2 + 160, game_height);
draw_set_halign(1)
draw_text_nt(game_width / 2 - 10, game_height / 2 + 10, "Click to continue")
 draw_text_nt(game_width / 2 - 10, game_height / 2 + 10, (floor(current_frame/8)*30 % 20 ? "@wClick to continue" : "@sClick to continue"));
  draw_text_nt(game_width / 2 - 10, game_height / 2 + 25, (floor(current_frame/8)*30 % 20 ? "@sPress 1 to run at 30 FPS" : "@dPress 1 to run at 30 FPS"));
for(var i = 0; i < 0.5; i += 1) {  if button_pressed(i, "fire") {
global.menu = false;
sound_play(sndHeavyRevoler)
room_speed=60;
current_time_scale=0.5
} else if button_pressed(i, "key1") {
global.menu = false;
sound_play(sndHeavyRevoler)
room_speed=30;
current_time_scale=1
}}
}

}

#define draw
draw_set_halign(fa_center)
with instances_matching(CustomProp, "name", "Teleporter")
{
	if (distance_to_object(Player) <= 8) && (global.teleporter == false)
	{
		with Player
		{
			if(button_pressed(index, "pick")) && global.teleporter == false //What to do when the activate teleporter
			{
				sound_play(sndLevelUltra)
        global.teleporter = true;
        global.radi += 1;
				var i = 0
				do
				{
					with instance_nearest(x, y, Wall) if distance_to_object(other)<= global.maxradi
					{
						instance_create(x, y, FloorExplo)
						instance_destroy()
						sleep(2)
					}
					i++;
				}until(i = 1000)

				sound_play_music(musBoss8)

 				var _boss_amount = 1,
				    _boss        = CrownGuardianOld;
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
								  	break;
					case   3: _boss  = ScrapBoss;
										other._enemy = Raven;
								  	sound_play_music( musBoss2);
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
				_boss_amount *= Player.s_Challenge + 1

        repeat(_boss_amount)
				{
					with instance_create(other.x, other.y, _boss)
					{
						global.BossesLeft++
						tag = "boss"
						if instance_exists(Player) && distance_to_object(Player) <= 64
						{
							var _i = 0;
							do
							{
								move_contact_solid(point_direction(Player.x, Player.y, x, y), 1)
							}until(_i = 100 or distance_to_object(Player) > 64)
						}
					}
				}
    	}
		}


		//DRAW ACTIVATE TEXT
    draw_x = 1; draw_y = -17; draw_set_alpha(0.5); draw_set_color(c_black);
    draw_rectangle(draw_x+x + 40 , draw_y+y - 9 , x+draw_x-43 ,y+draw_y , false)
    draw_set_color(c_white); draw_set_alpha(1)
    draw_text_nt(x, y - 25, "@1(keysmall:pick) ACTIVATE");
	}
	var _ang = random(360)
	if global.teleporter = true && (current_frame mod (room_speed * 5)) = 0 && instance_number(_enemy) < 12
	{
		repeat(irandom(2) + 1) with instance_create(x + lengthdir_x(global.radi * radifac * random_range(.3, .8), _ang), y + lengthdir_y(global.radi * radifac * random_range(.3, .8), _ang), _enemy)
		{
			repeat(6) with instance_create(x, y, Smoke){sprite_index = sprDust; depth = other.depth - choose(0, 1, 1)}
			if instance_exists(Player) && distance_to_object(Player) <= 32
			{
				var _i = 0;
				do
				{
					move_contact_solid(point_direction(Player.x, Player.y, x, y), 1)
				}until(_i = 100 or distance_to_object(Player) > 32)
			}
		}
	}
}
with instances_matching(enemy, "tag", "boss") // make bosses more powerful
{
	if "boss_buff" not in self
	{
		boss_buff = (self != OasisBoss ? 2 : 1) + item_get_count("times") * .25
		maxhealth *= boss_buff
		my_health = maxhealth
	}
}
with TopCont
{
	with instances_matching(CustomProp, "name", "Teleporter") var _tele = self
	if instance_exists(Player)
	{
		if global.teleporter == true
		{
			draw_x = 5
			draw_y = 20
			var _strTele      = string(global.charge) + "%",
					_strTeleBlink = point_distance(_tele.x, _tele.y, Player.x, Player.y) <= global.radi ? "@w" : (current_frame mod 5 <= 2 ? "@w" : "@r"),
					_x            = clamp(_tele.x + draw_x - 2, view_xview + string_width(_strTele)/2, view_xview + game_screen_get_width_nonsync() - string_width(_strTele)/2 + 2),
					_y            = clamp(_tele.y + 12, view_yview, view_yview + game_screen_get_height_nonsync() - string_height(_strTele)),
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
with instances_matching(CustomProp, "name", "Teleporter")
{
	//DRAW TELEPORTER CIRCLE
	if global.teleporter == true && instance_exists(Player)
	{
		//DRAW TELEPORTER PERCENT
		draw_x = 5
		draw_y = 20
		draw_set_alpha(0.5)
		draw_set_color(c_black);
		draw_rectangle(draw_x+x + 15 , draw_y+y - 9 , x+draw_x-23 ,y+draw_y , false)
		draw_set_alpha(1)
		var _x = x - view_xview,
		    _y = y - view_yview;

		surface_set_target(global.CircleSurf)
		draw_circle_colour(_x -4, _y, global.radi, c_red, c_red, false);
		surface_reset_target();
	}
}
with instances_matching(CustomSlash, "name", "Inv Area")
{
	var _x = x - view_xview,
			_y = y - view_yview;

	surface_set_target(global.CircleSurf)
	draw_circle_colour(_x, _y, image_xscale, c_fel, c_fel, false);
	surface_reset_target();
}

with instances_matching(CustomProp, "name", "Teleporter")
{
	//DRAW TELEPORTER CIRCLE
	if global.teleporter == true && instance_exists(Player)
	{
		//DRAW TELEPORTER PERCENT
		draw_x = 5
		draw_y = 20
		draw_set_alpha(0.5)
		draw_set_color(c_black);
		draw_rectangle(draw_x+x + 15 , draw_y+y - 9 , x+draw_x-23 ,y+draw_y , false)
		draw_set_alpha(1)
		var _x = x - view_xview,
		    _y = y - view_yview;

		surface_set_target(global.CircleSurf)
		draw_set_blend_mode(bm_subtract)
		draw_circle_colour(_x -4, _y, global.radi - 2, c_white, c_white, false);
		draw_set_blend_mode(bm_normal)
		surface_reset_target();

		draw_set_alpha(.15)
		draw_circle_colour(x -4, y, global.radi, c_red, c_red, false)
		draw_set_alpha(1)
	}
}
with instances_matching(CustomSlash, "name", "Inv Area")
{
	var _x = x - view_xview,
			_y = y - view_yview;

	surface_set_target(global.CircleSurf)
	draw_set_blend_mode(bm_subtract)
	draw_circle_colour(_x, _y, image_xscale - 2, c_white, c_white, false);
	draw_set_blend_mode(bm_normal)
	surface_reset_target();

	draw_set_alpha(.25)
	draw_circle_colour(x, y, global.radi, c_fel, c_fel, false)
	draw_set_alpha(1)
}

if surface_exists(global.CircleSurf) = true
{
	draw_surface_ext(global.CircleSurf, view_xview, view_yview, 1, 1, 0, c_white, .8)
	surface_free(global.CircleSurf)
}

#define point_in_teleporter(OBJECT)
with instances_matching(CustomProp, "name", "Teleporter")
{
	if distance_to_object(OBJECT) <= global.radi * radifac && global.charge > 0 {return true}else{return false}
}
return false;


#define chest_setup(TAG)																 return mod_script_call("mod", "items","chest_setup"   , TAG)
#define obj_create(X, Y, OBJ_NAME)											 return mod_script_call("mod", "items","obj_create"    , X, Y, OBJ_NAME)
#define add_item(ITEM)																	 return mod_script_call("mod", "items","add_item"      , ITEM)
#define get_item(ITEM, AMOUNT)     			                 return mod_script_call("mod", "items","get_item"      , ITEM. AMOUNT)
#define item_get_count(ITEM)                             return mod_script_call("mod", "items","item_get_count", ITEM)
#define draw_backdrop(XSTART, YSTART, XEND, YEND, TITLE) return mod_script_call("mod", "items", "draw_backdrop", XSTART, YSTART, XEND, YEND, TITLE)
