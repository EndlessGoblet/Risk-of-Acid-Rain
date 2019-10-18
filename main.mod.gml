#macro item mod_variable_get("mod", "itemlib", "ItemDirectory")

#define init
if instance_exists(CharSelect) sound_play_pitch(sndLevelUltra, 0.9)
//DEBUG
global.debug = false;
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
//Garbo Variables
global.radi = 0;
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
if (instance_exists(CharSelect)) CharSelect.closeSettings = true;
if (instance_exists(Player)) Player.debug = false;
//Main Menu (Splash screen?)
global.menu = false;
global.sprSplash  = sprite_add("sprites/other/splash.png", 1, 320, 240);
global.sprVersion = sprite_add("sprites/other/sprVersion.png", 1, 93, 20);
global.sprOutline = sprite_add("sprites/other/sprOutline.png", 1, 93, 20);
global.sprMode = sprite_add("sprites/other/sprMode.png", 1, 19, 13);
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

#define level_start
//Reset vars
global.subareaChoice = 0
global.areaChoice = 0
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
//SPAWN OBJECTS ON LEVEL START
var floors = instances_matching(Floor, mod_current, undefined);
var my_floor = floors[irandom(array_length(floors) - 1)];
with(my_floor){ instance_create(x - sprite_xoffset + sprite_width / 2, y - sprite_yoffset + sprite_height / 2, SmallGenerator ); }

var my_floor = floors[irandom(array_length(floors) - 1)];
with(my_floor){ instance_create(x - sprite_xoffset + sprite_width / 2, y - sprite_yoffset + sprite_height / 2, SmallGenerator ); }

var my_floor = floors[irandom(array_length(floors) - 1)];
with(my_floor){ instance_create(x - sprite_xoffset + sprite_width / 2, y - sprite_yoffset + sprite_height / 2, SmallGenerator ); }

repeat(2) with instance_nearest(Player.x, Player.y, SmallGenerator) {
    instance_delete(self)
}
if instance_number(SmallGenerator) > 1 {
    with instance_nearest(Player.x, Player.y, SmallGenerator) {
 instance_delete(self)
    }
}
;
if (GameCont.area == 100) with (SmallGenerator) instance_delete(self)
global.radi = 0;
global.speed = 15;
global.charge = 0;
global.chargeF = 0;
global.teleporter = false;


