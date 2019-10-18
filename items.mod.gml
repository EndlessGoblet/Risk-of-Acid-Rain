#macro item mod_variable_get("mod", "itemlib", "ItemDirectory")

#define init

global.preformanceMode = false //Turn on to avoid lag (recommended)

global.sprItemChest           = sprite_add_weapon("sprites/chests/sprItemChest.png"       ,     8, 8);
global.sprGoldItemChest       = sprite_add_weapon("sprites/chests/sprGoldItemChest.png"   ,    13, 8);
global.sprRustyItemChest      = sprite_add_weapon("sprites/chests/sprRustyItemChest.png"  ,     8, 8);
global.sprLargeItemChest      = sprite_add_weapon("sprites/chests/sprLargeItemChest.png"  ,    12, 8);
global.sprCursedItemChest     = sprite_add_weapon("sprites/chests/sprCursedItemChest.png" ,    11, 8);
global.sprItemChestOpen       = sprite_add("sprites/chests/sprItemChestOpen.png"          , 1,  8, 8);
global.sprGoldItemChestOpen   = sprite_add("sprites/chests/sprGoldItemChestOpen.png"      , 1, 13, 8);
global.sprRustyItemChestOpen  = sprite_add("sprites/chests/sprRustyItemChestOpen.png"     , 1,  8, 8);
global.sprLargeItemChestOpen  = sprite_add("sprites/chests/sprLargeItemChestOpen.png"     , 1, 12, 8);
global.sprCursedItemChestOpen = sprite_add("sprites/chests/sprCursedItemChestOpen.png"    , 1, 11, 8);
global.sprArmor      = sprite_add("sprites/other/sprArmor.png", 3, 9, 9)
global.sprArmorShine = sprite_add_weapon("sprites/other/sprArmorShine.png", 9, 9)

global.sprItems     = sprite_add(    "sprites/items/sprItems.png", 101, 17, 17);
global.sprItemsBack = sprite_add("sprites/items/sprItemsBack.png",   5, 20, 20);

global.sprText = sprite_add("sprites/other/sprText.png", 1, 8, 8);

global.sprBackdropCornerTop     = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAOSURBVBhXY0CA////AwAGCAL++VY/agAAAABJRU5ErkJggg=="     , 1, 0, 0);
global.sprBackdropCornerBottom  = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAADCAIAAAA2iEnWAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAATSURBVBhXYwCC////gygYYGAAAC/lAv7Wwl7SAAAAAElFTkSuQmCC" , 1, 0, 0);
global.sprBackdropHBorder       = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAABCAIAAAB7QOjdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAOSURBVBhXYwCC////AwAGAQL+JDrNNwAAAABJRU5ErkJggg=="     , 1, 0, 0);
global.sprBackdropVBorderTop    = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAADCAIAAADdv/LVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASSURBVBhXYwCB////MzAwMAAAEfoC/jl5h8AAAAAASUVORK5CYII=" , 1, 0, 0);
global.sprBackdropVBorderBottom = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAADCAIAAADdv/LVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAARSURBVBhXY/j//z8DGDAwAAAd7gL+tIt1BwAAAABJRU5ErkJggg==" , 1, 0, 0);
global.sprBackdropFill          = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAANSURBVBhXY2BgYFgFAACvAKujngvGAAAAAElFTkSuQmCC"         , 1, 0, 0);

//global.sprHorrorBall = sprite_add("sprHorrorBall.png", 6, 48, 48);
//global.sprIceExplosion = sprite_add("sprIceExplosion.png", 6, 32, 32);
global.shrineIcons = sprite_add("sprites/shrines/shrineIcons.png", 16, 13, 13)
with(instances_matching(chestprop, "name", "ItemChest")) {
instance_delete(self);
}
global.PlayerItems = [item[? "none"]]
global.GemCoeff = choose(-1, 1)
global.frame = 0;
global.RadiGumdropTimer = 0;
global.RadiatedSnackCounter = 0;
global.itemGet = -4;
global.descriptionTimer = 0;
global.rarity = "COMMON"
global.MaskCounter = 0;
global.BloodCounter = 0;
global.settings = false;
global.PlusItems = 0;
global.hideDes = 0;
global.hurtFloor = false;
global.forceSupport = false;
global.popoChance = 0; //Bandit mask is temporarily disabled item [? "mask"]
global.CommonItems   = [item[? "info"]      , item[? "gumdrop"], item[? "snack"]  , item[? "golden"] , item[? "rubber"]  , item[? "focus"] , item[? "mush"]    , item[? "grease"]     , item[? "boots"] , item[? "chopper"], item[? "locket"]   , item[? "steel"]] //TO DO: None
global.UncommonItems = [item[? "incendiary"], item[? "lens"]   , item[? "bulb"]   , item[? "lust"]   , item[? "nitrogen"], item[? "binky"] , item[? "cryo"]    , item[? "gift"]       , item[? "siphon"], item[? "plate"]  , item[? "firewood"] , item[? "coin"]  , item[? "celesteel"]] //To-Do: coin, Horror In a Bottle --- REMEMBER ITS CURRENTLY NOT IN THE LIST!!!
global.RareItems     = [item[? "artifact"]  , item[? "slosher"], item[? "fungus"] , item[? "wing"]   , item[? "tools"]   , item[? "prize"] , item[? "blessing"], item[? "extractor"]  , item[? "cannon"]] //To-Do: Fern
global.CursedItems   = [item[? "dice"]      , item[? "heater"] , item[? "gem"]] // Todo: dice, heater
global.UniqueItems   = [item[? "energy"]    , item[? "times"]]
//set new level function
if instance_exists(CharSelect) CharSelect.debugSet = false;
if instance_exists(CharSelect) CharSelect.debug = false;
if instance_exists(CharSelect) CharSelect.closeInfo = true;
global.hpBars = true;
global.bossBars = true;
global.doubleChests = false;
global.doubleShrines = false;
//ITEMS
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

#define game_start
Player.reloadspeed_base = Player.reloadspeed;
Player.speed_base       = Player.maxspeed;
Player.accuracy_base    = Player.accuracy;
Player.health_base      = Player.maxhealth;
Player.damage_base      = 1

Player.firewoodCharge = 0;
Player.firewoodKills = 0;
Player.s_Combat = 0;
Player.s_Challenge = 0;

global.PlayerItems = [item[? "none"]]
global.descriptionTimer = 0;
global.settings = false;

Player.armor       = 0;
Player.perma_armor = 0;
Player.shakeText = 0;

//Visuals
Player.fx_celesteel = 0;

#define level_start

var amount = item_get_count("steel");
if amount >= 1
{
    Player.armor += 2 * amount
}

var amount = item_get_count("dice");
if amount >= 1{reorder()}

Player.s_Combat = 0;
Player.s_Challenge = 0;

global.GemCoeff = choose(-1, 1)

//Perfect Prize
if global.hurtFloor = false
{
	var _floorq = ds_list_create(),
	    _i      = 0;
	with Floor // get a list of all "unoccupied" Floors
	{
		if !place_meeting(x, y, prop) && !place_meeting(x, y, chestprop) && !place_meeting(x, y, Wall) && self != FloorExplo
		{
			_floorq[| _i] = self;
			_i++;
		}
	}

	var amount = item_get_count("prize");
	if amount >= 1 repeat(amount)
	{
		ds_list_shuffle(_floorq)
		with obj_create(_floorq[| 0].x - 16, _floorq[| 0].y - 16, "ItemChest") {tag = "gold"; chest_setup(tag); with instance_place(x, y, Wall){instance_delete(self)}}
		ds_list_delete(_floorq, 0)
		ds_list_shuffle(_floorq)
		with obj_create(_floorq[| 0].x - 16, _floorq[| 0].y - 16, "ItemChest") {with instance_place(x, y, Wall){instance_delete(self)}}
	}
	ds_list_destroy(_floorq)
}
global.hurtFloor = false;
//Perfect Prize

//Bandit Mask
var amount = item_get_count("mask")
if (amount >= 1) global.MaskCounter = (300 * amount)
//Bandit Mask

