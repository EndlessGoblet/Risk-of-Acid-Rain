#macro item mod_variable_get("mod", "itemlib", "ItemDirectory");

#define init
global.fancy = true;
global.preformanceMode = false //Turn on to avoid lag (recommended)
global.hpBars = true;
global.bossBars = true;
global.settings = false;
global.PlayerItems = [item[? "none"]]
global.coinGet = 0;
global.forceSave = 0;
global.cheats = false;

global.sprBerserkFX = sprite_add("sprites/other/sprBerserkFX.png", 3,  4, 4);
global.mskLightBulb = sprite_add("sprites/other/mskLightBulb.png", 1, 32, 32);

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

global.sprCD = sprite_add("sprites/other/sprCD.png", 2, 12, 12);

global.sprDeathCauseInjury = sprite_add("sprites/items/sprDeathCauseInjury.png", 1, 9, 6);
global.sprDeathCauseHeater = sprite_add("sprites/items/sprDeathCauseHeater.png", 1, 9, 6);

global.sprFernPickup    = sprite_add_weapon("sprites/chests/sprFernPickup.png"    , 5, 5);
global.sprArmorPickup   = sprite_add_weapon("sprites/chests/sprArmorPickup.png"   , 5, 5);
global.sprInfammoPickup = sprite_add_weapon("sprites/chests/sprInfammoPickup.png" , 5, 5);

global.sprArmor      = sprite_add("sprites/other/sprArmor.png", 3, 9, 9);
global.sprArmorShine = sprite_add_weapon("sprites/other/sprArmorShine.png", 9, 9);

global.sprItems     = sprite_add(    "sprites/items/sprItems.png", 101, 17, 17);
global.sprItemsBack = sprite_add("sprites/items/sprItemsBack.png",   5, 20, 20);

global.sprText2 = sprite_add("sprites/other/sprText2.png", 1, 8, 8);

global.sprBackdropCornerTop     = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAOSURBVBhXY0CA////AwAGCAL++VY/agAAAABJRU5ErkJggg=="     , 1, 0, 0);
global.sprBackdropCornerBottom  = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAADCAIAAAA2iEnWAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAATSURBVBhXYwCC////gygYYGAAAC/lAv7Wwl7SAAAAAElFTkSuQmCC" , 1, 0, 0);
global.sprBackdropHBorder       = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAIAAAABCAIAAAB7QOjdAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAOSURBVBhXYwCC////AwAGAQL+JDrNNwAAAABJRU5ErkJggg=="     , 1, 0, 0);
global.sprBackdropVBorderTop    = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAADCAIAAADdv/LVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASSURBVBhXYwCB////MzAwMAAAEfoC/jl5h8AAAAAASUVORK5CYII=" , 1, 0, 0);
global.sprBackdropVBorderBottom = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAADCAIAAADdv/LVAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAARSURBVBhXY/j//z8DGDAwAAAd7gL+tIt1BwAAAABJRU5ErkJggg==" , 1, 0, 0);
global.sprBackdropFill          = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAANSURBVBhXY2BgYFgFAACvAKujngvGAAAAAElFTkSuQmCC"         , 1, 0, 0);

//global.sprHorrorBall = sprite_add("sprHorrorBall.png", 6, 48, 48);
//global.sprIceExplosion = sprite_add("sprIceExplosion.png", 6, 32, 32);
global.shrineIcons = sprite_add("sprites/shrines/shrineIcons.png", 16, 13, 13)
with(instances_matching(chestprop, "name", "ItemChest")) {instance_delete(self)}

if instance_exists(Player) Player.invincibility = 0;
global.BossBarMaxHP = 0
global.frame = 0;
global.RadiGumdropTimer = 0;
global.RadiatedSnackCounter = 0;
global.itemGet = -4;
global.ItemGetAmount = 1;
global.descriptionTimer = 0;

global.MaskCounter = 0;
global.BloodCounter = 0;
global.GemCoeff = choose(-1, 1)
global.hurtFloor = false;

global.PlusItems = 0;
global.hideDes = 0;
global.popoChance = 0;
global.CommonItems   = [item[? "info"]      , item[? "gumdrop"], item[? "bandages"], item[? "fruit"]  , item[? "golden"] , item[? "rubber"]  , item[? "focus"] , item[? "mush"]    , item[? "grease"]     , item[? "boots"]  , item[? "chopper"], item[? "locket"]  , item[? "metal"], item[? "mask"]] //TO DO: None
global.UncommonItems = [item[? "incendiary"], item[? "lens"]   , item[? "bulb"]    , item[? "lust"]   , item[? "nitrogen"], item[? "binky"] , item[? "cryo"]    , item[? "gift"]       , item[? "siphon"] , item[? "plate"]  , item[? "firewood"], item[? "coin"] , item[? "celesteel"], item[? "canteen"]] //To-Do: Horror In a Bottle --- REMEMBER ITS CURRENTLY NOT IN THE LIST!!!
global.RareItems     = [item[? "artifact"]  , item[? "slosher"], item[? "fungus"]  , item[? "wing"]   , item[? "tools"]   , item[? "prize"] , item[? "blessing"], item[? "extractor"]  , item[? "missile"], item[? "heart"]  , item[? "fillings"]] //To-Do: Fern
global.CursedItems   = [item[? "brooch"]    , item[? "heater"] , item[? "gem"]     , item[? "fel"]    , item[? "clay"],     item[? "diamond"],item[? "collider"], item[? "CD"]] // Todo: brooch
global.UniqueItems   = [item[? "energy"]    , item[? "times"]  ,  item[? "injury"], item[? "currency"], item[? "Fcurrency"], item[? "pearl"], item[? "Dpearl"], item[? "key"]]

//set new level function
if instance_exists(CharSelect) CharSelect.debugSet = false;
if instance_exists(CharSelect) CharSelect.debug = false;
if instance_exists(CharSelect) CharSelect.closeInfo = true;
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

#macro preformanceMode mod_variable_get("mod", "main", "preformanceMode");
#macro hpBars					 mod_variable_get("mod", "main", "hpBars");
#macro bossBars        mod_variable_get("mod", "main", "bossBars");
#macro doubleChests    mod_variable_get("mod", "main", "doubleChests");
#macro doubleShrines   mod_variable_get("mod", "main", "doubleShrines");
#macro forceSupport    mod_variable_get("mod", "main", "forceSupport");

#define game_start
Player.lunarDrops = 1;
global.PlayerItems = [item[? "none"]]

if (global.fancy == 1) {
	Player.fancy = 1
} else {
	Player.fancy = 0;
}
//Stats
Player.reloadspeed_base = Player.reloadspeed;
Player.speed_base       = Player.maxspeed;
Player.accuracy_base    = Player.accuracy;
Player.health_base      = Player.maxhealth;
Player.damage_base      = 1

//Mechanic related
Player.invincibility  = 0;
Player.firewoodCharge = 0;
Player.firewoodKills  = 0;
Player.armor          = 0;
Player.perma_armor    = 0;
Player.deathCounter = 0;
//Shrine
Player.s_Combat    = 0;
Player.s_Challenge = 0;


global.descriptionTimer = 0;

//Visuals
Player.fx_celesteel = 0;
Player.shakeText    = 0;

#define level_start
var amount = item_get_power("metal")
if amount >= 1{Player.armor += 2 * amount}

var amount = item_get_count("brooch")
if amount >= 1{reorder()}

Player.s_Combat = 0;
Player.s_Challenge = 0;

global.GemCoeff = choose(-1, 1)
if item_get_count("gem") > 0 {
if global.GemCoeff == (1) {
with instance_create(Player.x, Player.y, PopupText) {
	text = "@gLucky"
	 }
} else {
with instance_create(Player.x, Player.y, PopupText) {
	text = "@rUnlucky"
	 }
}

}
//Perfect Prize
// See level generation
//Perfect Prize

//Bandit Mask
var amount = item_get_power("mask")
if (amount >= 1) global.MaskCounter = (room_speed * (1 + 4 *  amount))
//Bandit Mask

global.descriptionTimer = 0;
//SPAWN OBJECTS ON LEVEL START

// CHESTS:
var  _area_amount = 0,
	  _chest_amount = 3 + skill_get(28),
    _prize_amount = item_get_power("prize") * (global.hurtFloor = false ? 0 : 1),
		_curse_amount = (GameCont.area = 104 ? 1 : 0) + irandom(99) > (crown_current != 1 ? (crown_current = 11 ? 66 : 14) : 0) ? 1 : 0,
          _floorq = ds_list_create(), // put all available floor tiles into a list
	             _i = 0;

switch GameCont.area // area specific extra chests
{
	case 100: _area_amount = -_chest_amount; break; // = repeat(0) will execute code once
	case 101: _area_amount =              2; break;
	default : _area_amount =              0; break;
}
_chest_amount += _area_amount;