#define enemySpawn
if instance_exists(Player) {

var negative_ASK = round(random_range(0, 1))
var negative = 1;
if (negative_ASK == 0) negative = -1; if (negative_ASK == 1) negative = 1;
if instance_exists(Player) {
var SpawnX = Player.x + (random_range(75, 200) * negative)
var SpawnY = Player.y + (random_range(75, 200) * negative)

if (global.teleporter == true) { SpawnX = Player.x - (random_range(50, 150) * negative); SpawnY = Player.y - (random_range(50, 150) * negative); }
var desert = [Bandit, Bandit, Scorpion, BigMaggot, Maggot]
var sewers = [Rat, Rat, Rat, Ratking, Gator, Gator, BuffGator, Bandit, Bandit]
var scrapyard = [Bandit, Bandit, Raven, Raven, MeleeBandit, Sniper, Salamander]
var caves = [LaserCrystal, LightningCrystal, Spider, Gator]
var ice = [Bandit, SnowTank, SnowBot, Wolf]
var labs = [Freak, Turret, Freak, ExploFreak, Necromancer, RhinoFreak]
var palace = [ExploGuardian, DogGuardian, Guardian, Guardian, ExploGuardian]
var pizza = [Turtle, Rat]
var oasis = [BoneFish, Crab, BoneFish, BoneFish]
var mansion = [FireBaller, SuperFireBaller, Jock, Molefish, Molesarge]
var cursed = [InvLaserCrystal, InvSpider]
var everything = [Bandit, Scorpion, BigMaggot, Maggot, Rat, Ratking, Gator, BuffGator, Raven, MeleeBandit, Sniper, Salamander, LaserCrystal, LightningCrystal, Spider, Bandit, SnowTank, SnowBot, Wolf, Turret, Freak, ExploFreak, Necromancer, RhinoFreak, ExploGuardian, Guardian, DogGuardian, Turtle, BoneFish, Crab, FireBaller, SuperFireBaller, Jock, Molefish, Molesarge, InvLaserCrystal, InvSpider]
var jungle = [JungleAssassinHide, JungleBandit, JungleFly]
var place
if (GameCont.area == 1) place = desert; if (GameCont.area == 2) place = sewers; if (GameCont.area == 3) place = scrapyard; if (GameCont.area == 4) place = caves; if (GameCont.area == 5) place = ice; if (GameCont.area == 6) place = labs; if (GameCont.area == 7) place = palace;
if (GameCont.area == 105) place = jungle;
if (GameCont.area == 104) place = cursed;
if (GameCont.area == 103) place = mansion;
if (GameCont.area == 102) place = pizza;
if (GameCont.area == 101) place = oasis;
if (GameCont.area == 100) place = palace;
if (GameCont.area == 104) && (global.teleporter = true) place = everything
with (Player) debug1 = place

    //var roll = round(random_range(1, 500)) //HOW MUCH ENEMIES SPAWN (NATURALLY)
    var roll = round(random_range(1, 25))
    if (GameCont.area == 100) var roll = round(random_range(1, 500))
    if (global.teleporter == true) roll = round(random_range(1, 10))
    if (global.teleporter == true && GameCont.area = 103) roll = round(random_range(1, 5)) //More enemies during teleporter mansion
    if (global.teleporter == true && GameCont.area = 101) roll = round(random_range(1, 20)) //More tame teleporter enemy increase during oasis
    var negative_ASK = round(random_range(0, 1))
var negative = 1;
if (negative_ASK == 0) negative = -1; if (negative_ASK == 1) negative = 1;
var x_ = (random_range(50, 200) * negative)
var y_ = (random_range(50, 200) * negative)
var SpawnX = Player.x + x_
var SpawnY = Player.y + y_


    if roll == 1 || global.respawn > 0{
        var enemyChoice = place[round(random_range(0, array_length_1d(place) - 1))]

        with instance_create(SpawnX + 16, SpawnY + 16, enemyChoice) {
            New = true;
            if distance_to_object(Floor) >= 8 && distance_to_object(FloorExplo) >= 8 && distance_to_object(FloorMiddle) >= 8 {
                instance_delete(self);
                //enemySpawn();
               // global.respawn += 1;
                break;
            }
        }
        with instances_matching(enemy, "New", true) {
          //  if instance_exists(object_index) {
            if distance_to_object(Wall) == 0 {
        if ("tag" not in self) {
        instance_delete(self);
        //enemySpawn();
               // global.respawn += 1;
                break;
        }
        } else {
            New = false;
        if !instance_exists(Spiral) repeat(15) instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16 + random_range(1, 16), instance_nearest(SpawnX, SpawnY, Floor).y + 16 + random_range(1, 16), Dust)
        }
       // }

    }}

}
}
#define step
var minutes_ = 3 //How many minutes for difficulty to go up
if (global.mode = 1) var minutes_ = 2
global.timeControl = 60 * 60 * (minutes_ * 2) //Time Control

//Hard Mode
if (global.mode == 1) {
with (enemy) {
for(i = 0; i < 5; i++){

			if(alarm_get(i) > 2){
				alarm_set(i, alarm_get(i) - 0.5);
			}
		}

if "convert" not in self {
    _roll = round(random_range(1, 5))
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
}
convert = true;
}
}

with (WeaponChest) {
    if (GameCont.area == 1 || GameCont.area == 101) {
        instance_create(x, y, BigWeaponChest)
        instance_delete(self);
    }
}
}

if global.AnomalyGet = false && instance_exists(Player) && Player.race = "horror"
{
	if ultra_get("horror", 2) = true
	{
		global.AnomalyGet = true
		repeat(2) get_item(item[? "energy"])
	}
}
if global.HardmodeGet = false && instance_exists(Player) && UberCont.hardmode = true && !instance_exists(SpiralCont)
{
	global.HardmodeGet = true
	get_item(item[? "times"])
}