global.descriptionTimer = 0;
//SPAWN OBJECTS ON LEVEL START
var floors = instances_matching(Floor, mod_current, undefined);
if global.doubleChests == false {
var _roll = round(random_range(1, 2))
if (skill_get(28) == 1) _roll = round(random_range(1, 3))
} else {
var _roll = round(random_range(2, 4))
if (skill_get(28) == 1) _roll = round(random_range(2, 6))
}
if (GameCont.area = 100) var _roll = 0;
for(i = 0; i < _roll; i++) {
var my_floor = floors[irandom(array_length(floors) - 1)];
with(my_floor){ obj_create(x - sprite_xoffset + sprite_width / 2, y - sprite_yoffset + sprite_height / 2, "ItemChest" ); }
}
if global.doubleShrines != true {
var _roll = round(random_range(0, 2)) //SHRINE AMOUNTS-------------
} else {
var _roll = round(random_range(2, 4))
}
if (GameCont.area = 100) var _roll = 0;
for(i = 0; i < _roll; i++) {
var my_floor = floors[irandom(array_length(floors) - 1)];
    with instance_create(my_floor.x, my_floor.y, CustomObject) {
    var roll2 = round(random_range(1, 80)) //CHANCES FOR EACH SHRINE----------
    name = "Shrine"
    sprite_index = sprThroneStatue
    open = false
    type = "Pain"
    sprite = 0;
    if (roll2 > 0) && (roll2 <= 10 ) { type = "Gold"; sprite = 0; }
    if (roll2 > 10) && (roll2 <= 20 ) {type = "Pain"; sprite = 1; }
    if (roll2 > 20) && (roll2 <= 30 ) {type = "Combat"; sprite = 2; }
    if (roll2 > 30) && (roll2 <= 40 ) {type = "Challenge"; sprite = 3; }
    if (roll2 > 40) && (roll2 <= 50 ) {type = "Balance"; sprite = 4; }
    if (roll2 > 50) && (roll2 <= 60) {type = "Gold"; sprite = 0; }
    if (roll2 > 50) && (roll2 <= 60) && (GameCont.area > 2) && (GameCont.area != 101) && (GameCont.area != 102) {type = "Order"; sprite = 5; }
    if (roll2 > 60) && (roll2 <= 70 ) {type = "Printing"; sprite = 6; }
    if (roll2 > 70) && (roll2 <= 80 ) {type = "Crowns"; sprite = 7; }
    if (roll2 > 80) && (roll2 <= 90 ) {type = "Transport"; sprite = 8; }
    if (roll2 > 90) && (roll2 <= 100 ) {type = "Sacrifice"; sprite = 9; }
    if (roll2 > 100) && (roll2 <= 110 ) {type = "Carnage"; sprite = 13; }
    if (roll2 > 110) && (roll2 <= 120 ) {type = "Reroll"; sprite = 15; }
		if type = "Printing"{type = "Gold";sprite = 0} // remove this once printing code is fixed
    if type = "Printing" {
    var item = round(random_range(0, array_length(global.CommonItems) - 1))
    itemPrint = item
    }
    //if (roll2 > 120) && (roll2 <= 130) type = "Gold"
    //if (roll2 > 130) && (roll2 <= 140 ) type = "Gold"
    //if (roll2 > 140) && (roll2 <= 150 ) type = "Gold"
    //if (roll2 > 150) && (roll2 <= 160 ) type = "Gold"

}
with(instances_matching(CustomObject, "name", "Shrine")) {
if distance_to_object(Wall) <= 5 && "boom" not in self {
    with instance_create(x, y, GreenExplosion) { damage = 0; }
    boom = true;
}
}



}
#define draw
//HEALTH BARS
if global.hpBars == true {
with (enemy) {
    if ("tag" not in self) && object_index != RavenFly && object_index != Mimic && object_index != SuperMimic {
    var x_ = x; var y_ = y + 10
    var maxy = maxhealth; if (maxy > 50) maxy = 50; if (maxy < 10) maxy = 10; //Maxy is maxhealth
    var curry = my_health; if (curry < 0) curry = 0; //Curry is my_health
    var barLength = curry * (maxy) / maxhealth
    draw_set_color(c_black);draw_rectangle( ((maxy / 2) * -1) +x_, (3) +y_, (maxy / 2) + x_, (0) + y_, false)
    draw_set_color(c_black);draw_rectangle( ((maxy / 2) * -1 + 1) +x_, (2) +y_, (maxy / 2 - 1) + x_, (1) + y_, false)
    draw_set_color(c_red);draw_rectangle( ((0) * -1 + 1 - (maxy / 2)) +x_, (2) +y_, (barLength - 1) + x_ - (maxy / 2), (1) + y_, false) //health * length / maxhealth
}}}


var amount = item_get_count("nitrogen"); //LIQUID NITROGEN
if amount >= 1 && instance_exists(Player){
var light = (45 + (amount * 7))
if (global.preformanceMode == true) draw_set_alpha(1); draw_set_color(c_blue)
if (global.preformanceMode == false) draw_set_alpha(0.15); draw_set_color(c_blue)
if (global.preformanceMode == true) draw_circle(Player.x, Player.y, light, 1);
if (global.preformanceMode == false) draw_circle(Player.x, Player.y, light, 0);

with (projectile) { if distance_to_object(Player) <= (light) && point_in_circle(x, y, Player.x, Player.y, light) && team != 2 {
speed *= 0.975;
if (speed <= 0.1) instance_destroy()
}}
draw_set_alpha(1)
}



var amount = item_get_count("bulb"); //PRE WAR LIGHT BULBSSSSSS---------ouch ooch the lag-----------
if amount >= 1 && instance_exists(Player)
{
  if (global.preformanceMode == true) draw_set_color(c_white); draw_set_alpha(0.8)
  if (global.preformanceMode == false) draw_set_color(c_white); draw_set_alpha(0.2)
  if (global.preformanceMode == false) var light = 25 + (amount * 10.5) + random(2)
  if (global.preformanceMode == true) var light = 25 + (amount * 10.5)
  if (global.preformanceMode == true) draw_circle(Player.x, Player.y, light, 1);
  if (global.preformanceMode == false) draw_circle(Player.x, Player.y, light, 0);
  draw_set_color(c_white); draw_set_alpha(1)
  with (enemy)
	{
    if distance_to_object(Player) <= light && point_in_circle(x, y, Player.x, Player.y, light)
		{
    	my_health -= 0.1 + (amount * 0.05) + (GameCont.level * 0.02)
    }
	}
}