_chest_amount *= (doubleChests + 1); // double chest options
if ((mod_variable_get("mod", "main", "gamemode") != 2)) {
with Floor // get a list of all "unoccupied" Floors
{
	var _d = 0;
	with Player _d = distance_to_object(instance_furthest(x, y, Floor)) * .4;
	if ((styleb = true && instance_exists(Player) && distance_to_object(Player) > _d) || (styleb = false && instance_exists(Player) && distance_to_object(Player) > 350) || (distance_to_object(TopPot) < 64) || distance_to_object(Detail) < 64) && !place_meeting(x, y, prop) && !place_meeting(x, y, hitme) && self != FloorExplo
	{
		_floorq[| _i] = self; // add eligible floor tiles to the list
		_i++;
  }
}
ds_list_shuffle(_floorq)

repeat(_chest_amount + _prize_amount)
{
	if place_meeting(_floorq[| 0].x, _floorq[| 0].y, Wall)
	{
		with other
		{
			instance_create(x, y, FloorExplo)
			instance_destroy()
		}
	}
	with obj_create(_floorq[| 0].x + 16, _floorq[| 0].y + 16, "ItemChest") {with instance_place(x, y, Wall){instance_delete(self)}}
	ds_list_delete(_floorq, 0)
	ds_list_shuffle(_floorq)
}
if _prize_amount > 0 // 1/2 of perfect prize's effect. repeat(0) executes the the code inside the repeat once
{
	repeat(_prize_amount)
	{
		if place_meeting(_floorq[| 0].x, _floorq[| 0].y, Wall)
		{
			with other
			{
				instance_create(x, y, FloorExplo)
				instance_destroy()
			}
		}
		with obj_create(_floorq[| 0].x + 16, _floorq[| 0].y + 16, "ItemChest") {tag = "gold"; chest_setup(tag); with instance_place(x, y, Wall){instance_delete(self)}}
		ds_list_delete(_floorq, 0)
		ds_list_shuffle(_floorq)
	}
}
if _curse_amount > 0 // guaranteed cursed chest spawn in caves + extra cursed chest from crowns
{
	repeat(_curse_amount)
	{
		if place_meeting(_floorq[| 0].x, _floorq[| 0].y, Wall)
		{
			with other
			{
				instance_create(x, y, FloorExplo)
				instance_destroy()
			}
		}
		with obj_create(_floorq[| 0].x + 16, _floorq[| 0].y + 16, "ItemChest") {tag = "cursed"; chest_setup(tag); with instance_place(x, y, Wall){instance_delete(self)}}
		ds_list_delete(_floorq, 0)
		ds_list_shuffle(_floorq)
	}
}

ds_list_destroy(_floorq)
}
with ProtoStatue     instance_delete(self)
with PizzaEntrance   instance_delete(self)
with CarVenus        instance_delete(self)
with IceFlower       instance_delete(self)
with WantBoss        instance_delete(self)
with BecomeScrapBoss instance_delete(self)

var floors = instances_matching(Floor, mod_current, undefined);
if doubleShrines != true {
var _roll = round(random_range(0, 2)) //SHRINE AMOUNTS-------------
} else {
var _roll = round(random_range(2, 4))
}
if (GameCont.area = 100) var _roll = 0;
for(i = 0; i < _roll; i++)
{
	var my_floor = floors[irandom(array_length(floors) - 1)];
  with instance_create(my_floor.x, my_floor.y, CustomObject)
	{


	}
}

#define draw
//near cursed chests text
with instances_matching(chestprop, "name", "ItemChest")
{
if (tag == "cursed") && place_meeting(x, y, Player) {
	draw_x = 0; draw_y = 20;
	draw_set_alpha(0.65);
	draw_rectangle_colour(x+8, y-11 + draw_y, x-9, y-2 + draw_y, c_black, c_black, c_black, c_black, 0)
	draw_set_alpha(1)
	draw_text_nt(x, y - 35 + draw_y, "@1(keysmall:pick)")
	draw_text_nt(x , y - 10 + draw_y, " 1")
	draw_sprite(global.sprText2, 1, x, y - 2 + draw_y)
}

}
//HEALTH BARS
if hpBars = true
{
	with enemy
	{
		var _col = c_white;

		if "tag" in self
		{
			switch tag
			{
				case "boss" : _col = c_red   ; break;
				case "god"  : _col = c_white ; break;
				default     : _col = c_orange; break;
			}
		}
		else{_col = c_orange}
	  if object_index != RavenFly && object_index != Mimic && object_index != SuperMimic
		{
		  var _x     = x,
			 		_y     = y,
		   		_maxh  = clamp(maxhealth, 10, 50),
		      _currh = max(my_health, 0);
			draw_rectangle_colour(_x - _maxh / 2    , bbox_bottom + 5    , _x + _maxh / 2                              				       , bbox_bottom + 5 + 3, c_black, c_black, c_black, c_black, false);
			if my_health > 0
			draw_rectangle_colour(_x - _maxh / 2 + 1, bbox_bottom + 5 + 1, _x - _maxh / 2 + _maxh * max(my_health / maxhealth, 0) - 1, bbox_bottom + 5 + 2,    _col,    _col,    _col,    _col, false);
		}
	}
}

var amount = item_get_power("nitrogen") //LIQUID NITROGEN
if amount >= 1 && instance_exists(Player){
var light = (45 + (amount * 7))
if (preformanceMode == true) draw_set_alpha(1); draw_set_color(c_blue)
if (preformanceMode == false) draw_set_alpha(0.15); draw_set_color(c_blue)
if (preformanceMode == true) draw_circle(Player.x, Player.y, light, 1);
if (preformanceMode == false) draw_circle(Player.x, Player.y, light, 0);

with (projectile) { if distance_to_object(Player) <= (light) && point_in_circle(x, y, Player.x, Player.y, light) && team != 2 {
speed *= 0.975;
if (speed <= 0.1) instance_destroy()
}}
draw_set_alpha(1)
}

var amount = item_get_power("bulb") //PRE WAR LIGHT BULBS
var _light = 30 + random(2);
if amount >= 1 && instance_exists(Player)
{
	if preformanceMode = true
	{
		draw_set_alpha(0.8)
		draw_circle(Player.x, Player.y, _light, 1);
	}
	else
	{
		_light = 31;
		draw_set_alpha(0.2)
		draw_circle(Player.x, Player.y, _light, 0);
	}
  draw_set_alpha(1)

  with Player with instance_create(x + hspeed, y + vspeed, CustomSlash)
	{
		team         = other.team;
		creator      = other;
		image_speed  = 0;
		sprite_index = global.mskLightBulb;
		image_alpha  = 0;
		lifetime     = 1;
		damage       = .175 + amount * .05

		on_projectile = void;
		on_step 			= bulb_step;
		on_hit  			= bulb_hit;
	}
}

if global.MaskCounter >= 0 && instance_exists(Player)
{
	if (global.MaskCounter > 15) with (Player) {image_blend = merge_color(c_aqua, c_white, 0.7); image_alpha = .6} else with (Player) {image_blend = merge_color(c_aqua, c_white, 1); image_alpha = 1}
	global.MaskCounter--
  draw_set_halign(fa_center)
  var count = round(global.MaskCounter / room_speed)
	if instance_exists(Player) && global.MaskCounter > 15 draw_text_nt(Player.x, Player.y + 10, string(count));
	if Player.my_health < Player.lsthealth
	{
		sleep(70)
		view_shake_at(Player.x, Player.y, 12)
		global.MaskCounter = 0
	}
	if irandom(7) = 0 with instance_create(Player.x + random_range(-12, 12), Player.y + random_range(-12, 12), Smoke){sprite_index = sprExtraFeetDust; motion_add(90, 2); friction *= 2; depth = Player.depth - choose(0, 1, 1)}
	if global.MaskCounter = 15  {sound_play_pitch(sndPickupDisappear, 1.3); sleep(20); view_shake_at(Player.x, Player.y, 6	); repeat(18) with instance_create(Player.x + random_range(-12, 12) + Player.hspeed, Player.y + random_range(-12, 12) + Player.vspeed, Smoke){depth = Player.depth - 1}}
}

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
        if (type == "Printing") draw_text_nt(x, y+20, itemPrint.name);
        if (type == "Crowns") draw_text_nt(x, y+20, "here we go");
        if (type == "Transport") draw_text_nt(x, y+20, "Let's leave");
        if (type == "Sacrifice") draw_text_nt(x, y+20, "[Primary Gun]");
        if (type == "Legends") draw_text_nt(x, y+20, "[2 ITEMS]");
        if (type == "Curse") draw_text_nt(x, y+20, "[FREE?]");
        if (type == "Unknown") draw_text_nt(x, y+20, "[???]");
        if (type == "Carnage") draw_text_nt(x, y+20, "@r[-20% MAX HP]");
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
    with instances_matching(CustomProp, "name", "Teleporter"){portal = "vault"}
    wait(1);
	with instance_create(x,y,GreenExplosion) { damage = 0; mask_index = mskNone}
	sound_play_pitch(sndLevelUp, 0.9)
    instance_destroy()
    global.popoChance = 99
    popoSpawn();
    break;
}