if instance_exists(CharSelect) {
if "debugSet" in self {
global.debug = CharSelect.debugSet
} else {
CharSelect.debugSet = false;
}

with (SmallGenerator) { //You can no longer hit generators <:
    mask_index = mskNone;
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
with (enemy) {
    if distance_to_object(Player) <= 450 {
Close = "true"
    } else {
        Close = "false"
    }
//if an enemy is close to wall, break it

}
var AMOUNT = 0;
with (enemy) if (Close == "true") && (object_index != Maggot) && instance_exists(self) AMOUNT++
var scale = 3 + (round(GameCont.hard / 4) + (5 * GameCont.loops))
var amountNum = 3
if (global.teleporter == true) amountNum = 8 * (GameCont.loops + 1)
with (Player) if ("s_Combat" in self) if AMOUNT <= scale || Player.s_Combat > 0 {
if !instance_exists(Spiral) enemySpawn();
}

with (Player) if "s_Combat" in self && (s_Combat > 0) {
Player.s_Combat--
global.respawn += 1;
enemySpawn();
}

with(FloorMaker) if GameCont.area != 0 && GameCont.area != 2 && GameCont.area != 4 && GameCont.area != 6 && GameCont.area != 100//Make areas larger
		{
		goal = 220
		}

//Difficulty Changes
with (enemy) {
    if ("boost") not in self { //Boost non-boosted enemies based on difficulty
if (global.difficulty == 1) {maxhealth *= 1.3; my_health *= 1.3;if (meleedamage >= 1) meleedamage = round(meleedamage * 1.5); boost = true; }
if (global.difficulty == 2) {maxhealth *= 1.6; my_health *= 1.6;if (meleedamage >= 1) meleedamage *= 2; boost = true; }
if (global.difficulty == 3) {maxhealth *= 1.9; my_health *= 1.9;if (meleedamage >= 1) meleedamage *= 3; boost = true; }
if (global.difficulty == 4) {maxhealth *= 2.2; my_health *= 2.2;if (meleedamage >= 1) meleedamage *= 4; boost = true; }
if (global.difficulty == 5) {maxhealth *= 2.5; my_health *= 2.5;if (meleedamage >= 1) meleedamage *= 5; boost = true; }
if (global.difficulty == 6) {maxhealth *= 2.8; my_health *= 2.8;if (meleedamage >= 1) meleedamage = round(meleedamage * 6.5); boost = true; }
if (global.difficulty == 7) {maxhealth *= 3.1; my_health *= 3.1;if (meleedamage >= 1) meleedamage *= 8; boost = true; }
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


//MAKE TELEPORTER INVINCIBLE
with (SmallGenerator) {
    my_health = 999999999;
}
//INCREASE GLOBAL.RADI
if global.radi < 150 && global.teleporter == true{
    global.radi += (1 * (global.speed));
    global.speed *= 0.9;
}

/*
if global.radi < 50 && global.teleporter == true{
    global.radi++
}
*/
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
if !instance_exists(GenCont) global.time += speed
if global.time >= global.timeControl && global.difficulty != 8 { //increases every 3 minutes //11520
global.time = 0;
global.difficulty++ //difficulty increase
sound_play_pitch(sndDragonStop,1)
}

if global.difficulty == 8 {
    global.time = global.timeControl
}
//DIFFICULTY INCREASING TIMER END

//TELEPORTER EVENT
with (Player) {
    var Gen = instance_nearest(x, y, SmallGenerator)
if !instance_exists(Spiral) && global.teleporter == true && point_in_circle(x, y, Gen.x - 4, Gen.y, global.radi) && global.teleporter == true {
global.chargeF++
if global.chargeF == round(room_speed / 1.5){
global.chargeF = 0;
global.charge += 1 + item_get_count("times") * .5 //CHANGE HOW FAST THE TELEPORTER CHARGES-----------DEFAULT 1
if (GameCont.area = 101) global.charge += 4 //Charge faster in oasis
with instances_matching_le(enemy,"my_health",0){
		if object_index != Maggot {
var roll = round(random_range(1, 10))
if (roll == 10) instance_create(x, y, AmmoPickup)
        }
}
}
if global.charge >= clamp(100 - item_get_count("energy") * 10, 1, 100 - item_get_count("energy") * 10) {
    instance_create(Gen.x, Gen.y, Portal)
    GameCont.hard += 2
    if (GameCont.area = 1) GameCont.subarea = 3;
    //Area choose
    var roll = round(random_range(1, 3))
    global.areaChoice = GameCont.lastarea + 1
    global.subareaChoice = 1

    if (GameCont.area = 106) GameCont.area = 7;
    if (GameCont.area = 106) GameCont.subarea = 1;

    if (GameCont.area = 105) && (roll = 1) GameCont.area = 106
    if (GameCont.area = 105) && (roll != 1) {
    GameCont.area = 5
    GameCont.subarea = 3
    }

    if (GameCont.area = 104) && (roll = 1) GameCont.area = 105
    if (GameCont.area = 104) && (roll != 1) {
    GameCont.area = 4
    GameCont.subarea = 1
    }

    if (GameCont.area = 103) && (roll = 1) GameCont.area = 104
    if (GameCont.area = 103) && (roll != 1) {
    GameCont.area = 3
    GameCont.subarea = 3
    }
    if (GameCont.area = 102) && (roll = 1) GameCont.area = 103
    if (GameCont.area = 102) && (roll != 1) {
    GameCont.area = 2
    GameCont.subarea = 1
    }

    if (GameCont.area = 101) && (roll = 1) GameCont.area = 102
    if (GameCont.area = 101) && (roll != 1) {
    GameCont.area = 1
    GameCont.subarea = 3

    }

    if (GameCont.area = 1) && (roll = 1) GameCont.area = 102
    if (GameCont.area = 2) && (roll = 1) GameCont.area = 103
    if (GameCont.area = 3) && (roll = 1) GameCont.area = 104
    if (GameCont.area = 4) && (roll = 1) GameCont.area = 105
    if (GameCont.area = 5) && (roll = 1) GameCont.area = 106

    global.charge = 0;
    global.teleporter = false;
}


}
}
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
        draw_text_nt(game_width / 2 - 152, 52, "@s10/5/19")
        draw_text_nt(game_width / 2 - 152, 42, "@s            [BIG UPDATE]")
        var draw_y = -5
        draw_text_nt(game_width / 2 - 152, 66 + draw_y, "@s-PATCH NOTES-")
        draw_set_font(fntChat)
        draw_text_nt(game_width / 2 - 152, 72 + draw_y, "@w-More balanced items")

        draw_text_nt(game_width / 2 - 152, 182 + draw_y, "ITEMS: 25 @g+3 NEW ONES")
        draw_text_nt(game_width / 2 - 152, 191 + draw_y, "SHRINES: 8")

    }
    if global.modesMenu == true {
        draw_set_alpha(0.5)
        draw_sprite(global.sprModes, 0, 111, 91)
        draw_sprite(global.sprModes, 1, 111 + (60), 91)
        draw_set_alpha(1)
        draw_x = 121 + (global.mode * 60); draw_y = 79;
        draw_set_color(c_white)
        draw_rectangle(draw_x -53, draw_y-31, draw_x-11, draw_y+11, 0)
    
        draw_sprite(global.sprModes, 0, 110, 90)
        draw_sprite(global.sprModes, 1, 110 + (60), 90)
        draw_set_color(c_white); draw_set_alpha(0.2);
        draw_x = 121; draw_y = 79; if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-30, draw_x-12, draw_y+10) {
        draw_rectangle(draw_x -52, draw_y-30, draw_x-12, draw_y+10, 0)
        draw_set_alpha(1)
        draw_text_nt(60, 169, "@wNormal Mode-")
        draw_text_nt(60, 169, "@s#The default difficulty, for those who #don't wanna die every 2 seconds")
        if button_pressed(i, "fire") {
        global.mode = 0;
        sound_play_pitch(sndClick, 1.2)
        }
        }
        draw_set_alpha(0.2);
        draw_x = 181; draw_y = 79; if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-30, draw_x-12, draw_y+10) {
        draw_rectangle(draw_x -52, draw_y-30, draw_x-12, draw_y+10, 0)
        draw_set_alpha(1)
        draw_text_nt(60, 149, "@wHard Mode-")
        //draw_text_nt(60, 149, "@w#Enemies have more hp, are more #agressive, elites spawn more often,#difficulty scales faster, and #everything sucks")
        draw_text_nt(60, 149, "@s#Enemies have more @rhp@s, are more #@ragressive@s, @yelites@s spawn more often,#@wdifficulty@s scales faster, and #everything sucks")
        if button_pressed(i, "fire") {
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
			y_offset = GameCont.level > 0 ? 20 : 0
  draw_backdrop(_drawX-20, _drawY-60 - y_offset, _drawX+68, _drawY-32 - y_offset, ""); //drawing black box
//DRAWING THE PROGRESS BAR
var BarLength = (global.time * 83) / global.timeControl
draw_X = game_width - 89
draw_Y = 35

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

draw_text_nt(game_width - 87, 38 - y_offset, string(difficultyName));
//DRAWING THE PROGRESS BAR END

//DRAW TIME SYSTEM
draw_set_halign(fa_left)
draw_set_font(fntM)
draw_x = 68
draw_text_nt(game_width- 131 + draw_x, 28 - y_offset, ":");
draw_text_nt(game_width- 151 + draw_x, 28 - y_offset, ":");
draw_set_halign(fa_right)
draw_text_nt(game_width - 110 + draw_x, 28 - y_offset, string(global.seconds));
draw_text_nt(game_width - 130 + draw_x, 28 - y_offset, string(global.minutes));
draw_text_nt(game_width - 149 + draw_x, 28 - y_offset, string(global.hours));
if global.seconds < 10 {
    draw_text_nt(game_width - 118 + draw_x, 28 - y_offset, " 0");
}
if global.minutes < 10 {
    draw_text_nt(game_width - 138 + draw_x, 28 - y_offset, " 0");
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
with(SmallGenerator)
{

//DRAW TELEPORTER CIRCLE
if global.teleporter == true && instance_exists(Player) {

//DRAW TELEPORTER PERCENT
draw_x = 5; draw_y = 20; draw_set_alpha(0.5); draw_set_color(c_black);
draw_rectangle(draw_x+x + 15 , draw_y+y - 9 , x+draw_x-23 ,y+draw_y , false)
draw_set_alpha(1)
if point_in_circle(Player.x, Player.y, x - 4, y, global.radi) && global.teleporter == true {
       // draw_text_nt(x, y + 12, string(global.charge) + "%");
            draw_set_color(c_red); draw_set_alpha(0.15)
            if (global.DarkCircle = true) draw_set_alpha(3)
            draw_circle(x -4, y, global.radi, false);
            draw_set_alpha(1);draw_set_color(c_white);
            draw_text_nt(x + draw_x - 2, y + 12, string(global.charge) + "%");
} else {
   if (global.frame % 10 == 1) {
   draw_set_alpha(0.6)
      } else {
       draw_set_alpha(0.3)
   }
    draw_set_color(c_red);
    draw_circle(x -4, y, global.radi, false);
    draw_set_alpha(1)
    draw_text_nt(x + draw_x - 2, y + 12, string(global.charge) + "%");
    draw_text_nt(x + draw_x - 2, y + 12, (floor(current_frame/4)*30 % 20 ? "@r" + string(global.charge) + "%" : "@w" + string(global.charge) + "%" ));
}
}

if (distance_to_object(Player) <= 8) && (global.teleporter == false)
	{
with Player
{  if(button_pressed(index, "pick")) && global.teleporter == false
{   sound_play(sndLevelUltra) //What to do when the activate teleporter
            global.teleporter = true;
            global.radi += 1;
            repeat(40) with instance_create(x, y, GreenExplosion) damage = 0;
sound_play_music(musBoss8)
negative_ASK = round(random_range(0, 1))
negative = 1;
if (negative_ASK == 0) negative = -1; if (negative_ASK == 1) negative = 1;
var SpawnX = Player.x - (random_range(85, 105) * negative)
var SpawnY = Player.y - (random_range(85, 105) * negative)
if (GameCont.area == 2) var SpawnX = Player.x - (random_range(105, 115) * negative)
if (GameCont.area == 2) var SpawnY = Player.y - (random_range(105, 115) * negative)
//with instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Explosion) {

 //Make Room via Explosion
 var repeatNumber = Player.s_Challenge + 1
            repeat(repeatNumber) if (GameCont.area == 1) { sound_play_music(musBoss1); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, BanditBoss); }
            repeat(repeatNumber)if (GameCont.area == 2) { sound_play_music(musBoss5); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, FrogQueen) }
            repeat(repeatNumber)if (GameCont.area == 3) { sound_play_music(musBoss2); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, ScrapBoss)GameCont.subarea = 3;  }
            repeat(repeatNumber)if (GameCont.area == 4) { sound_play_music(musBoss6); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, HyperCrystal) }
            repeat(repeatNumber)if (GameCont.area == 5) { sound_play_music(musBoss3); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, LilHunter)GameCont.subarea = 3; }
            repeat(repeatNumber)if (GameCont.area == 6) { sound_play_music(musBoss7); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, TechnoMancer) }
            repeat(repeatNumber)if (GameCont.area == 7) { sound_play_music(musBoss4B); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Nothing2)GameCont.subarea = 3;}
            repeat(repeatNumber)if (GameCont.area == 0) { sound_play_music(musBoss8); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Nothing2) }

            repeat(repeatNumber)if (GameCont.area == 101) { sound_play_music(musBoss3); instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, OasisBoss); }
            if (GameCont.area == 102) { sound_play_music(musBoss3);
            repeat(repeatNumber) with instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Turtle) { image_blend = merge_color(c_orange, c_white, 0.3); my_health *= 2; maxhealth *= 2}
            repeat(repeatNumber) with instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Turtle) { image_blend = merge_color(c_red, c_white, 0.3); my_health *= 2; maxhealth *= 2}
            repeat(repeatNumber) with instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Turtle) { image_blend = merge_color(c_blue, c_white, 0.3); my_health *= 2; maxhealth *= 2}
            repeat(repeatNumber) with instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, Turtle) { image_blend = merge_color(c_purple, c_white, 0.3); my_health *= 2; maxhealth *= 2}
            }

            if (GameCont.area == 103) { sound_play_music(mus104);
            repeat(repeatNumber) instance_create(instance_nearest(SpawnX, SpawnY, Floor).x + 16, instance_nearest(SpawnX, SpawnY, Floor).y + 16, SuperFireBaller);
            }

    }
}

        //DRAW ACTIVATE TEXT
        draw_x = 1; draw_y = -17; draw_set_alpha(0.5); draw_set_color(c_black);
        draw_rectangle(draw_x+x + 40 , draw_y+y - 9 , x+draw_x-43 ,y+draw_y , false)
        draw_set_color(c_white); draw_set_alpha(1)
        draw_text_nt(x, y - 25, "@1(keysmall:pick) ACTIVATE");


	}
}

#define add_item(ITEM)																	 return mod_script_call("mod", "items","add_item"      , ITEM)
#define get_item(ITEM)     			                         return mod_script_call("mod", "items","get_item"      , ITEM)
#define item_get_count(ITEM)                             return mod_script_call("mod", "items","item_get_count", ITEM)
#define draw_backdrop(XSTART, YSTART, XEND, YEND, TITLE) return mod_script_call("mod", "items", "draw_backdrop", XSTART, YSTART, XEND, YEND, TITLE)