var amount = item_get_count("mask") {
    if amount >= 1 && global.MaskCounter >= 0 {
    draw_set_halign(fa_center)
    var count = round(global.MaskCounter / room_speed)
if instance_exists(Player) && global.MaskCounter > 0 draw_text_nt(Player.x, Player.y + 10, string(count));
}}
//Shrine
with(instances_matching(CustomObject, "name", "Shrine")) {
if distance_to_object(Player) <= 2 && open == false {
draw_x = 0; draw_y = 17; draw_set_alpha(0.5); draw_set_color(c_black);
draw_rectangle(draw_x+x + 47 , draw_y+y - 9 , x+draw_x-50 ,y+draw_y , false)
draw_x = 0; draw_y = +28;
draw_rectangle(draw_x+x + 47 , draw_y+y - 9 , x+draw_x-50 ,y+draw_y , false)
        draw_set_color(c_white); draw_set_alpha(1)
        draw_set_halign(fa_center)
        draw_text_nt(x, y + 9, "@1(keysmall:pick) " + (type));
        if (type == "Gold")draw_text_nt(x, y+20, "@g[" + string(GameCont.level * 40) + "@g Rads]"); // DONE
        if (type == "Pain")draw_text_nt(x, y+20, "@r[50% HP]" + "@s [" + string(floor(Player.maxhealth / 2)) + "]"); // DONE
        if (type == "Combat") draw_text_nt(x, y+20, "FIGHT!!");  // DONE
        if (type == "Challenge") draw_text_nt(x, y+20, "X2 BOSSES"); // DONE
        if (type == "Balance") draw_text_nt(x, y+20, "[@y-AMMO@w]");
        if (type == "Order") draw_text_nt(x, y+20, "@qAll @qinto @qone");
        if (type == "Printing") draw_text_nt(x, y+20, "*" + string(global.CommonItems[itemPrint].name) + "*");
        if (type == "Crowns") draw_text_nt(x, y+20, "here we go");
        if (type == "Transport") draw_text_nt(x, y+20, "Let's leave");
        if (type == "Sacrifice") draw_text_nt(x, y+20, "[Primary Gun]");
        if (type == "Legends") draw_text_nt(x, y+20, "[2 ITEMS]");
        if (type == "Curse") draw_text_nt(x, y+20, "[FREE?]");
        if (type == "Unknown") draw_text_nt(x, y+20, "[???]");
        if (type == "Carnage") draw_text_nt(x, y+20, "[@r1 MAX HP@w]");
        if (type == "Gift") draw_text_nt(x, y+20, "emptiness");
        if (type == "Reroll") draw_text_nt(x, y+20, "Reroll Gun");
        if(button_pressed(Player.index, "pick")) { //When they open it
if (type == "Gold") { //GOLD SHRINE
    if GameCont.rad >= (GameCont.level * 40) {
GameCont.rad -= (GameCont.level * 40)
sound_play_pitch(sndGoldUnlock, 1)
sound_play_pitch(sndSnowTankHurt, 1)
obj_create(x + 8, y + 8, "ItemChest")
with instance_create(x, y, GreenExplosion) { damage = 0; mask_index = mskNone; }
instance_destroy();
global.popoChance = 75
    popoSpawn();
break;
    } else {
with instance_create(Player.x, Player.y, PopupText) {
    text = "NOT ENOUGH RADS"
    time = 5
}
sound_play_pitch(sprProtoStatueDone, 0.7)
break;
    }
}
if (type == "Pain") { //PAIN SHRINE--------------------------------
Player.my_health -= floor(Player.maxhealth / 2)
with instance_create(x, y, RadChest) { my_health = 0; size = 1; raddrop = (GameCont.radmaxextra)}
global.popoChance = 10
    popoSpawn();
    break;
}
if (type == "Combat") { //COMBAT SHRINE--------------------------------------
with (Player) s_Combat += 18;
with instance_create(x, y, GreenExplosion) { damage = 0; mask_index = mskNone; }
instance_destroy();
with instance_create(Player.x, Player.y, PopupText) {
    text = "LET THE FIGHT BEGIN"
    time = 5
    global.popoChance = 40
    popoSpawn();
}
sound_play_pitch(sndLevelUp, 1)
wait(5) sound_play_pitch(sndMenuRevolver, 0.8)
break;
}
if (type == "Challenge") { //CHALLENGE SHRINE------------------------------
with (Player) s_Challenge += 1;
sound_play_pitch(sndLevelUltra, 1)
with instance_create(x, y, GreenExplosion) { damage = 0; mask_index = mskNone; }
obj_create(x + 8, y + 8, "ItemChest")
instance_destroy();
with instance_create(Player.x, Player.y, PopupText) {
    text = "CHALLENGE ACCEPTED"
    time = 5
    global.popoChance = 80
    popoSpawn();
}
break;
}
if (type == "Balance") { //BALANCE SHRINE---------------------
    var WepType = weapon_get_type(Player.wep)
    if (WepType != 0) && (WepType != 1) && (Player.ammo[WepType] > 20) { Player.ammo[WepType] -= 20; sound_play_pitch(sndHPPickup, 1); Player.my_health += (round(Player.maxhealth / 4)) break; }
    if (WepType != 0) && (WepType = 1) && (Player.ammo[WepType] > 50) { Player.ammo[WepType] -= 50; sound_play_pitch(sndHPPickup, 1); Player.my_health += (round(Player.maxhealth / 4)) break; }
    if (WepType = 0) sound_play_pitch(sprProtoStatueDone, 1)
    with instance_create(Player.x, Player.y, PopupText) {
    var typeText = "ERROR"
    var amountText = 20; if (WepType == 1) amountText = 50;
    if (WepType == 1) typeText = "Bullets"; if (WepType == 2) typeText = "Shells"; if (WepType == 3) typeText = "Bolts"; if (WepType == 4) typeText = "EXPLOSIVES"; if (WepType == 5) typeText = "ENERGY";
    var check = false;
    if (WepType == 1) && (Player.ammo[WepType] > 50) var check = true;
    if (WepType != 1) && (Player.ammo[WepType] > 20) var check = true;
    if check == true && WepType != 0 {
        text = "-" + string(amountText) + " " + string(typeText)
        global.popoChance = 10
    popoSpawn();

        } else {
            var _roll = round(random_range(1, 4))
           if (_roll = 1) text = "NO"
           if (_roll = 2) text = "NAH"
           if (_roll = 3) text = "NOPE"
           if (_roll = 4) text = "NU"
           sound_play_pitch(sprProtoStatueDone, 1)
            }
    time = 10
}

    break;
}

if (type == "Crowns") {
    instance_create(Player.x, Player.y, Portal)
    GameCont.area = 100;
    with instance_create(x,y,GreenExplosion) { damage = 0; mask_index = mskNone; }
    wait(1);
    instance_destroy()
    global.popoChance = 99
    popoSpawn();
    break;
}

if (type == "Order")
{
  reorder();
	sound_play_pitch(sndLilHunterAppear, 0.5)
	with instance_create(x,y,GreenExplosion) { damage = 0; mask_index = mskNone}
	with instance_create(Player.x, Player.y, PopupText)
	{
	  text = "@qIT @qIS @qDONE"
	  time = 20
	}
	instance_destroy()
	exit
}

if (type == "Printing") {
	if array_length(global.PlayerItems) > 1 {
	  print_array = []
		for (var i = 0, j = 0, iLen = array_length(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 0{print_array[j] = global.PlayerItems[i];j++}};
		var _roll = print_array[random_range(0, array_length(print_array) -1)];
		_roll.count--
		get_item(itemPrint)
    if _roll == global.CommonItems[itemPrint] {
    with instance_create(x,y,GreenExplosion) { damage = 0; mask_index = mskNone; }
    instance_destroy()
    with instance_create(Player.x, Player.y, PopupText) {
    text = "*SNAP*"
    time = 10
}
global.popoChance = 50
    popoSpawn();
break;
    } else {
   // var item = global.PlayerItems[roll]
with instance_create(Player.x, Player.y, PopupText) {
    text = "-" + roll.name
    time = 20
}
sound_play_pitch(sndCrownProtection, 1)
global.popoChance = 10
    popoSpawn();
    }
    } else {
    with instance_create(Player.x, Player.y, PopupText) {
    var _roll = round(random_range(1, 5))
    if (_roll == 1) text = "GO GET ITEMS"
    if (_roll == 2) text = "TOO POOR"
    if (_roll == 3) text = "FEED ME"
    if (_roll == 4) text = "NO"
    if (_roll == 5) text = "NEED ITEMS"
    sound_play_pitch(sprProtoStatueDone, 1)
    time = 10
}
    }
}

}
}
draw_sprite_ext(global.shrineIcons, sprite, x + 7, y-20, 1, 1, 0, c_black, 0.5 );
draw_sprite_ext(global.shrineIcons, sprite, x + 5, y-20, 1, 1, 0, c_black, 0.5 );
draw_sprite_ext(global.shrineIcons, sprite, x + 6, y-21, 1, 1, 0, c_black, 0.5 );
draw_sprite_ext(global.shrineIcons, sprite, x + 6, y-19, 1, 1, 0, c_black, 0.5 );
draw_sprite(global.shrineIcons, sprite, x + 6, y-20)
}

#define obj_create(_x, _y, obj_name)
var _obj = -4
switch(obj_name) {
	case "ItemChest":
		_obj = instance_create(_x, _y, chestprop)
		with(_obj)
		{
			name = "ItemChest";
			spr_shadow = shd24;
			spr_open = global.sprItemChestOpen;
			sprite_index = global.sprItemChest;
			if roll(1) tag = "gold" else tag = "none" // 1% chance to turn regular chests into gold chests
			if tag = "none" && roll(4) tag = "large"
			chest_setup(tag)
			on_open = itemchest_open;
		}
		return _obj;
}

switch(obj_name) {
	case "Shrine":
		with instance_create(_x, _y, CustomObject) {
            //spr_shadow = shd32;
			image_speed = 0.2;
            name = "Shrine"
            sprite_index = sprThroneStatue;
		}
	break;
}
#define get_item(ITEM)
global.itemGet = ITEM
global.descriptionTimer = room_speed * 4
if ITEM = item[? "gift"] repeat(2)
{
	get_item(global.CommonItems[round(random_range(0, array_length_1d(global.CommonItems) - 1))])
}
if ITEM = item[? "dice"] repeat(2)
{
	get_item(global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))])
}
if ITEM = item[? "celesteel"]
{
    Player.armor += 5
}
if ITEM = item[? "cannon"]
{
    Player.armor += 8
}
if ITEM = item[? "heater"]
{
	Player.health_base = round(max(Player.health_base * .75, 1))
	Player.perma_armor += 2
}
add_item(ITEM)

#define step
//Armor Mechanic
//with (Player) if nexthurt == current_frame+5 && !instance_exists(Portal) && instance_exists(Player) { //When you get hit
with (Player) if my_health < lsthealth
{
	var damageTaken = (Player.lsthealth - Player.my_health),
	    _ord        = damageTaken
	damageTaken = clamp(damageTaken - perma_armor, 1, damageTaken)
	damageTaken = clamp(damageTaken - armor, 0, damageTaken)
	Player.my_health += (_ord - damageTaken)
	lsthealth = my_health
  if !roll(((10 * item_get_count("celesteel")) / (item_get_count("celesteel") / 10 + 1))) && Player.armor > 0
	{
		Player.fx_steel = 1
    Player.armor--
    sound_play_pitch(sndSwapPistol, 2)
		Player.shakeText += (room_speed / 10)
  }
	else Player.fx_celesteel = 6.5
}