if (type == "Printing")
{
	if array_length(global.PlayerItems) > 1
	{
		var i = 0;
		var _roll = irandom(array_length(global.PlayerItems)-1); //Pick random player item
		do
		{
			_roll = irandom(array_length(global.PlayerItems)-1)
			i++;
		}
		until (global.PlayerItems[_roll].tier = itemPrint.tier && global.PlayerItems[_roll] != itemPrint) || i >= 50 // i literally dont care if this makes the game crash at least in theory it gives you the same tier

		if global.PlayerItems[_roll].key = itemPrint.key
		{
			with instance_create(Player.x, Player.y, PopupText)
			{
	    	text = "*SNAP*"
	    	time = 5
			}
			sound_play_pitch(sndExplosion, 1)
			sleep(7)
			view_shake_at(x, y, 5)
			with instance_create(x, y, GreenExplosion){damage = 0; mask_index = mskNone}
			instance_destroy()
			exit
		}
		else
		{
			remove_item(global.PlayerItems[_roll])
			get_item(itemPrint, 1)
		}
		sound_play_pitch(sndCrownProtection, 1)
		global.popoChance = 10
	  popoSpawn();
		break;
	}
	else
	{
		with instance_create(Player.x, Player.y, PopupText)
		{
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
switch(obj_name)
{
	case "Coin":
				_obj = obj_create(_x, _y, "ItemChest");
				with _obj
				{
					tag = "coin";
					item_index = item[? choose("currency")];
					chest_setup(tag);
				}
				return _obj;
	case "Shrine":
				_obj = shrine_create(_x, _y);
				return _obj;
	case "AmmoChest":
				_obj  =instance_create(_x, _y, AmmoChest)
				return _obj;
	case "RadChest":
				_obj  =instance_create(_x, _y, RadChest)
	case "BigRadChest":
				_obj  = obj_create(_x, _y, "RadChest");
				with _obj
				{
					maxhealth = 20;
					my_health = maxhealth;
				  spr_idle = sprRadChestBig;
			    spr_hurt = sprRadChestBigHurt;
			    spr_dead = sprRadChestBigDead;
			  }
				return _obj;
	case "RadChest?":
				if roll_luck(7) = true{_obj  = obj_create(_x, _y, "RadChest")}
												  else{_obj  = obj_create(_x, _y, "BigRadChest")}
	case "HealthChest":
				_obj  =instance_create(_x, _y, HealthChest)
				return _obj;
	case "WeaponChest":
				_obj  =instance_create(_x, _y, WeaponChest)
				return _obj;
	case "BigWeaponChest":
				_obj  =instance_create(_x, _y, BigWeaponChest)
				return _obj;
	case "WeaponChest?":
				if roll_luck(5) = true{_obj  =instance_create(_x, _y, BigWeaponChest)}
													else{_obj  =instance_create(_x, _y, WeaponChest)}
				return _obj;
	case "ItemChest":
				_obj = instance_create(_x, _y, chestprop)
				with _obj
				{
					name = "ItemChest";
					amount = 1;
					spr_shadow = shd24;
					spr_open = global.sprItemChestOpen;
					sprite_index = global.sprItemChest;
					if roll_luck(1) tag = "gold" else tag = "none" // 1% chance to turn regular chests into gold chests
					if tag = "none" && roll_luck(4) tag = "large"  // 5% chance to turn into a large chest if gold chest roll failed
					chest_setup(tag)
					if (tag != "cursed") on_open = itemchest_open;
				}
				return _obj;
	case "LargeItemChest":
				_obj = obj_create(_x, _y, "ItemChest")
				with _obj
				{
					name = "LargeItemChest";
					tag = "large"
					chest_setup(tag)
					on_open = itemchest_open;
				}
				return _obj;
	case "ItemChest?":
				if roll_luck(5) = true{_obj  =obj_create(_x, _y, "ItemChest")}
													else{_obj  =obj_create(_x, _y, "LargeItemChest")}
				return _obj;
	case "Item":
				_obj = obj_create(_x, _y, "ItemChest");
				with _obj
				{
					tag = "item";
					item_index = item[? "boots"];
					chest_setup(tag);
				}
				return _obj;
	case "CustomPickup":
				_obj = instance_create(_x, _y, Pickup);
				with _obj
				{
					name = "CustomPickup";
					sprite_index = global.sprFernPickup
					mask_index   = mskPickup
					image_speed  = 0
					friction = .2
					num = 1 + (crown_current = 4 ? room_speed * 1 : 0)
					tag  = "none"
					anim = 20 + irandom(30)
					if (irandom(9) + 1) <= skill_get(mut_rabbit_paw) * 4 instance_create(x, y, RabbitPaw)
					lifetime = room_speed * 10 - (crown_current = 4 ? room_speed * 5 : 0) + irandom(15)
					on_pickup = ror_pickup
				}
				return _obj;
}

#define get_item(ITEM ,AMOUNT)
global.itemGet = ITEM
if (ITEM != item[? "currency"] && ITEM != item[? "Fcurrency"]) global.descriptionTimer = room_speed * 4
if (ITEM = item[? "currency"]) {
c = mod_variable_get("mod", "main", "coins");
mod_variable_set("mod", "main", "coins", c + 1);
global.forceSave = 1;
repeat(3)instance_create(Player.x, Player.y, Smoke)
with instance_create(Player.x, Player.y, PopupText)
	{
		text = "+1 CURSED COIN"
		time = 10;
	}
sound_play_pitch(sndExplosion, 1.5)
sound_play_pitch(sndHyperCrystalDead, 5)
}
//fx
var _pitch = random_range(.8, 1.2)
if ITEM.tier = 3 _pitch  *= .7
sound_play_pitchvol(sndTVOn, 1.1 * _pitch, .4)
if ITEM.tier >= 1{sound_play_pitchvol(sndMutHover, _pitch, 1)}
if ITEM.tier != 4
{
	if ITEM.tier >= 2{sleep(3);sound_play_pitchvol(sndBasicUltra, 1.5 * _pitch, 1)}
	if ITEM.tier  = 2{sound_play_pitchvol(sndGoldPickup, 1.11* _pitch, .2)}
	if ITEM.tier  = 3{sleep(7);sound_play_pitchvol(sndCursedChest,1.2 * _pitch, .3); sound_play_pitchvol(sndCursedPickup, _pitch, .8)}
}
else
{
	// unique item pickup sound goes here
}

// Molding clay
var _clay_amount = 0;
if roll_luck(100 / (item_get_power("clay") + 1)) _clay_amount = AMOUNT * (item_get_power("clay") + 1);
global.ItemGetAmount = item_get_power("clay") > 0 ? _clay_amount: AMOUNT;
if global.ItemGetAmount = 0
{
	ITEM = item[? "nothing"]
	global.itemGet = ITEM
}
// Molding clay

// Pickup effect
var _ang = random(360),
    _i   = 0;
if ITEM = item[? "gift"] && global.ItemGetAmount > 0 repeat(3 * global.ItemGetAmount)
{
	with obj_create(Player.x + lengthdir_x(26, _ang + _i * 120), Player.y + lengthdir_y(26, _ang + _i * 120), "ItemChest")
	{
		tag = "item"
		item_index = global.CommonItems[round(random_range(0, array_length_1d(global.CommonItems) - 1))]
		chest_setup(tag)
	}
	_i++
}
if ITEM = item[? "brooch"] && global.ItemGetAmount > 0 repeat(2 * global.ItemGetAmount)
{
	with obj_create(Player.x + lengthdir_x(26, _ang + _i * 180), Player.y + lengthdir_y(26, _ang + _i * 180), "ItemChest")
	{
		tag = "item"
		item_index = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]
		chest_setup(tag)
	}
	_i++
}
if ITEM = item[? "celesteel"] && global.ItemGetAmount > 0
{
    Player.armor += 5 * global.ItemGetAmount
}
if ITEM = item[? "pearl"] && global.ItemGetAmount > 0
{
	d = mod_variable_get("mod", "main", "difficulty")
	mod_variable_set("mod", "main", "difficulty", d + 2 * global.ItemGetAmount)
}
if ITEM = item[? "missile"] && global.ItemGetAmount > 0
{
    Player.armor += 8 * global.ItemGetAmount
}
if ITEM = item[? "heater"] && global.ItemGetAmount > 0
{
	Player.lasthit = [global.sprDeathCauseHeater, "HEATER"]
	var _l = round(max(Player.health_base * .75, 1))
	Player.health_base = _l
	if Player.my_health > Player.health_base
	{
		Player.my_health = Player.health_base
		Player.lsthealth = Player.health_base
	}
	Player.perma_armor += 2 * global.ItemGetAmount
}
if ITEM = item[? "injury"] && global.ItemGetAmount > 0
{
	Player.lasthit = [global.sprDeathCauseInjury, "INJURY"]
	Player.my_health--;
}
if ITEM = item[? "plate"] && global.ItemGetAmount > 0
{
	Player.armor += 2 * global.ItemGetAmount
}

if ITEM = item[? "diamond"]
{
	with (Player)
	{
		typ_ammo[1] = round(typ_ammo[1] / 1.5);	// +8 Bullets
		typ_ammo[2] = round(typ_ammo[2] / 1.5)
		typ_ammo[3] = round(typ_ammo[3] / 1.5)
		typ_ammo[4] = round(typ_ammo[4] / 1.5)
		typ_ammo[5] = round(typ_ammo[5] / 1.5)
	}

}

//fx
var _pitch = random_range(.8, 1.2)
if ITEM.tier = 3 _pitch  *= .7
sound_play_pitchvol(sndTVOn, 1.1 * _pitch, .4)
if ITEM.tier >= 1{sound_play_pitchvol(sndMutHover, _pitch, 1)}
if ITEM.tier != 4
{
	if ITEM.tier >= 2{sleep(3);sound_play_pitchvol(sndBasicUltra, 1.5 * _pitch, 1)}
	if ITEM.tier  = 2{sound_play_pitchvol(sndGoldPickup, 1.11* _pitch, .2)}
	if ITEM.tier  = 3{sleep(7);sound_play_pitchvol(sndCursedChest,1.2 * _pitch, .3); sound_play_pitchvol(sndCursedPickup, _pitch, .8)}
}
else
{
	// unique item pickup sound goes here
}
add_item(ITEM, ITEM = item[? "currency"] ? 1 : global.ItemGetAmount)

#define step

//Cross Variables
dc_ = mod_variable_get("mod", "main", "doubleChests")
ds_ = mod_variable_get("mod", "main", "doubleShrines")
if (dc_ == true || ds_ == true) global.cheats = true;
if (dc_ == false && ds_ == false) global.cheats = false;
//Cursed Chest Opening
with (Player) if distance_to_object(CustomObject)
if instance_exists(Player)
{
	with instances_matching_le(enemy,"my_health",0)
	{
		var      _g = mod_variable_get("mod", "main", "Gamemode"),
				_chance = 0;
		if (_g == 0) _chance = round(random_range(1, 500 * Player.lunarDrops))
		if (_g == 1) _chance = round(random_range(1, 250 * Player.lunarDrops))
		if (_g == 2) _chance = round(random_range(1, 500))
	}
	if _chance = 1
	{
		Player.lunarDrops++
		obj_create(x, y, "Coin")
	}
}

//Invincibility
with (Player)
{
if invincibility > 0
	{
		invincibility--
		if my_health < lsthealth
		{
			my_health = lsthealth
		}
		if ((invincibility % 2) == 1) with instance_create(x + random_range(-20, 20), y + random_range(-20, 20), FrogHeal) {image_blend = c_red}
	}
}

//Check if hurt this floor--------
with (Player) if my_health < lsthealth && global.hurtFloor = false
{
	global.hurtFloor = true;
	if (item_get_count("prize") > 0) with instance_create(Player.x, Player.y, PopupText)
	{
		text = "@yPrize Lost"
		time = 10;
	}
}

//Armor Mechanic
with (Player) if my_health < lsthealth
{
	var damageTaken = (Player.lsthealth - Player.my_health),
	    _ord        = damageTaken
	damageTaken = clamp(damageTaken - perma_armor, 1, damageTaken)
	damageTaken = clamp(damageTaken - armor, 0, damageTaken)
	Player.my_health += (_ord - damageTaken)
	//lsthealth = my_health
  if !roll_luck(((4 * item_get_count("celesteel")) / (item_get_count("celesteel") / 30 + 1))) && Player.armor > 0
	{
		Player.fx_steel = 1
    Player.armor--
		var _pitch = random_range(.8, 1.2)
    sound_play_pitch(sndSnowTankHurt, 1.2 * _pitch)
		sound_play_pitch(sndHitMetal, 1.2 *  _pitch)
		Player.shakeText += (room_speed / 10)
  }
	else Player.fx_celesteel = 6.5

	if (Player.armor < 0) {
	Player.armor++
	Player.shakeText += (room_speed / 10)
	}
}
// Eyes Custom Pickup Attraction: (big yokin thanks)
 with(instances_matching(Player, "race", "eyes"))
 {
	 if(canspec && button_check(index, "spec"))
	 {
		 var _vx = view_xview[index],
				 _vy = view_yview[index];

		 with(instances_matching(Pickup, "name", "CustomPickup")) if point_in_rectangle(x, y, _vx, _vy, _vx + game_width, _vy + game_height)
		 {
				 var l = (1 + skill_get(mut_throne_butt)) * current_time_scale,
						 d = point_direction(x, y, other.x, other.y),
						_x = x + lengthdir_x(l, d),
						_y = y + lengthdir_y(l, d);

					 if(place_free(_x, y)) x = _x;
					 if(place_free(x, _y)) y = _y;
		 }
	}
}

// pickup step
with instances_matching(Pickup, "name", "CustomPickup")
{
	//fx
	if tag = "infammo"
	{
		if irandom(19) = 0 with instance_create(x + random_range(-3, 3), y + random_range(-3, 3), GunWarrantEmpty) {image_xscale = .5; image_yscale = .5; image_angle = random(360)}
	}

	//collision
	if(mask_index == mskPickup && place_meeting(x, y, Pickup))
	{
		with(instances_meeting(x, y, instances_matching(Pickup, "mask_index", mskPickup)))
		{
			if(place_meeting(x, y, other))
			{
				if(object_index == AmmoPickup || object_index == HPPickup || object_index == RoguePickup)
				{
					motion_add_ct(point_direction(other.x, other.y, x, y) + random_range(-10, 10), 0.8);
				}
				with(other)
				{
					motion_add_ct(point_direction(other.x, other.y, x, y) + random_range(-10, 10), 0.8);
				}
			}
		}
	}

	if place_meeting(x + hspeed, y + vspeed, Wall){move_bounce_solid(false)}

	//animations
	if anim > 0 anim-- else
	{
		if image_index = 0 && image_speed = .5
		{
			image_speed = 0
			anim = 70 + irandom(20)
		}
		else{image_speed = .5}
	}

	//close range attraction
	if distance_to_object(Player) <= (20 + 12 * skill_get(mut_plutonium_hunger)) motion_set(point_direction(x, y, Player.x, Player.y), 4)

	//get picked up
	if place_meeting(x, y, Player) || place_meeting(x, y, PortalShock) || instance_exists(BigPortal)
	{
			 // run open code
			script_execute(on_pickup)

			 // fx
			instance_create(x, y,SmallChestPickup)
			instance_delete(id);
			exit;
	}
	//blink
	if lifetime <= room_speed * 3{if current_frame mod 2 = 0 image_alpha++; if image_alpha > 1 image_alpha = 0}

	//disappear after a while
	if lifetime > 0 {lifetime -= tag = "infammo" ? 2 : 1} else{sound_play_pitch(sndPickupDisappear, random_range(.8, 1.2)); instance_create(x, y,SmallChestFade); instance_destroy()}
}

// chest step
with instances_matching(chestprop, "name", "ItemChest")
{
	 if "tag" in self switch tag
	 {
		 case "gold"   : if irandom(19) = 0 with instance_create( x+random_range(-8, 8), y+random_range(-13,13), CaveSparkle) depth = other.depth - 1;
		                 break;
		 case "cursed" : if irandom( 4) = 0 instance_create(x+random_range(-5, 5), y+random_range( -8, 8), Curse);
		 								 break;
		 case "item"   : image_index  = item_index.spr_index;
		 								 y -= sin(current_frame / 10) / 4 / (room_speed / 30);
		 							 	 spr_shadow_y  += sin(current_frame / 10) / 4 / (room_speed / 30);
										 break;
		 case  "coin"  : image_index  = item_index.spr_index;
		 								 y -= sin(current_frame / 10) / 4 / (room_speed / 30);
										 spr_shadow_y  += sin(current_frame / 10) / 4 / (room_speed / 30);
										 if irandom(4)  = 0 instance_create(x+random_range(-10, 10) - 7, y + random_range( -8, 8), Curse);
										 if irandom(24) = 0 with instance_create(x+random_range(-10, 10) - 7, y + random_range( -8, 8), Smoke){image_xscale = .25; image_yscale = .25; gravity = -.1};
										 break;
	 }

	 if place_meeting(x, y, Player) || place_meeting(x, y, PortalShock) || instance_exists(BigPortal)
	 {

			if button_pressed(Player.index, "pick") && mod_variable_get("mod", "main", "coins") <= 0
			{
				sound_play_pitch(sndClick, random_range(0.8, 1.2))
				with instance_create(Player.x, Player.y, PopupText)
				{
					text = "@wNot enough"
					time = 10;
				}
			}
			if (tag != "cursed") || button_pressed(Player.index, "pick") && mod_variable_get("mod", "main", "coins") >= 1
			{
				if (tag == "cursed")
				{
					mod_variable_set("mod", "main", "coins", mod_variable_get("mod", "main", "coins") - 1)
					Player.cursedFlash = (3 -(room_speed / 30)) * 5
				}
				script_execute(on_open)

				// fx
			  instance_create(x, y, FXChestOpen);
			  if tag = "coin"{repeat(5)	with instance_create(x, y, Smoke){motion_add(random(360), random_range(2, 3))}}
			  with instance_create(x, y, ChestOpen) sprite_index = other.spr_open;

			 instance_delete(id);
		 }
	}
}

with (Player) if (my_health > maxhealth) my_health = maxhealth

//DEBUG
if instance_exists(Player) Player.debug2 = array_length_1d(global.PlayerItems) - 1


//Cheats--------------------------------------------------------------------------------------------------------------------------------------------------------
with (Player)
{
	if(button_pressed(index, "horn"))
	{

	if (Player.debug == true) || string_lower(player_get_alias(0)) = "karmelyth" || string_lower(player_get_alias(0)) = "endless goblet"
		{
			with shrine_create(mouse_x, mouse_y)
			{
				index = crwn_guns
				;
				shrine_setup();
			}
			with obj_create(mouse_x, mouse_y, "Item"){item_index = item[? "paragon"]}
		}
	}
}
//Timer
global.frame += current_time_scale; if (global.frame == 60) global.frame = 0;
//WHAT DO ITEMS DO YOU MAY ASK???

var extra_reload    = 0,
    extra_speed     = 0,
		extra_health    = 0,
		extra_accuracy  = 0,
		extra_damage    = 0;

//inside information (more damage to IDPD and they drop more stuff)
var amount = item_get_power("info")
var IDPD = [Grunt, Shielder, Inspector, EliteGrunt, EliteShielder, EliteInspector, Van, Last]
for (var i = 0, iLen = array_length_1d(IDPD); i < iLen; i++) {
var choice = IDPD[i]
if instance_exists(choice) {
with (choice) {
    if amount >= 1  {
    if "effect" not in self {
    my_health *= (1 - (amount * 0.2))
    effect = true;
    }}}}
with instances_matching_le(choice,"my_health",0){
    if roll_luck(10 * amount) { instance_create(Player.x, Player.y, AmmoPickup); } }
}
//inside information (more damage to IDPD and they drop more stuff)

//radi bandages (heal overtime)
var amount = item_get_power("bandages")
if amount >= 1 {
    with (Player) {
        var _x = (amount * 2); if (_x >= 15) _x = 15;
if (global.frame == 59) global.RadiGumdropTimer += maxhealth / (48 - (_x * 2)) // <--- Change this number (32) to be higher to make regen slower
if (floor(global.RadiGumdropTimer) >= 1) {
if (my_health < maxhealth) my_health += round(global.RadiGumdropTimer)
if (my_health > maxhealth) my_health = maxhealth
 global.RadiGumdropTimer = 0;
}}}
//radi bandages (heal overtime)

//Mechanical Lens (Homing)
var amount = item_get_power("lens")
if amount >= 1
{
	with instances_matching(projectile, "team", 2)
	{
    if object_index != Laser && object_index != Lightning && instance_exists(Player)
		{
    	if (forceSupport == true) || object_index != CustomProjectile
			{
       	if "slowed" not in self
			 	{
          speed /= (1 + .5 / amount);
          slowed = 1;
        }
        if distance_to_object(enemy) <= (32 / speed)
				{
        	near = instance_nearest(x, y, enemy);
       		if(instance_exists(near))
					{
	 					var _s = speed
   					motion_add(point_direction(x, y, near.x, near.y), speed * .85);
   					speed = _s;
   					image_angle = direction;
					}
				}
			}
		}
	}
}
//Mechanical Lens (Homing)

//Golden Shots (random crits)
var amount = item_get_power("golden")
if amount >= 1
{
	with instances_matching(projectile, "team", 2)
	{
		if "crit" not in self
		{
				if roll_luck(10 * amount)
				{
		    	extra_damage++;
		    	image_blend = merge_color(c_red, c_white, 0.2)
					sleep(10)
				}
				crit = 0
		}
	}
}
//Golden Shots (random crits)

//Radiated Snack
var amount = item_get_power("fruit")
if amount >= 1 {
with (Rad) {
if "Touched" not in self {
if distance_to_object(Player) <= 8 {
Touched = true;
with (Player) global.RadiatedSnackCounter += maxhealth / (250 / amount)
if floor(global.RadiatedSnackCounter) >= 1 {
   with (Player) if (my_health < maxhealth) {sound_play_pitch(sndHealthChest, 1.5); instance_create(x, y, HorrorTB); my_health += round(global.RadiatedSnackCounter)}
with (Player) if (my_health > maxhealth) my_health = maxhealth
global.RadiatedSnackCounter = 0;
sound_play_pitch(sndHPPickup, 1.3)
}}}}}
//Radiated Snack

//Rubber Projectile
var amount = item_get_power("rubber")
if amount >= 1
{
	with instances_matching(projectile, "team", 2)
	{
		if "extra_bounce" not in self extra_bounce = (amount)
	 }
}
//Rubber Projectile

//Bandit Mask
var amount = item_get_power("mask")
with (Player)
{
  if global.MaskCounter > 0
	{
	  if instance_exists(enemy) with enemy
		{
			for(i = 0; i < 5; i++)
			{
				if(alarm_get(i) > 2)
				{
					alarm_set(i, alarm_get(i) + 1 + mod_variable_get("mod", "main", "HardmodeGet") * .5);
				}
			}
		}
	}
}
//Bandit Mask

//Ancient Armor Plate
var amount = item_get_power("plate")
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

//Cryo Rounds
var amount = item_get_power("cryo")
if amount >= 1{with instances_matching(projectile, "team", 2){if place_meeting(x + hspeed, y + vspeed, enemy){instance_nearest(x, y, enemy).freezeTime = 25 * amount}}}

with instances_matching_ge(enemy, "freezeTime", 1)
{
	if "freezeTime" in self && object_index != BanditBoss && object_index != ScrapBoss && object_index != OasisBoss && object_index != Nothing && object_index != Nothing2 && object_index != HyperCrystal && object_index != FrogQueen && object_index != TechnoMancer && object_index != LilHunter
	{
		freezeTime--
		if freezeTime > 0
		{
			for(i = 0; i < 10; i++){alarm_set(i,alarm_get(i) + (freezeTime / 2))}
			f_var = freezeTime * 2; if f_var > 100 f_var = 100
			image_blend = merge_color(c_blue, c_white, (1 - (f_var / 100)))
		}
	}
}
//Cryo Rounds

//Incendiary Rounds
var amount = item_get_power("incendiary")
if amount >= 1{with instances_matching(projectile, "team", 2){if place_meeting(x + hspeed, y + vspeed, enemy){instance_nearest(x, y, enemy).OnFire = (4 + amount * 2) * (GameCont.area = 101 ? 0 : 1)}}}

with instances_matching_ge(enemy, "OnFire", 1)
{
  image_blend = merge_color(c_orange, c_white, 0.3)
	if (current_frame + id) mod 7 <= 1 && self != BigMaggotBurrow && self != RavenFly && self != LilHunterFly
	{
		with instance_create(x, y, Flame)
		{
			team = 2
			damage = 1 + amount * .35
			image_speed = 3
			force = 0
			direction = random(360)
		}
		instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Smoke)
		OnFire--
		if OnFire = 0{image_blend = merge_color(c_orange, c_white, 1)}
		if my_health <= 0 instance_create(x, y, GroundFlame)
	}

	//fx
	if irandom(4) = 0
	{
		with instance_create(x + random_range(-8, 8), y + random_range(-8, 8), BulletHit)
		{
			motion_set(90, 2)
			image_speed = 1
			image_xscale = .5
			image_yscale = .5
			depth = other.depth - 1
			sprite_index = sprGroundFlame
		}
	}
	if irandom(4) = 0
	{
		with instance_create(x + random_range(-8, 8), y + random_range(-8, 8), Smoke)
		{
			motion_set(90, 2)
			image_xscale = .4
			image_yscale = .4
			depth = other.depth - choose(0, 1, 1)
		}
	}
}
//Incendiary Rounds

//Fel Rounds
var amount = item_get_power("fel")
if amount >= 1 && roll_luck(4 + amount * 2) {with instances_matching(projectile, "team", 2){if place_meeting(x + hspeed, y + vspeed, enemy){instance_nearest(x, y, enemy).OnFel = true}}}
{with instances_matching(projectile, "isFel", true){if place_meeting(x + hspeed, y + vspeed, enemy){instance_nearest(x, y, enemy).OnFel = true}}}

with instances_matching_ge(hitme, "OnFel", 1)
{
  image_blend = merge_color(c_aqua, c_blue, 0.7)
	if (current_frame + id) mod 14 <= 1 && self != BigMaggotBurrow && self != RavenFly && self != LilHunterFly
	{
		with instance_create(x, y, Flame)
		{
			sprite_index = sprFireLilHunter
			team = -999
			damage = 1
			image_speed = 3
			force = 0
			direction = random(360)
		}
		instance_create(x + random_range(-4, 4), y + random_range(-4, 4), Smoke)
		if my_health <= 0 instance_create(x, y, BlueFlame)
	}

	//fx
	if irandom(4) = 0
	{
		with instance_create(x + random_range(-8, 8), y + random_range(-8, 8), BulletHit)
		{
			motion_set(90, 2)
			image_speed = 1
			image_xscale = .5
			image_yscale = .5
			depth = other.depth - 1
			sprite_index = choose(sprBlueFlame,sprBlueFlame,sprBlueFlameBig)
		}
	}
	if irandom(4) = 0
	{
		with instance_create(x + random_range(-8, 8), y + random_range(-8, 8), Smoke)
		{
			motion_set(90, 2)
			image_xscale = .4
			image_yscale = .4
			depth = other.depth - choose(0, 1, 1)
		}
	}

	if my_health <= 0 // explode
	{
		sleep(30)
		view_shake_at(x, y, 24)
		repeat(8 + 2 * amount)
		{
			with instance_create(x, y, Flame)
			{
				team = -999
				sprite_index = sprFireLilHunter
				motion_add(random(360), random_range(3, 6))
				isFel = true
			}
		}
		/*with instance_create(x, y, CustomSlash)
		{
			name = "Inv Area"
			lifetime = room_speed * 5
			maxradius = 32
			grow_speed = 4
			damage = 3
			candeflect = false
			sprite_index = mskNone
			mask_index   = sprBoltTrail
			team = -999
			// unrelated, but cool and could go with the cactus thing
			on_step       = inv_step
			on_hit        = inv_hit
			on_projectile = void
			on_grenade    = void
			on_anim       = void
		}*/
	}
}
//Fel Rounds

//Occult Artifact
var amount = item_get_power("artifact")
if amount >= 1
{
	with instances_matching_le(enemy,"my_health",0)
	{
		if instance_exists(Player) if roll_luck(10 + 15 * amount) repeat(size + 1) with instance_create(x + random_range(-5, 5), y + random_range(-5, 5), MeatExplosion) team = Player.team
	}
}
//Occult Artifact


//Slosher
var amount = item_get_power("slosher")
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
var amount = item_get_power("fungus")
if amount >= 1 {
    with instances_matching(projectile, "team", 2) {
        if "growth" not in self && object_index != Lightning {
        image_xscale += amount * .2
        image_yscale += amount * .2
        extra_damage += .5
				speed *= 1.1
        growth = true;
        }}
}
//Growth Fungus

//R-Wing
var amount = item_get_power("wing")
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
var amount = item_get_power("tools")
if amount >= 1
{
	with (projectile)
	{
	  if "jam" not in self && team != 2
		{
	  	if roll_luck(clamp(8 * amount, 0, 40)){instance_destroy(); exit}else{jam = true}
	  }
	}
}
//Sabotage Tools

//Metafillings
var amount = item_get_power("fillings")
if amount >= 1
{
	with(Pickup)
	{
	  if "filling" not in self && mask_index = mskPickup
		{
	  	filling = true
			num += roll(amount * .25)
	  }
	}
}
//Metafillings

//Bloody Lust
var amount = item_get_power("lust")
if amount >= 1 {
with (Player) if nexthurt == current_frame + 5 && !instance_exists(Portal){sleep(20); global.BloodCounter = (room_speed * 3 + room_speed * amount)}
if global.BloodCounter > 0 {
    if (global.BloodCounter != 1) && instance_exists(Player)
		{
			view_shake_at(Player.x, Player.y, 1)
			with (Player) image_blend = merge_color(c_red, c_white, 0.6)
    	extra_damage += 1.33
			extra_reload += .3
			if irandom(12) = 0 with instance_create(Player.x + random_range(-7, 7) + Player.hspeed, Player.y + random_range(-12, 2) + Player.vspeed, BulletHit){sprite_index = global.sprBerserkFX; image_angle = random(360); depth = Player.depth - 1; image_speed = .4}
		}
		extra_speed += 1 // dont make this scale
    global.BloodCounter--
}
if (global.BloodCounter = 1) with (Player){
	repeat(12){with instance_create(x + random_range(-7 ,7) + Player.hspeed, y + random_range(-7 ,7) + Player.vspeed, Dust){depth = Player.depth - 1; motion_add(random(360), random_range(1, 2))}}
  image_blend = merge_color(c_red, c_white, 1)
}
}

//Bloody Lust

//Liquid Nitrogen
//Check define draw
//Liquid Nitrogen

//Focus
var amount = item_get_power("focus")
if amount >= 1 {
    with (projectile) { if team != 2 && "Focus" not in self{
    image_xscale = clamp(image_xscale - (amount * 0.05), .6, image_xscale - (amount * 0.05))
    image_yscale = clamp(image_yscale - (amount * 0.05), .6, image_yscale - (amount * 0.05))
    Focus = true;
    }}
}
//Focus

//Binky
var amount = item_get_power("binky")
if amount >= 1
{
	with (enemy) if "Shrink" not in self
	{
    var chance = roll_luck(6 + 8 * amount)
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
var amount = item_get_power("grease")
if amount >= 1
{
	if instance_exists(Player) with instances_matching(projectile, "team", Player.team)
	{
		if "grease" not in self
		{
			friction /= (1 + (.3 * amount))
			grease = true
			speed *= 1.15
		}
	}
}
//Bullet Grease

var amount = item_get_power("gumdrop")
if amount >= 1
{
	with Rad
	{
		if !instance_is(self, BigRad) && "gumdrop_flag" not in self
		{
			gumdrop_flag = true;
			if roll_luck(amount) = true && irandom(2) = 0
			{
				sound_play_pitchvol(sndRadPickup, random_range(.7, .85), .4)
				repeat(8) with instance_create(x + random_range(-3, 3), y + random_range(-3, 3), EatRad){image_speed = random_range(.35, .5); sprite_index = choose(sprEatRad, sprEatBigRad,sprEatRad, sprEatBigRad, sprEatRadPlut, sprEatBigRadPlut)}
				instance_create(x, y, BigRad)
				instance_delete(self);
			}
		}
	}
}

//Forgotten Gift
    //Check get_item()
//Forgotten Gift

//Mini-Mush
var amount = item_get_power("mush")
if amount >= 1
{
	with (Player)
	{
	  var _size = amount * 0.075; if (_size > .6) _size = .6
	  image_xscale = 1 - _size
	  image_yscale = 1 - _size
		size -= _size * .25
		extra_speed += .2
	}
}
//Mini-Mush

//Gun God's Blessing
var amount = item_get_power("blessing")
if amount >= 1
{
  with (projectile) if "blessed" not in self && "sacred" not in self && team = 2
	{
		if roll_luck((1 - 1/(.15 * amount + 1))*100) with instance_create(x,y,object_index) // hyperbolic item stacking
		{
			motion_set(other.direction,other.speed*1.2)
			image_angle = direction
			team = other.team;
			sprite_index = other.sprite_index
      sound_play_pitch(sndPopgun, random_range(.8, 1.2))
			sound_play_pitchvol(sndPopPop, random_range(.8, 1.2), .3)
			blessed = 1
		}
    blessed = 1;
	}
}
//Gun God's Blessing

//Gun Boots
var amount = item_get_power("boots")
if amount >= 1 && instance_exists(Player)
{
	with Player
	{
		if "BootsTime" not in self BootsTime = 0;
		if "BootRight" not in self BootRight = 1; // Shameful display

		extra_speed += .1;
		if (nexthurt == current_frame + 5 && !instance_exists(Portal)) BootsTime = room_speed * (1.5 + amount * .5)

		if BootsTime > 0
		{
			extra_speed += .4;
			BootsTime--;
			if BootsTime mod (max(round(12 - speed), 1) * current_time_scale) = 0 && speed > 1
			{
				BootRight *= -1;
				sound_play_pitchvol(sndPopgun, 1 + BootRight * .7, .7);

				with instance_create(x, y, Bullet2)
				{
					team    = other.team;
					creator = other;
					move_contact_solid(other.direction + other.BootRight * 20, 24)
					motion_add(other.direction - 180, 9);
					image_angle = direction;
				}
			}
		}
	}
}
//Gun Boots

//Teleporter Siphon
var amount = item_get_power("siphon")
if amount >= 1 && instance_exists(Player)
{
	if point_in_teleporter(Player) = true extra_reload += .1 + (.2 * amount)
}
//Teleporter Siphon

//Firewood
var amount = item_get_power("firewood")
if amount >= 1 && instance_exists(Player){
    with (Player) if "firewoodCharge" not in self { Player.firewoodCharge = 0 }
    with (Player) if "firewoodKills" not in self { Player.firewoodKills = 0 }
with instances_matching_le(enemy,"my_health",0){
Player.firewoodCharge += (amount)
Player.firewoodKills++
}
with (Player) if my_health < lsthealth {
repeat(Player.firewoodCharge) with instance_create(Player.x, Player.y, FlameShell) {
direction = random_range(1, 360)
speed = random_range(10, 15)
image_angle = direction
team = 2;
Player.firewoodCharge = 0;
}
}
	if (Player.firewoodKills) >= 10
	{
	  with instance_create(Player.x, Player.y, PopupText)
		{
		   text = "@(sprGroundFlame)" + "@y " + string(Player.firewoodCharge)
		   time = 5
		}
	  Player.firewoodKills = 0;
	}
}
//Firewood

//Ammo Extractor
var amount = item_get_power("extractor")
if amount >= 1
{
	with instances_matching_le(enemy, "my_health", 0) if size > 0
	{
		if irandom(99) < ((1 - 1 / (.3* amount *(1 * 1 + (skill_get(mut_rabbit_paw)) * .4) +1)) * 100 * (.1 + (Player.infammo > 0 ? 1 : 0) * .2))
		with obj_create(x, y, "CustomPickup")
		{
			tag = "infammo"
			sprite_index = global.sprInfammoPickup
		}
	}
}
//Ammo Extractor

//Glowing Fern
var amount = item_get_power("fern")
if amount >= 1
{
	with instances_matching_le(enemy, "my_health", 0) if size > 0
	{
		if irandom(99) < ((1 - 1 / (.3* amount *(1 * 1 + (skill_get(mut_rabbit_paw)) * .4) +1)) * 100 * (.1 + (Player.infammo > 0 ? 1 : 0) * .2))
		with obj_create(x, y, "CustomPickup")
		{
			tag = "fern"
			sprite_index = global.sprFernPickup
		}
	}
}
//Glowing Fern

//Chopper
var amount = item_get_power("chopper")
if amount >= 1
{
  with (Player)
	{
		var Near = instance_nearest(x, y, enemy)
		if distance_to_object(Near) <= (16 + amount)
		{
      if current_frame mod max(room_speed * 2 - amount * 2, 1) = 0 with instance_create(x, y, Shank)
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
var amount = item_get_power("locket")
if amount >= 1
{
	with instances_matching_le(enemy, "my_health", 0)
	{
		if size > 1 && roll_luck((5 + (1.7 * amount))/(1 + amount * .1)) // 7% base chance to drop chest + 2% per stack
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

// Merc Canteen
var amount = item_get_power("canteen")
if amount >= 1
{
	with instances_matching_le(enemy, "my_health", 0)
	{
		if size > 0
		{
			if irandom(99) < ((1 - 1/(.08 * amount / (1 + Player.armor * .1) * (1 + skill_get(mut_rabbit_paw) * .4) + 1))*100 * .6)
			with obj_create(x, y, "CustomPickup")
			{
				tag = "armor"
				sprite_index = global.sprArmorPickup

			}
		}
	}
}
// Merc Canteen

//Scrap Missile
var amount = item_get_power("missile")
if amount >= 1 && instance_exists(Player){extra_damage += (Player.armor + Player.perma_armor) * (.05 + .025 * amount)}
//Scrap Missile

//backup Heart
var amount = item_get_power("heart")
if amount >= 1 && instance_exists(Player)
{
	if Player.my_health <= 0
	{
		Player.my_health = 1
		Player.armor += 5;
		Player.invincibility += (room_speed) * 5;
		Player.redFlash = 10;
		sleep(300)
		sound_play_pitch(sndCrownBlood, 1.2)
		sound_play_pitch(sndLevelUltra, 0.8)
		with instance_create(Player.x, Player.y, PopupText) {text = "@q@rREVIVED"}
		remove_item(item[? "heart"])
		add_item(item[? "spent heart"], 1)
	}
}
//backup heart

//Explosive Rounds
var amount = item_get_power("explo")
if amount >= 1 && instance_exists(Player)
{
	with (Effect)
	{
		if object_index == BulletHit || object_index == LightningHit || object_index == DiscDisappear || object_index == DiscBounce
		{
			repeat(amount) instance_create(x, y, SmallExplosion)
			instance_destroy();
		}
	}
}
//Explosive Rounds

//Molding Clay
//Check opening chest script *
//Molding Clay

//Collider
var amount = item_get_power("collider")
if amount >= 1 && instance_exists(Player)
{
	with (projectile)
	{
		if (team = 2)
		{
			team = 3;
			damage *= (1 + (amount * .5))
		}
	}
}
//Collider

//Diamond Bullets
var amount = item_get_power("diamond")
if amount >= 1 && instance_exists(Player)
{
	Player.reloadspeed += (0.5 * amount)
	with (projectile)
	{
		if team == 2 && "diamond" not in self
		{
			diamond = true;
			damage *= (1.5 * amount)
			speed *= (1.2 + (amount * .1))
		}
	}
}
//Diamond Bullets

//Death's Scythe   /!\ NOT FINISHED /!\
var amount = item_get_power("scythe")
if amount >= 1 && instance_exists(Player)
{
		Player.deathCounter += (1 * amount)
		if (Player.deathCounter) >= (30 * (room_speed / 30)) / amount
		{
			var HURT = (round(Player.maxhealth / 8))
			if (HURT < 0) HURT = 1
			Player.my_health -= HURT
			Player.deathCounter = 0;
		}
		with instances_matching_le(enemy,"my_health",0){
		var HEAL = round(Player.maxhealth / 16) if HEAL < 1 { HEAL = 1}
		Player.my_health += HEAL * amount
	}
}

//Death's Scythe

//Sharp CD
var amount = item_get_power("CD")
if amount >= 1 && instance_exists(Player)
{
	chance = round(random_range(1,5))
	if chance = (1) {
	with instances_matching_le(enemy,"my_health",0)
	{
		repeat(round(amount))with instance_create(x, y, Disc)
		{
			direction = random(360)
			speed = 6
			dist = 10 + irandom(15)
		  image_xscale = 1
		  image_yscale = 1
		  team = -100;
		}
	}
	}
}
//Sharp CD

//Dark Pearl
var amount = item_get_power("Dpearl")
if amount >= 1 && instance_exists(Player)
{
with (enemy) {
	if place_meeting(x, y, Curse)
	{
	my_health -= 1 / (room_speed / 30)
	image_blend = merge_color(c_purple, c_white, 0.5);
	touchingCurse = true;
	} else {
	if "touchingCurse" in self && touchingCurse == true {
	image_blend = merge_color(c_purple, c_white, 1);
	touchingCurse = false;
	}
	}
}
with instances_matching(projectile, "team", 2){
	image_blend = merge_color(c_purple, c_white, 0.3);
	if place_meeting(x + hspeed, y + vspeed, enemy){
		with instance_nearest(x, y, enemy) cursed = 1;
			with instances_matching_ge(hitme, "cursed", 1)
{
		repeat(4) with instance_create(x+random_range(-10, 10), y+random_range(-10, 10), Curse) {
			direction = (random_range(0, 360))
			speed = random_range(1, 5)
		}
		//sound_play_pitch(sndExplosion, 2)
		}
	}
	//instance_create(x+random_range(-5, 5), y+random_range(-5, 5), Curse)
	with instance_create(x+random_range(-5, 5), y+random_range(-5, 5), Curse) {
	direction = (random_range(0, 360))
	speed = random_range(1, 1.2)
	}
	}
}
//Dark Pearl

//Prismatic Key
var amount = item_get_power("key")
if amount >= 1 && instance_exists(Player)
{
	with (Player) {
if "KeyHealth" not in self {
	KeyHealth = 3
}

if Player.my_health < Player.lsthealth {
	KeyHealth--
	with instance_create(x, y, PopupText) {
		time = 10
		chance = round(random_range(1, 2))
		if (Player.KeyHealth > 0) {
		if (chance = 1) { text = "*CRACK*"; sound_play_pitch(sndPlantPotBreak, 1)}
		if (chance = 2) {text = "*SNAP*"; sound_play_pitch(sndIcicleBreak, 1)}
		} else {
		if (chance = 1) { text = "@r@q*CRACK*"; sound_play_pitch(sndPlantPotBreak, 0.8)}
		if (chance = 2) {text = "@r@q*SNAP*"; sound_play_pitch(sndIcicleBreak, 0.8)}
		remove_item(item[? "key"])
		add_item(item[? "keyB"], 1)
		Player.KeyHealth = 3;
		}
	}
}
}

}
//Scale health with level
if (GameCont.level >= 2) { extra_health += 3} // 4
if (GameCont.level >= 3) { extra_health += 3} // 4
if (GameCont.level >= 4) { extra_health += 4} // 8
if (GameCont.level >= 5) { extra_health += 5} // 18
if (GameCont.level >= 6) { extra_health += 5} // 30 //Health currently doesn't increase with level due to the stat chanes /!\
if (GameCont.level >= 7) { extra_health += 5} //50
if (GameCont.level >= 8) { extra_health += 5} // 80
if (GameCont.level >= 9) { extra_health += 5} // 100
//Stat changes

if instance_exists(Player)
{
	Player.reloadspeed =  Player.reloadspeed_base  + extra_reload + (skill_get(mut_stress) * (1 - Player.my_health/Player.maxhealth)) + ultra_get(char_venuz, 1)   * .4
	Player.maxspeed    =  Player.speed_base        + extra_speed  + (skill_get(mut_extra_feet) * .5)
	Player.maxhealth   = round((Player.health_base + extra_health + (skill_get(mut_rhino_skin) *  4)                                  + ultra_get(char_crystal, 1) *  6) - item_get_count("injury"))
	with instances_matching(projectile, "team", Player.team)
	{
		if "damage_boost" not in self
		{
			damage_boost = true
			damage *= (Player.damage_base + extra_damage)
		}
	}
}

with instances_matching(EnemyBullet2, "sloshed", true){if speed <= friction + 1 instance_destroy()}

if instance_exists(Player) Player.lsthealth = Player.my_health
#define draw_gui

//Drawing Red flash from blood god's blood armor
with (Player) if "redFlash" in self {
draw_set_alpha(Player.redFlash / 10)
draw_set_color(c_red)
draw_rectangle(0, 0, game_width, game_height, 0);
if (Player.redFlash > 0) Player.redFlash -= 0.5
}
draw_set_alpha(1)
draw_armor()
//Drawing Boss Health Bar
if bossBars = true
{
	var Boss = [BanditBoss, HyperCrystal, FrogQueen, OasisBoss, LilHunter, Nothing2, Nothing, ScrapBoss, TechnoMancer, Turtle, SuperFireBaller],
	    _mxh = 0,
			_myh = 0,
			_amo = 0,
			_nam = "";
	for(var i = 0; i < array_length_1d(Boss); i += 1)
	{
		if instance_exists(Boss[i]) && instance_exists(Player)
		{
			with Boss[i] if "tag" in self && tag = "boss"
			{
				_myh += my_health;
				_mxh += maxhealth;
				_amo++;
			}
			switch Boss[i]
			{
				case BanditBoss     : _nam = "BIG BANDIT"   ; break;
				case HyperCrystal   : _nam = "HYPER CRYSTAL"; break;
				case FrogQueen      : _nam = "MOM"          ; break;
				case OasisBoss      : _nam = "BIG FISH"     ; break;
				case LilHunter      : _nam = "LIL HUNTER"   ; break;
				case Nothing        : _nam = "THRONE"       ; break;
				case Nothing2       : _nam = "THRONE II"    ; break;
				case ScrapBoss      : _nam = "BIG DOG"      ; break;
				case TechnoMancer   : _nam = "TECHNOMANCER" ; break;
				case Turtle         : _nam = "SEWER TURTLE" ; break;
				case SuperFireBaller: _nam = "MANSION GANG" ; break;
				default: _nam = "BOSS"; break;
			}
		}
		if _myh != 0
		{
			draw_X = -154 + game_width / 2
			draw_Y = 220

			draw_set_color(c_black);draw_rectangle(-1 + draw_X, 13 + draw_Y    , 308 + draw_X, 0 + draw_Y    , false)
			draw_set_color(c_white);draw_rectangle( 0 + draw_X, 11 + draw_Y    , 307 + draw_X, 1 + draw_Y    , false)
			draw_set_color(c_black);draw_rectangle( 1 + draw_X,  8 + draw_Y + 2, 306 + draw_X, 0 + draw_Y + 2, false)

			global.BarLength = max(0, (_myh/ (global.BossBarMaxHP > _mxh ? global.BossBarMaxHP : _mxh) * 306)) //health * length / maxhealth
			if _myh > 0
			{
				draw_set_color(c_red);draw_rectangle(1 + draw_X, 10 + draw_Y, (global.BarLength) + draw_X, 3 + draw_Y, false)
			}
			draw_set_font(fntSmall)

			if _amo > 1 draw_text_nt(game_width / 2 - 152, 224, "+" + string(_amo - 1))

			draw_set_halign(1)
			draw_set_font(fntM)
			draw_text_nt(game_width / 2, 210, _nam)
			draw_set_halign(0)
		}
	}
	if _mxh > global.BossBarMaxHP || _mxh = 0 {global.BossBarMaxHP = _mxh};
}

draw_set_halign(fa_left)
draw_set_alpha(1); draw_set_color(c_white)
draw_set_font(fntM0)

//ITEM POPUP + ITEM DESCRIPTIONS-------------------------------------------------------------------------------------------------------------
if (global.descriptionTimer > 0)
{
  var	draw_x   = game_width / 2,
	    draw_y   = 262,
			x_offset = global.descriptionTimer = room_speed * 4 ? 1 : 0,
			_item    = global.itemGet,
			_mult    = global.ItemGetAmount,
			_multx   = string_width(string_upper(_item.name)),
			_alpha   = 1;
  global.descriptionTimer--
  if (global.descriptionTimer = 0)
  {
		x_offset-= (30 - global.descriptionTimer)
		_alpha /= 2
	}
  var draw_x = -120
	draw_set_alpha(_alpha)
	draw_sprite(sprBossNameSplat, 3, game_width / 2 + draw_x + x_offset + 36, 210)
	draw_sprite(sprScoreSplat   , 2, game_width / 2 + draw_x + x_offset + 146, 216)
	switch _item.tier
	{
		case 0 : draw_set_color(c_white); break;
		case 1 : draw_set_color(c_lime) ; break;
		case 2 : draw_set_color(c_red)  ; break;
	}
  draw_text_nt(game_width / 2 + draw_x + sprite_get_width(global.sprItems) + 42 + x_offset, 202, string_upper(_item.name));
	draw_set_font(fntSmall)
	if _mult > 1 draw_text_nt(game_width / 2 + draw_x + sprite_get_width(global.sprItems) + 42 + x_offset + _multx, 202, "@yx" + string(_mult))
  draw_set_halign(fa_left)
  draw_set_color(c_white)
  draw_set_font(fntChat)
  draw_text_nt(game_width / 2 + draw_x + sprite_get_width(global.sprItems) + 42 + x_offset, 211, _item.description_small);
  draw_x = -100
	draw_set_alpha(.15)
	draw_sprite(global.sprItemsBack, _item.tier, game_width / 2 + draw_x + 34 + x_offset, 219);
	draw_set_alpha(1)
	draw_sprite(global.sprItems    , _item.spr_index, game_width / 2 + draw_x + 34 + x_offset, 219);
}

#define draw_pause
draw_armor()

// dont make item collection draw when not on the main pause screen
var _e = false;
if !instance_exists(menubutton) || array_length_1d(global.PlayerItems) = 1 {_e = true}
with OptionMenuButton  _e = true
with AudioMenuButton   _e = true
with VisualsMenuButton _e = true
with GameMenuButton    _e = true
with ControlMenuButton _e = true
if _e = true exit

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

#define popoSpawn
var _roll = round(random_range(1, (100)))
if (_roll <= global.popoChance) repeat(2)instance_create(Player.x, Player.y, IDPDSpawn)

#define add_item(ITEM, AMOUNT)
var _itemarray     = global.PlayerItems,
    _need_new_item = true;

if AMOUNT > 0
{
	with _itemarray  //iterating through the item list using with, can reference variables since they are LWOs
	{
			if self.key == ITEM.key //self = the instance of an item in the array
			{
	        self.count += AMOUNT   //new item acquired, count increases
	        _need_new_item = false //we dont need to create a new instance of an item
	        break                  //stop going through the list, because a match was found
	    }
	}
	if _need_new_item
	{
	    var _newitem = lq_clone(ITEM);   //create a copy so that it isnt a pointer and can be freely manipulated
	    _newitem.count = AMOUNT          //example of that manipulation, count = 1 because it is a newly acquired item and you only have one
	    array_push(_itemarray, _newitem) //add the new item to the list of items
	}
}

#define remove_item(ITEM)
var _itemarray = global.PlayerItems;

with _itemarray
{
	if self.key == ITEM.key
	{
		self.count--
		if self.count <= 0
		{
			for (var i = 0,  j = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].key == ITEM.key {j = i;}}
			global.PlayerItems = array_delete(_itemarray, j)
		}
	}
}

#define item_get_count(ITEM)
var _amount = 0;
for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].key == ITEM {_amount = global.PlayerItems[i].count; break}}
return _amount;

#define item_get_power(ITEM)
var _amount = 0;
_amount += item_get_count(ITEM);
if item_get_count("pearl") > 0 _amount *= (1 + item_get_count("pearl") * .5)
return _amount;

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
		case "rusty"  : if _roll <= 97 {tem = global.CommonItems[round(random_range(0, array_length_1d(global.CommonItems) - 1))]    }
									  else           {tem = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]}
									  break;
		case "large"  : if _roll <= 94 {tem = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]}
									  else           {tem = global.RareItems[round(random_range(0, array_length_1d(global.RareItems) - 1))]        }
									  break;
		case "cursed"	: if _roll <= 99 {tem = global.CursedItems[round(random_range(0, array_length_1d(global.CursedItems) - 1))]    }
										break;
		case "test"   : tem = item[? "brooch"] // this is for testing
								    break;
		case "coin"   : if (global.cheats == false) tem = item[? "currency" ] // coin time
										if (global.cheats == true)  tem = item[? "Fcurrency"]
								    break;
		case "none"   :
		default       : if _roll <= 92 {tem = global.CommonItems[round(random_range(0, array_length_1d(global.CommonItems) - 1))]    }
									  if _roll >  92 {tem = global.UncommonItems[round(random_range(0, array_length_1d(global.UncommonItems) - 1))]}
                    if _roll >= 99 {tem = global.RareItems[round(random_range(0, array_length_1d(global.RareItems) - 1))]        }
									  break;
	}
	if tag == "item" || tag == "coin" with instance_create(x, y, CustomObject){on_step = antifx_step}
}

get_item(tem, amount)

// crown of hatred
if crown_current = 6 && place_meeting(x, y, Player) && tag != "item" && tag != "coin"
{
	projectile_hit(Player, 1, 0, random(360))
	repeat(16) with instance_create(x, y, Rad) motion_set(random(360), random_range(3, 6))
}

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
		x += sprite_get_width(global.sprItems) / 2
		spr_shadow_x = -8
		spr_shadow_y = 2
		break;
	case "coin" :
		sprite_index = global.sprItems
		image_index  = item_index.spr_index
		image_speed  = 0
		spr_open   = mskNone
		spr_shadow = shd16
		x += sprite_get_width(global.sprItems) / 2
		spr_shadow_x = -8
		spr_shadow_y = 2
		break;
}