with instances_matching(enemy, "walled", true)
{
	if speed> 0 speed = 0
	x -= hspeed
	y -= vspeed
	with instances_matching_ne(projectile, "team", 2)instance_delete(self)
}
// chest step
with instances_matching(chestprop, "name", "ItemChest"){
	 if "tag" in self switch tag
	 {
		 case "gold"   : if irandom(19) = 0 with instance_create( x+random_range(-8, 8), y+random_range(-13,13), CaveSparkle) depth = other.depth - 1; break;
		 case "cursed" : if irandom( 4) = 0 instance_create(x+random_range(-5, 5), y+random_range( -8, 8), Curse); break;
		 case "item"   : image_index  = item_index.spr_index; y -= sin(current_frame / 10) / 4 / (room_speed / 30); spr_shadow_y  += sin(current_frame / 10) / 4 / (room_speed / 30); break;
	 }

	 if place_meeting(x, y, Player) || place_meeting(x, y, PortalShock) || instance_exists(BigPortal){
				// run open code
			 script_execute(on_open)

				// fx
			 instance_create(x, y, FXChestOpen);
			 with instance_create(x, y, ChestOpen) sprite_index = other.spr_open;

			 instance_delete(id);
	 }
}

if instance_exists(CharSelect) && "closeSettings" not in self {
    CharSelect.closeSettings = false;
}
if instance_exists(CharSelect) && "closeInfo" not in self {
    CharSelect.closeInfo = false;
}
if instance_exists(CharSelect) && (CharSelect.closeSettings == true) {
    global.settings = false;
    CharSelect.closeSettings = false;
}


if (global.preformanceMode == true) {
    if instance_number(Effect) > 75 {
        with instance_find(Effect, instance_number(Effect) - 1) instance_delete(self);
    }
}
with (Player) if (my_health > maxhealth) my_health = maxhealth
with (Player) if round(my_health)
//DEBUG
Player.debug2 = array_length_1d(global.PlayerItems) - 1

//Check if hurt this floor--------
with (Player) if my_health < lsthealth {
global.hurtFloor = true;
}
//Cheats--------------------------------------------------------------------------------------------------------------------------------------------------------
with (Player) {
if(button_pressed(index, "horn")) {
	if (Player.debug == true) || string_lower(player_get_alias(0)) = "karmelyth" //I don't know if you know this but it still happens when I press B too // yeah because you set Player.debug to true is my guess
	{
		/*with obj_create(mouse_x, mouse_y, "ItemChest")
		{
			tag = "gold"
			chest_setup(tag)
		}
		with obj_create(mouse_x, mouse_y, "ItemChest")
		{
			tag = "rusty"
			chest_setup(tag)
		}
		with obj_create(mouse_x, mouse_y, "ItemChest")
		{
			tag = "large"
			chest_setup(tag)
		}
		with obj_create(mouse_x, mouse_y, "ItemChest")
		{
			tag = "cursed"
			chest_setup(tag)
		}
		obj_create(mouse_x, mouse_y, "ItemChest")*/
		with obj_create(mouse_x, mouse_y, "ItemChest")
		{
			tag = "item"
			item_index = choose(item[? "celesteel"], item[? "steel"], item[? "heater"],  item[? "energy"],  item[? "prize"])
			chest_setup(tag)
		}
	}
      //get_item(item[? "chopper"])
	}
}
//Timer
global.frame += current_time_scale; if (global.frame == 60) global.frame = 0;
//WHAT DO ITEMS DO YOU MAY ASK???

var extra_reload    = 0,
    extra_speed     = 0,
		extra_health = 0,
		extra_accuracy  = 0,
		extra_damage    = 0; // this one is a multiplier

//inside information (more damage to IDPD and they drop more stuff)
var amount = item_get_count("info");
var IDPD = [Grunt, Shielder, Inspector, EliteGrunt, EliteShielder, EliteInspector, Van, Last]
for (var i = 0, iLen = array_length_1d(IDPD); i < iLen; i++) {
var choice = IDPD[i]
if instance_exists(choice) {
with (choice) {
    if amount >= 1 {
    if "effect" not in self {
    my_health *= (1 - (amount * 0.2))
    effect = true;
    }}}}
with instances_matching_le(choice,"my_health",0){
    if roll(10 * amount) { instance_create(Player.x, Player.y, AmmoPickup); } }
}
//inside information (more damage to IDPD and they drop more stuff)

//radi gumdrop (heal overtime)
var amount = item_get_count("gumdrop");
if amount >= 1 {
    with (Player) {
        var _x = (amount * 2); if (_x >= 15) _x = 15;
if (global.frame == 59) global.RadiGumdropTimer += maxhealth / (48 - (_x * 2)) // <--- Change this number (32) to be higher to make regen slower
if (floor(global.RadiGumdropTimer) >= 1) {
if (my_health < maxhealth) my_health += round(global.RadiGumdropTimer)
if (my_health > maxhealth) my_health = maxhealth
 global.RadiGumdropTimer = 0;
}}}
//radi gumdrop (heal overtime)

//Mechanical Lens (Homing)
var amount = item_get_count("lens");
if amount >= 1
{
	with instances_matching(projectile, "team", 2)
	{
    if object_index != Laser && object_index != Lightning && instance_exists(Player)
		{
    	if (global.forceSupport == true) || object_index != CustomProjectile
			{
       	if "slowed" not in self
			 	{
          speed /= 1.5;
          slowed = 1;
        }
        if distance_to_object(enemy) <= (16 + (4 * amount))
				{
        	near = instance_nearest(x, y, enemy);
       		if(instance_exists(near))
					{
	 					var _s = speed
   					motion_add(point_direction(x, y, near.x, near.y), speed / clamp(8 - amount / 3, 2, 8));
   					speed = _s;
   					image_angle = direction;
					}
				}
			}
		}
	}
}
//Mechanical Lens (Homing

//Golden Shots (random crits)
var amount = item_get_count("golden");
if amount >= 1
{
	with instances_matching(projectile, "team", 2)
	{
		if roll(10 * amount) && "crit" not in self
		{
				image_xscale += .25
		    image_yscale += .25
		    extra_damage += 1
		    crit = 1;
		    image_blend = merge_color(c_red, c_white, 0.3)
		}
	 else {crit = 1}
	}
}
//Golden Shots (random crits)

//Radiated Snack
var amount = item_get_count("snack");
if amount >= 1 {
with (Rad) {
if "Touched" not in self {
if distance_to_object(Player) <= 8 {
Touched = true;
with (Player) global.RadiatedSnackCounter += maxhealth / (250 / amount)
if floor(global.RadiatedSnackCounter) >= 1 {
   with (Player) if (my_health < maxhealth) my_health += round(global.RadiatedSnackCounter)
with (Player) if (my_health > maxhealth) my_health = maxhealth
global.RadiatedSnackCounter = 0;
}}}}}
//Radiated Snack

//Rubber Projectile
var amount = item_get_count("rubber");
if amount >= 1
{
	with instances_matching(projectile, "team", 2)
	{
		if "extra_bounce" not in self extra_bounce = (amount + 1)
	 }
}
//Rubber Projectile

//Bandit Mask
var amount = item_get_count("mask");
with (Player)
{
  if global.MaskCounter > 0
	{
	  if instance_exists(enemy) with enemy if "walled" not in self
		{
			walled = true
		}
	  image_alpha = 0.5
	  if(button_pressed(Player.index, "fire")) || (button_pressed(Player.index, "spec"))
		{
    	global.MaskCounter -= room_speed * 2;
  	}
    global.MaskCounter--
  }
	else
	{
    team = 2;
    image_alpha = 1
  }
}
//Bandit Mask

//Ancient Armor Plate
var amount = item_get_count("plate");
if amount >= 1
{
  with (enemy)
	{
    if "AncientArmorPlate" not in self
		{
      meleedamage = round(meleedamage / (amount * 1.5))
      AncientArmorPlate = true;
    }
	}
}
//Ancient Armor Plate

//Pre-War Light Bulb
//Check #define draw
//Pre-War Light Bulb

//Incendiary Rounds
var amount = item_get_count("incendiary");
if amount >= 1
{
  with (enemy)
	{
    if nexthurt == current_frame+5 && !instance_exists(Portal)
		{
			OnFire = true
    }

    if "OnFire" in self
		{
    	image_blend = merge_color(c_orange, c_white, 0.3)
    	if roll(10) instance_create(x, y, Debris) my_health -= (0.04 * amount)
    }
		else{image_blend = merge_color(c_orange, c_white, 1)}
	}
	with (projectile)
	{
	  with (creator) if "OnFire" == true
		{
	    if "FlameBoost" not in self
			{
	      speed *= 10
	      FlameBoost = true;
	    }
	  }
	}
}
//Incendiary Rounds

//Occult Artifact
var amount = item_get_count("artifact");
if amount >= 1
{
	with instances_matching_le(enemy,"my_health",0)
	{
		if instance_exists(Player) if roll(10 + 15 * amount) repeat(size + 1) with instance_create(x + random_range(-5, 5), y + random_range(-5, 5), MeatExplosion) team = Player.team
	}
}
//Occult Artifact


//Slosher
var amount = item_get_count("slosher");
if amount >= 1 {
    with instances_matching(projectile, "team", 2) {
        if "sloshed" not in self {
            var direct = direction
            repeat(amount) with instance_create(x, y, EnemyBullet2) {
            sacred = true;
						damage = 2
            motion_set(direct + random_range(-50, 50),16)
			image_angle = direction
						friction = random_range(1.5, 1.65)
            var roll2 = random_range(0.5, 1)
            image_xscale = roll2
            image_yscale = roll2
			damage = damage / 1.5;
			team = 2;
			sloshed = true;
            }

        sloshed = true;
        }
    }
}
//Slosher


//Growth Fungus
var amount = item_get_count("fungus");
if amount >= 1 {
    with instances_matching(projectile, "team", 2) {
        if "growth" not in self && object_index != Lightning {
        image_xscale = 1 + (amount * .2)
        image_yscale = 1 + (amount * .2)
        damage += amount * .5
				speed *= 1.1
        growth = true;
        }}
}
//Growth Fungus

//R-Wing
var amount = item_get_count("wing");
if amount >= 1 {
with (projectile) {
    if team != 2 && "RWING" not in self {
    with (Player) var wing = (maxhealth * (.9 - amount * .15) )
    if (damage >= wing) damage = ceil(wing)
    RWING = true;
    }
}
}
//R-Wing

//Sabotage Tools
var amount = item_get_count("tools");
if amount >= 1 {
with (projectile) {
    if "jam" not in self && team != 2 {
    if roll(15 * amount) instance_destroy(); break;
    }
    jam = true;
}
}

//Sabotage Tools



//Bloody Lust
var amount = item_get_count("lust");
if amount >= 1 {
with (Player) if nexthurt == current_frame+5 && !instance_exists(Portal){
global.BloodCounter = (120 * amount)
}
if global.BloodCounter > 0 {
    if (global.BloodCounter != 1) with (Player) image_blend = merge_color(c_red, c_white, 0.3)
    if (global.BloodCounter != 1) with instances_matching(projectile, "team", 2) damage *= (1 + (amount * 0.2))
    global.BloodCounter--
}
if (global.BloodCounter = 1) {
 with (Player) image_blend = merge_color(c_red, c_white, 1)
}
}

//Bloody Lust

//Liquid Nitrogen
//Check define draw
//Liquid Nitrogen

//Focus
var amount = item_get_count("focus");
if amount >= 1 {
    with (projectile) { if team != 2 && "Focus" not in self{
    image_xscale = clamp(image_xscale - (amount * 0.05), .6, image_xscale - (amount * 0.05))
    image_yscale = clamp(image_yscale - (amount * 0.05), .6, image_yscale - (amount * 0.05))
    Focus = true;
    }}
}
//Focus

//Binky
var amount = item_get_count("binky");
if amount >= 1
{
	with (enemy) if "Shrink" not in self
	{
    var chance = roll(6 + 8 * amount)
    Shrink = true
    if chance == 1
		{
	    image_xscale /= 1.5
	    image_yscale /= 1.5
	    my_health /= 2.5
	    maxhealth /= 2.5
    }
	}
}
//Binky

//Bullet Grease
var amount = item_get_count("grease");
if amount >= 1 {
	if instance_exists(Player) with instances_matching(projectile, "team", Player.team)
	{
		if "grease" not in self
		{
			friction /= (1 + (.7 * amount))
			grease = true
		}
	}
}
//Bullet Grease

//Cryo Rounds
var amount = item_get_count("cryo");
if amount >= 1 {
with (enemy) {
    if nexthurt == current_frame+5 && !instance_exists(Portal){
freezeTime = 0;
if object_index != BanditBoss && object_index != ScrapBoss && object_index != OasisBoss && object_index != Nothing && object_index != Nothing2 && object_index != HyperCrystal && object_index != FrogQueen && object_index != TechnoMancer && object_index != LilHunter {
    freezeTime = 25 * amount }
for(i = 0; i < 10; i++){
alarm_set(i,alarm_get(i) + (freezeTime / 2))
}}
if ("freezeTime") in self {
if (freezeTime > 1) freezeTime--
if freezeTime > 0 {
f_var = freezeTime * 2; if f_var > 100 f_var = 100
image_blend = merge_color(c_blue, c_white, (1 - (f_var / 100)))
}}
}
}
//Cryo Rounds

//Forgotten Gift
    //Check get_item()
//Forgotten Gift

//Mini-Mush
var amount = item_get_count("mush");
if amount >= 1 {
with (Player) {
    var _size = amount * 0.075; if (_size > .6) _size = .6
    image_xscale = 1 - _size
    image_yscale = 1 - _size
		extra_speed += .15
}
}
//Mini-Mush

//Gun God's Blessing
var amount = item_get_count("blessing");
if amount >= 1 {
    with (projectile) if "blessed" not in self && "sacred" not in self && team = 2{
				if roll((1 - 1/(.25 * amount + 1))*100) with instance_create(x,y,object_index){ // hyperbolic item stacking
			motion_set(other.direction,other.speed*1.2)
			image_angle = direction
			//damage = originalDamage;
			team = other.team;
			sprite_index = other.sprite_index
            sound_play_pitch(sndPopPop, 1)
			blessed = 1}
            blessed = 1;
}
}
//Gun God's Blessing

//Gun Boots
var amount = item_get_count("boots");
if amount >= 1 && instance_exists(Player) {
    with (Player) if "GunBoots" not in self {
        GunBoots = 0;
    }
    if (Player.race = "Skeleton") var speedLimit = 2.55
    var speedLimit = 3.55
if (Player.speed) > speedLimit {
    Player.GunBoots += (room_speed / 60)
    if Player.GunBoots >= (30 / amount) {
        Player.GunBoots = 0;
        sound_play_pitch(sndPopgun, random_range(0.8, 1.2))
    with instance_create(Player.x, Player.y, HeavyBullet) {
        direction = Player.direction + 180
        motion_set(Player.direction + 180,10)
        image_xscale = 0.75
        image_yscale = 0.75
        image_angle = direction
        team = Player.team;
    }}
}
}
//Gun Boots

//Teleporter Siphon
var amount = item_get_count("siphon");
if amount >= 1 && instance_exists(Player) {
	if instance_exists(SmallGenerator) var _gen = instance_nearest(Player.x, Player.y, SmallGenerator)
	if distance_to_object(SmallGenerator) < 150 && mod_variable_get("mod", "main", "teleporter")  = true
	extra_reload += .1 + (.2 * amount)
}
//Teleporter Siphon

//Firewood
var amount = item_get_count("firewood");
if amount >= 1 && instance_exists(Player){
    with (Player) if "firewoodCharge" not in self { Player.firewoodCharge = 0 }
    with (Player) if "firewoodKills" not in self { Player.firewoodKills = 0 }
with instances_matching_le(enemy,"my_health",0){
Player.firewoodCharge += (amount)
Player.firewoodKills++
}
with (Player) if nexthurt == current_frame+5 && !instance_exists(Portal) {
repeat(Player.firewoodCharge) with instance_create(Player.x, Player.y, FlameShell) {
direction = random_range(1, 360)
speed = random_range(10, 15)
image_angle = direction
team = 2;
Player.firewoodCharge = 0;
}
}
if (Player.firewoodKills) >= 10 {
    with instance_create(Player.x, Player.y, PopupText) {
    text = "@(sprGroundFlame)" + "@y " + string(Player.firewoodCharge)
    time = 5
}
    Player.firewoodKills = 0;
}
}
//Firewood

//Ammo Extractor
var amount = item_get_count("extractor");
if amount >= 1 {
	 if instance_exists(Player) with instances_matching_le(enemy,"my_health",0){if Player.infammo < room_speed * 1 Player.infammo += room_speed * (size + .5) * .5}
}
//Ammo Extractor

//Chopper
var amount = item_get_count("chopper");
if amount >= 1
{
  with (Player)
	{
		var Near = instance_nearest(x, y, enemy)
		if distance_to_object(Near) <= (16 + amount)
		{
      if current_frame mod max(room_speed * 3 - amount * 3, 1) = 0 with instance_create(x, y, Shank)
			{
	        motion_add(point_direction(x, y, Near.x, Near.y) + random_range(-5, 5), 4 + skill_get(mut_long_arms) * 2);
	        image_angle = direction
	        team = 2;
					damage =  6
      }
		}
	}
}
//Chopper

//Broken Locket
var amount = item_get_count("locket");
if amount >= 1
{
	with instances_matching(enemy, "my_health", 0)
	{
		if roll(7 + 2 * amount) // 7% base chance to drop chest + 2% per stack
		{
			with obj_create(x, y, "ItemChest")
			{
				tag = "rusty";
				chest_setup(tag)
			}
		}
	}
}
//Broken Locket