#define reorder()
if array_length_1d(global.PlayerItems) > 1
{
	var amount_common   = 0,
			amount_uncommon = 0,
			amount_rare     = 0;
	inherited_items[0] = -4
	inherited_count[0]  =0
	for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 0{amount_common   += global.PlayerItems[i].count}};
	for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 1{amount_uncommon += global.PlayerItems[i].count}};
	for (var i = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier = 2{amount_rare     += global.PlayerItems[i].count}};
	for (var i = 0, j = 0, iLen = array_length_1d(global.PlayerItems); i < iLen; i++) {if global.PlayerItems[i].tier > 2{inherited_items[j] = global.PlayerItems[i];inherited_count[j] = global.PlayerItems[i].count; j++}};
	global.PlayerItems = []
	global.PlayerItems[0] = item[? "none"]
	if amount_common   > 0 {add_item(global.CommonItems[random_range(0, array_length(global.CommonItems))]    , amount_common  )}
	if amount_uncommon > 0 {add_item(global.UncommonItems[random_range(0, array_length(global.UncommonItems))], amount_uncommon)}
	if amount_rare     > 0 {add_item(global.RareItems[random_range(0, array_length(global.RareItems))]        , amount_rare    )}
	if array_length_1d(inherited_items) >= 1 for (var i = 0, iLen = array_length_1d(inherited_items); i < iLen; i++){add_item(inherited_items[i], inherited_count[i])}
	return true;
}
else return false;