//Scrap Cannon
var amount = item_get_count("cannon");
if amount >= 1 && instance_exists(Player)
{
	extra_damage += Player.armor * 2.5 * amount
}
//Scrap Cannon

//Stat changes
if instance_exists(Player)
{
	Player.reloadspeed = Player.reloadspeed_base + extra_reload    + (skill_get(mut_stress) * (1 - Player.my_health/Player.maxhealth)) + ultra_get(char_venuz, 1)   * .4
	Player.maxspeed    = Player.speed_base       + extra_speed     + (skill_get(mut_extra_feet) * .5)
	Player.maxhealth   = Player.health_base      + extra_health    + (skill_get(mut_rhino_skin) *  4)                                  + ultra_get(char_crystal, 1) *  6
	with instances_matching(projectile, "team", Player.team)
	{
		damage *= Player.damage_base + extra_damage
	}
}

with instances_matching(EnemyBullet2, "sloshed", true){if speed <= friction instance_destroy()}

#define draw_gui
draw_armor()
//Drawing Boss Health Bar
if global.bossBars == true {
var Boss = [BanditBoss, HyperCrystal, FrogQueen, OasisBoss, LilHunter, Nothing2, Nothing, ScrapBoss, TechnoMancer]
for(var i = 0; i < array_length_1d(Boss); i += 1)
if instance_exists(Boss[i]) && instance_exists(Player) {
    draw_set_color(c_white)
draw_set_alpha(1);
draw_X = -154 + game_width / 2
draw_Y = 220
draw_set_color(c_black);draw_rectangle(-1 + draw_X, 13 + draw_Y, (308) + draw_X, 0 + draw_Y, false)
draw_set_color(c_white);draw_rectangle(0 + draw_X, 11 + draw_Y, (307) + draw_X, 1 + draw_Y, false)
draw_set_color(c_black);draw_rectangle(1 + draw_X, 8 + draw_Y + 2, (306) + draw_X, 0 + draw_Y + 2, false)
    global.BarLength = (Boss[i].my_health * 306) / Boss[i].maxhealth //health * length / maxhealth
    draw_set_color(c_red);draw_rectangle(1 + draw_X, 10 + draw_Y, (global.BarLength) + draw_X, 3 + draw_Y, false)
    draw_set_halign(1)
    if (Boss[i] = BanditBoss) draw_text_nt(game_width / 2, 210, "BIG BANDIT")
    if (Boss[i] = HyperCrystal) draw_text_nt(game_width / 2, 210, "HYPER CRYSTAL")
    if (Boss[i] = FrogQueen) draw_text_nt(game_width / 2, 210, "MOM")
    if (Boss[i] = OasisBoss) draw_text_nt(game_width / 2, 210, "BIG FISH")
    if (Boss[i] = LilHunter) draw_text_nt(game_width / 2, 210, "LIL HUNTER")
    if (Boss[i] = Nothing) draw_text_nt(game_width / 2, 210, "THRONE")
    if (Boss[i] = Nothing2) draw_text_nt(game_width / 2, 210, "THRONE II")
    if (Boss[i] = ScrapBoss) draw_text_nt(game_width / 2, 210, "BIG DOG")
    if (Boss[i] = TechnoMancer) draw_text_nt(game_width / 2, 210, "TECHNOMANCER")
}}

draw_set_halign(fa_left)
draw_set_alpha(1); draw_set_color(c_white)
draw_set_font(fntM0)
//settings OwO
 if instance_exists(CharSelect) {
draw_text_nt(game_width - 81, 20, "SETTINGS")

for(var i = 0; i < 0.5; i += 1) {
                var draw_x = game_width - 31; var draw_y = 20; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+2, draw_y+10, 1); draw_set_alpha(1) draw_set_color(c_white)
            	if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+2, draw_y+10) {
                var draw_x = game_width - 31; var draw_y = 20; draw_set_alpha(0.25); draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+2, draw_y+10, 0); draw_set_alpha(1) draw_set_color(c_white)
                }
                if button_pressed(i, "fire") && point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+2, draw_y+10)
                 {
                if global.settings == true {global.settings = false} else {global.settings = true; CharSelect.closeInfo = true;}
                sound_play_pitch(sndClick, random_range(0.8, 1.2))
                }
                if global.settings == true {

                draw_x = game_width / 2 + 35; draw_y = 20; draw_set_alpha(0.85); draw_set_color(c_black); draw_rectangle(120+draw_x, 20+draw_y, -190+draw_x, 180+draw_y, 0) //Draw Box

                //Preformance Mode Toggle
                draw_set_alpha(1) draw_set_color(c_white); draw_text_nt(game_width / 2 - 150, 50, "PREFORMANCE MODE") //Draw Label
                if (global.preformanceMode == true) { draw_text_nt(game_width / 2 - 15, 50, "ON") } else { draw_text_nt(game_width / 2 - 15, 50, "OFF") } //Draw ON/OFF
                var draw_x = game_width / 2 - 101; var draw_y = 50; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+69, draw_y+10, 1) //Draw Box
                if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+69, draw_y+10) {
                draw_text_nt(game_width / 2 - 151, 180, "DOES MANY DIFFERENT THINGS TO INCREASE")
                draw_text_nt(game_width / 2 - 151, 190, "PERFORMANCE @dSLIGHTY LOWERS QUALITY")
                if button_pressed(i, "fire") { //Check if they clicked
                if global.preformanceMode == true {global.preformanceMode = false; sound_play_pitch(sndGoldCrossbow, 1)} else {global.preformanceMode = true; sound_play_pitch(sndGoldCrossbow, 1.2)}}} //On/Off Toggle
                //Preformance Mode Toggle
                //Enemy HP Bars
                draw_set_alpha(1) draw_set_color(c_white); var draw_x = game_width / 2 - 101; var draw_y = 65; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+69, draw_y+10, 1) //Draw Box
                draw_text_nt(game_width / 2 - 150, draw_y, "ENEMY HP BARS") //Draw Label
                if (global.hpBars == true) { draw_text_nt(game_width / 2 - 15, draw_y, "ON") } else { draw_text_nt(game_width / 2 - 15, draw_y, "OFF") } //Draw ON/OFF
                if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+69, draw_y+10) { //Check if they hovered
                draw_text_nt(game_width / 2 - 151, 190, "SMALL HEALTH BARS UNDER ENEMIES")
                if button_pressed(i, "fire") { //Check if they clicked
                if global.hpBars == true {global.hpBars = false; sound_play_pitch(sndGoldCrossbow, 1)} else {global.hpBars = true; sound_play_pitch(sndGoldCrossbow, 1.2)}}} //On/Off Toggle
                //Enemy HP Bars
                //Boss HP Bars
                draw_set_alpha(1) draw_set_color(c_white); var draw_x = game_width / 2 - 101; var draw_y = 80; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+69, draw_y+10, 1) //Draw Box
                draw_text_nt(game_width / 2 - 150, draw_y, "BOSS HP BARS") //Draw Label
                if (global.bossBars == true) { draw_text_nt(game_width / 2 - 15, draw_y, "ON") } else { draw_text_nt(game_width / 2 - 15, draw_y, "OFF") } //Draw ON/OFF
                if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+69, draw_y+10) { //Check if they hovered
                draw_text_nt(game_width / 2 - 151, 190, "BIG ON SCREEN HEALTH BARS FOR BOSSES")
                if button_pressed(i, "fire") { //Check if they clicked
                if global.bossBars == true {global.bossBars = false; sound_play_pitch(sndGoldCrossbow, 1)} else {global.bossBars = true; sound_play_pitch(sndGoldCrossbow, 1.2)}}} //On/Off Toggle
                //Boss HP Bars
                //Double Chests
                draw_set_alpha(1) draw_set_color(c_white); var draw_x = game_width / 2 - 101; var draw_y = 95; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+69, draw_y+10, 1) //Draw Box
                draw_text_nt(game_width / 2 - 150, draw_y, "DOUBLE ITEMS") //Draw Label
                if (global.doubleChests == true) { draw_text_nt(game_width / 2 - 15, draw_y, "@rON") } else { draw_text_nt(game_width / 2 - 15, draw_y, "OFF") } //Draw ON/OFF
                if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+69, draw_y+10) { //Check if they hovered
                draw_text_nt(game_width / 2 - 151, 190,"DOUBLES THE AMOUNT OF ITEM CHESTS")
                if button_pressed(i, "fire") { //Check if they clicked
                if global.doubleChests == true {global.doubleChests = false; sound_play_pitch(sndGoldCrossbow, 1)} else {global.doubleChests = true; sound_play_pitch(sndGoldCrossbow, 1.2)}}} //On/Off Toggle
                //Double Chests
                //Double Shrines
                draw_set_alpha(1) draw_set_color(c_white); var draw_x = game_width / 2 - 101; var draw_y = 110; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+69, draw_y+10, 1) //Draw Box
                draw_text_nt(game_width / 2 - 150, draw_y, "DOUBLE SHRINES") //Draw Label
                if (global.doubleShrines == true) { draw_text_nt(game_width / 2 - 15, draw_y, "@rON") } else { draw_text_nt(game_width / 2 - 15, draw_y, "OFF") } //Draw ON/OFF
                if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+69, draw_y+10) { //Check if they hovered
                draw_text_nt(game_width / 2 - 151, 190,"DOUBLES THE AMOUNT OF SHRINES")
                if button_pressed(i, "fire") { //Check if they clicked
                if global.doubleShrines == true {global.doubleShrines = false; sound_play_pitch(sndGoldCrossbow, 1)} else {global.doubleShrines = true; sound_play_pitch(sndGoldCrossbow, 1.2)}}} //On/Off Toggle
                //Double Shrines
                //Debug Mode
                draw_set_alpha(1) draw_set_color(c_white); var draw_x = game_width / 2 - 101; var draw_y = 125; draw_rectangle(0+draw_x-52, draw_y-4, draw_x+4*3+69, draw_y+10, 1) //Draw Box
                draw_text_nt(game_width / 2 - 150, draw_y, "FORCE SUPPORT") //Draw Label
                if (global.forceSupport == true) { draw_text_nt(game_width / 2 - 15, draw_y, "ON") } else { draw_text_nt(game_width / 2 - 15, draw_y, "OFF") } //Draw ON/OFF
                if point_in_rectangle(mouse_x[i]-view_xview[i], mouse_y[i]-view_yview[i],draw_x -52, draw_y-4, draw_x+4*3+69, draw_y+10) { //Check if they hovered
                draw_set_font(fntChat);
                draw_text_nt(game_width / 2 - 151, 180,"@wNORMALLY, CUSTOM PROJECTILES ARE UNAFFECTED BY THINGS SUCH AS")
                draw_text_nt(game_width / 2 - 151, 190,"HOMING, AND BOUNCING, ENABLING THIS MAKES THEM EFFECTED")
                draw_set_font(fntM0)
                if button_pressed(i, "fire") { //Check if they clicked
                if global.forceSupport == true {global.forceSupport = false; sound_play_pitch(sndGoldCrossbow, 1)} else {global.forceSupport = true; sound_play_pitch(sndGoldCrossbow, 1.2)}}} //On/Off Toggle
                //Debug Mode
                //Cheats Warning
                if global.doubleChests == true || global.doubleShrines == true {
                draw_text_nt(game_width / 2 + 40, 44, "@rCHEATS ENABLED")
                }
                }
}




 }