#define roll(VALUE)
var _chance = irandom_range(1,100);
if _chance <= (frac(VALUE) * 100) return (VALUE - frac(VALUE) + 1) else return (VALUE - frac(VALUE));

#define roll_luck(VALUE)
var _chance = irandom_range(1,100),
    _luck   = item_get_power("coin") + ((item_get_power("gem") > 0 ? 3 : 0) + item_get_power("gem") * 2) * global.GemCoeff + (crown_current = 10 ? 7 : 0); // lucky coin + cracked gem + crown of luck
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
	if _chance <= VALUE {return true} else {return false}
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
	if (Player.armor < 0) && (Player.shakeText > 0) _s = "@g"
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

#define ror_pickup
var _pitch = random_range(.8, 1.2);
switch tag
{
	case "fern":
		global.MaskCounter += room_speed * (5 + round(num));
		with instance_create(x, y, PopupText)
		{
			target = Player;
			mytext = "+" + string(4 * round(other.num)) + " invisibility"
		}
		sound_play_pitch(sndAmmoPickup, _pitch)
		sound_play_pitchvol(sndBigCursedChest, 12 * _pitch, .1)
		break;
	case "armor":
		Player.armor += round(num);
		with instance_create(x, y, PopupText)
		{
			target = Player;
			mytext = "+" + string(round(other.num)) + " ARMOR"
		}
		sound_play_pitch(sndAmmoPickup, _pitch)
		sound_play_pitch(sndHitMetal, 3 * _pitch)
		Player.fx_celesteel = 6.5;
		break;
	case "infammo":
		if Player.infammo < room_speed * 3 Player.infammo += room_speed * (num + .2) * 4;
		with instance_create(x, y, PopupText)
		{
			target = Player;
			mytext = "INFINITE AMMO!"
		}
		sound_play_pitch(sndAmmoPickup, _pitch)
		break;
	default: repeat(num) with instance_create(x, y, PopupText){mytext = "INVALID TAG"}
}

#define instances_meeting(_x, _y, _obj)
var _tx = x,
    _ty = y;

    x = _x;
    y = _y;
    var r = instances_matching_ne(instances_matching_le(instances_matching_ge(instances_matching_le(instances_matching_ge(_obj, "bbox_right", bbox_left), "bbox_left", bbox_right), "bbox_bottom", bbox_top), "bbox_top", bbox_bottom), "id", id);
    x = _tx;
    y = _ty;
return r;

#define array_delete(_array, _index)
var  i = _index,
  _new = array_slice(_array, 0, i);

array_copy(_new, array_length(_new), _array, i + 1, array_length(_array) - (i + 1))
return _new;

#define inv_step
with instance_place(x, y, Player){if global.MaskCounter < room_speed * 5 global.MaskCounter += 2}
if image_xscale < maxradius
{
	image_xscale += grow_speed
	grow_speed *= .86
	image_yscale = image_xscale / 2
}
if lifetime > 0 lifetime-- else instance_destroy()

#define bulb_step
if lifetime > 0{lifetime -= current_time_scale}else{instance_delete(self)}

#define bulb_hit
if projectile_canhit(other) with other
{
	my_health -= other.damage;
	x -= lengthdir_x(speed, direction)/2;
	y -= lengthdir_y(speed, direction)/2;
}

#define inv_hit

#define void

#define shrine_setup()              return mod_script_call("mod", "shrines", "shrine_setup");
#define shrine_create(X, Y)         return mod_script_call("mod", "shrines", "shrine_create", X, Y);
#define point_in_teleporter(OBJECT) return mod_script_call("mod", "main"   , "point_in_teleporter", OBJECT);