//ITEM POPUP + ITEM DESCRIPTIONS-------------------------------------------------------------------------------------------------------------
if (global.descriptionTimer > 0)
{
  var	draw_x   = game_width / 2,
	    draw_y   = 262,
			x_offset = global.descriptionTimer = room_speed * 4 ? 1 : 0,
			_item    = global.itemGet;
			_alpha   = 1
  global.descriptionTimer--
  if (global.descriptionTimer = 0)
  {
		x_offset-= (30 - global.descriptionTimer)
		_alpha /= 2
	}
  var draw_x = -120
	draw_set_alpha(_alpha)
	draw_sprite(sprBossNameSplat, 3, game_width / 2 + draw_x + x_offset + 36, 210)
	draw_sprite(sprScoreSplat, 2, game_width / 2 + draw_x + x_offset + 146, 216)
	switch _item.tier
	{
		case 0 : draw_set_color(c_white); break;
		case 1 : draw_set_color(c_lime) ; break;
		case 2 : draw_set_color(c_red)  ; break;
	}
  draw_text_nt(game_width / 2 + draw_x + sprite_get_width(global.sprItems) + 42 + x_offset, 202, string_upper(_item.name));
  draw_set_halign(fa_left)
  draw_set_color(c_white)
  draw_set_font(fntChat)
  draw_text_nt(game_width / 2 + draw_x + sprite_get_width(global.sprItems) + 40 + x_offset, 211, _item.description_small);
  draw_set_font(fntM0)
  draw_x = -100
	draw_set_alpha(.15)
	draw_sprite(global.sprItemsBack, _item.tier, game_width / 2 + draw_x + 34 + x_offset, 219);
	draw_set_alpha(1)
	draw_sprite(global.sprItems    , _item.spr_index, game_width / 2 + draw_x + 34 + x_offset, 219);
	draw_set_alpha(1)
}

#define draw_pause
draw_armor()

 var cx     = view_xview,
     cy     = view_yview,
	   draw_x = 23,
  	 draw_y = 102;
//draw_text_nt(cx + 20, cy + 55, "GAME IS PAUSED UWU");
// ":(", -Karmelyth

draw_backdrop(cx + draw_x-23, cy + draw_y-58, cx + draw_x+293, cy + draw_y-54 + 20 * (ceil(array_length(global.PlayerItems) / 15)), "")

for(i = 1; i < array_length_1d(global.PlayerItems); i++)
{
		var _hover   = false,
		    maxitems = 15, // 15 items per line
		    line     = 0,  // what line the item is on
		    itemx    = i,  // xposition (first item, second item... 15th item)
		    maxline  = round(floor(array_length(global.PlayerItems) / (maxitems + 1))) // absolute amount of lines (for the descrption)
		line = ceil(i / maxitems) - 1
		itemx = i mod maxitems
		if itemx = 0 itemx = maxitems
		draw_set_font(fntM)
		var _nl = string_width(string_upper(global.PlayerItems[i].name))
		draw_set_font(fntSmall)
		var _dl = string_width(string_upper(global.PlayerItems[i].description_small)) - string_count("@",global.PlayerItems[i].description_small) * string_width("@@") + 3
		draw_set_font(fntM)
		var _boxwidth = _nl if _dl > _nl _boxwidth = _dl

		if point_in_rectangle(mouse_x, mouse_y, cx + (itemx * 21) - 20, cy + 44 + (20 * (line + 1)) - 18, cx + (itemx * 21), cy + 45 + (20 * (line + 1))) //description on hover
		{
			_hover = true;
			var _biglength = clamp(cx + (itemx * 21) - 20, 0, view_xview + game_width - _boxwidth - 3)

			draw_backdrop(_biglength - 1, cy + 55 + (20 * (maxline + 1)), _biglength - 1 + _boxwidth, cy + 54 + (20 * (maxline + 1)) + string_height(string_upper(global.PlayerItems[i].name)) + string_height(string_upper(global.PlayerItems[i].description_small)), string_upper(global.PlayerItems[i].name))
			draw_set_font(fntSmall)
			draw_text_nt(_biglength + 2, cy + 64 + (20 * (maxline + 1)), string_upper(global.PlayerItems[i].description_small))
		}
		draw_sprite_ext(global.sprItems, global.PlayerItems[i].spr_index, cx + (itemx * 21) - 1, cy + 45 + (20 * (line + 1)) - _hover, 1, 1, 0, merge_colour(c_black, c_white, .9 + _hover * .1), 1) //sprUltraLevel
		draw_set_font(fntChat)
		if global.PlayerItems[i].count > 1 draw_text_nt(cx + (itemx * 21) - 9, cy + 45 + (20 * (line + 1)) - 8 - _hover,"x" + string(global.PlayerItems[i].count))
}



/*
IMPORTANT - Remember that projectiles have creators, allowning you to buff certain enemy projectiles (????)
*/

#define popoSpawn
var _roll = round(random_range(1, (100)))
if (_roll <= global.popoChance) repeat(2)instance_create(Player.x, Player.y, IDPDSpawn)

#define add_item(item)
var itemarray = global.PlayerItems,
    need_new_item = true;
		//if array_length(global.PlayerItems) > 0
with itemarray {              //iterating through the item list using with, can reference variables since they are LWOs
		if self.key == item.key { //self = the instance of an item in the array
        self.count++          //new item acquired, count increases
        need_new_item = false //we dont need to create a new instance of an item
        break                 //stop going through the list, because a match was found
    }
}
if need_new_item {
    var newitem = lq_clone(item);  //create a copy so that it isnt a pointer and can be freely manipulated
    newitem.count = 1              //example of that manipulation, count = 1 because it is a newly acquired item and you only have one
    array_push(itemarray, newitem) //add the new item to the list of items
}

#define item_get_count(ITEM)
var amount
for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].key == ITEM {amount = global.PlayerItems[i].count; break}}
return amount

#define draw_backdrop(STARTX, STARTY, ENDX, ENDY, TITLE)
var _TopCornerHeight     = sprite_get_height(global.sprBackdropCornerTop),
    _TopCornerWidth      = sprite_get_width(global.sprBackdropCornerTop),
    _BottomCornerHeight  = sprite_get_height(global.sprBackdropCornerBottom) - 1,
    _BottomCornerWidth   = sprite_get_width(global.sprBackdropCornerBottom),
    _HBorderWidth        = sprite_get_width(global.sprBackdropHBorder),
    _VBorderBottomHeight = sprite_get_height(global.sprBackdropVBorderBottom),
    _VBorderTopHeight    = sprite_get_height(global.sprBackdropVBorderTop),
    _TitleWidth          = string_width(TITLE) - string_count("@",TITLE) * string_width("@") * 2,
    _TitleHMargin        = 3,
    _TitleVMargin        = 2;

draw_sprite(global.sprBackdropCornerTop, 0, STARTX, STARTY)
draw_sprite_stretched(global.sprBackdropHBorder, 0, STARTX, STARTY + _TopCornerHeight, _HBorderWidth, ENDY - STARTY)
draw_sprite(global.sprBackdropCornerBottom, 0, STARTX, ENDY + _BottomCornerHeight)
draw_sprite_stretched(global.sprBackdropVBorderBottom, 0, STARTX + _BottomCornerWidth, ENDY + _TopCornerHeight, ENDX - STARTX, _VBorderBottomHeight)
draw_sprite_ext(global.sprBackdropCornerBottom, 0, ENDX + _BottomCornerWidth * 2, ENDY + _BottomCornerHeight, -1, 1, 0, c_white, 1)
draw_sprite_ext(global.sprBackdropHBorder, 0, ENDX + _HBorderWidth * 2, STARTY + _TopCornerHeight, -1, ENDY - STARTY, 0, c_white, 1)
draw_sprite_ext(global.sprBackdropCornerTop, 0, ENDX + _TopCornerWidth * 2, STARTY, -1, 1, 0, c_white, 1)
draw_sprite_stretched(global.sprBackdropFill, 0, STARTX + _HBorderWidth, STARTY + _VBorderBottomHeight, ENDX - STARTX, ENDY - STARTY - 1)
draw_sprite_stretched(global.sprBackdropVBorderTop, 0, STARTX + _TopCornerWidth, STARTY, _TitleHMargin, _VBorderTopHeight)
draw_sprite_stretched(global.sprBackdropVBorderTop, 0, STARTX + _TopCornerWidth + _TitleHMargin + _TitleWidth, STARTY, ENDX - STARTX - _TitleHMargin - _TitleWidth, _VBorderTopHeight)
draw_text_nt(STARTX + _TopCornerWidth + _TitleHMargin, STARTY - _TitleVMargin, TITLE)

#define itemchest_open
sound_play(sndAmmoChest);

// determine item based on rarity based on chest tag
var tem = 0
if "tag" in self
{
	var _roll = irandom(99);
	switch tag
	{
		case "item"   : tem = item_index break;
		case "gold"   : if _roll <= 99 {tem = global.RareItems[round(random_range(0, array_length_1d(global.RareItems) - 1))]        }
									  break;
		case "rusty"  : if _roll <= 94 {tem = global.CommonItems[round(random_range(0, array_length_1d(global.CommonItems) - 1))]    }
									  else           {tem = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]}
									  break;
		case "large"  : if _roll <= 79 {tem = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]}
									  else           {tem = global.RareItems[round(random_range(0, array_length_1d(global.RareItems) - 1))]        }
									  break;
		case "cursed"	: if _roll <= 99 {tem = global.CursedItems[round(random_range(0, array_length_1d(global.CursedItems) - 1))]    }
										break;
		case "test"   : tem = item[? "dice"] // this is for testing
								    break;
		case "none"   :
		default       : if _roll <= 64 {tem = global.CommonItems[round(random_range(0, array_length_1d(global.CommonItems) - 1))]    }
									  if _roll >  69 {tem = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]}
                    if _roll >= 94 {tem = global.RareItems[round(random_range(0, array_length_1d(global.RareItems) - 1))]        }
									  break;
	}
	if tag = "item" with instance_create(x, y, CustomObject){on_step = antifx_step}
}
get_item(tem)


#define chest_setup(TAG)
switch TAG
{
	case "gold"     :
		sprite_index = global.sprGoldItemChest
		spr_open = global.sprGoldItemChestOpen
		spr_shadow = shd32
		break;
	case "rusty"    :
		sprite_index = global.sprRustyItemChest
		spr_open = global.sprRustyItemChestOpen
		spr_shadow = shd16
		spr_shadow_y = 3
		break;
	case "large"    :
		sprite_index = global.sprLargeItemChest
		spr_open = global.sprLargeItemChestOpen
		spr_shadow = shd32
		spr_shadow_y = 2
		break;
	case "cursed" :
		sprite_index = global.sprCursedItemChest
		spr_open = global.sprCursedItemChestOpen
		spr_shadow_y = 1
		break;
	case "item" :
		sprite_index = global.sprItems
		image_index  = item_index.spr_index
		image_speed  = 0
		spr_open   = mskNone
		spr_shadow = shd16
		spr_shadow_x = -8
		spr_shadow_y = 2
		break;
}

#define reorder()
var amount_common   = 0,
		amount_uncommon = 0,
		amount_rare     = 0,
		amount_unique   = 0;
cursed_array [0,0] = -4
for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 0{amount_common   += global.PlayerItems[i].count}};
for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 1{amount_uncommon += global.PlayerItems[i].count}};
for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 2{amount_rare     += global.PlayerItems[i].count}};
for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 4{amount_unique   += global.PlayerItems[i].count}};
for (var i = 0, j = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 3{cursed_array[j,0] = global.PlayerItems[i];cursed_array[j,1] = global.PlayerItems[i].count; j++}};
global.PlayerItems =  []
global.PlayerItems[0] = item[? "none"]
if amount_common   > 0 {global.PlayerItems[1] = global.CommonItems[random_range(0, array_length(global.CommonItems))]     ;global.PlayerItems[1].count = amount_common  }
if amount_uncommon > 0 {global.PlayerItems[2] = global.UncommonItems[random_range(0, array_length(global.UncommonItems))] ;global.PlayerItems[2].count = amount_uncommon}
if amount_rare     > 0 {global.PlayerItems[3] = global.RareItems[random_range(0, array_length(global.RareItems))]         ;global.PlayerItems[3].count = amount_rare    }
if amount_unique   > 0 {global.PlayerItems[4] = global.UniqueItems[random_range(0, array_length(global.UniqueItems))]     ;global.PlayerItems[4].count = amount_unique  }
for (var i = 0, iLen = array_length_1d(cursed_array); i < iLen; i++){global.PlayerItems[5 + i] = cursed_array[i,0]; repeat(cursed_array[i,1])add_item(cursed_array[i,0])}

#define roll(VALUE)
var _chance = irandom_range(1,100),
    _luck   = item_get_count("coin") + ((item_get_count("gem") > 0 ? 3 : 0) + item_get_count("gem") * 2) * global.GemCoeff;
if _luck != 0
{
	for (i = 0; i < abs(_luck); i++ )
	{
		_chance = irandom_range(1,100);
		if _luck > 0
		{
			if _chance <= VALUE return true
		}
		if _luck < 0
		{
			if _chance <= VALUE return false
		}
	}
	if _chance <= VALUE return true else return false
}
else
{
	if _chance <= VALUE {return true} else {return false}
}

#define draw_armor
//Draw Armor Number
draw_set_halign(fa_left)
if instance_exists(Player) && (Player.shakeText > 0) {
Player.shakeText--
var shake_x = round(random_range(-1, 1)); var shake_y = round(random_range(-1, 1))
} else {
    var shake_x = 0;
    var shake_y = 0;
}
if instance_exists(Player)
{
	var _s = Player.shakeText > 0 ? "@r" : ""
	var _rogue = + (Player.race = "rogue" ? sprite_get_width(sprRogueAmmoHUDTB) : 0)
	draw_set_halign(fa_center)
	draw_set_font(fntChat)
	if (Player.armor != 0)
	{
		draw_sprite(global.sprArmor, item_get_count("celesteel") > 0 ? 2 : 0, 117 + _rogue, 12)
		if Player.fx_celesteel > 0
		{
			draw_set_blend_mode(bm_add)
			draw_sprite(global.sprArmorShine, 6 - Player.fx_celesteel, 117 + _rogue, 12)
			draw_set_blend_mode(bm_normal)
			Player.fx_celesteel-= .5
		}
		draw_text_nt(118 + _rogue + shake_x, 4 + shake_y, _s + string(Player.armor))
		_rogue += sprite_get_width(global.sprArmor) - 2
	}
	if (Player.perma_armor != 0)
	{
		draw_sprite(global.sprArmor, 1, 117 + _rogue, 12)
		draw_text_nt(118 + _rogue + shake_x, 4 + shake_y, string(Player.perma_armor))
	}
}
draw_set_halign(fa_left)
draw_set_font(fntM)

#define antifx_step
with FXChestOpen instance_delete(self)
instance_delete(self)
