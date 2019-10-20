
#define init
_init()
items_finalize()

#define _init // put code here
global.ItemDirectory = ds_map_create()
global.defaultitem = {
    name              : "NO ITEM",
    description_small : "THIS SHOULDNT APPEAR",
}

#macro item global.ItemDirectory

// ITEM 0: NO ITEM (JUST IN CASE)
#macro item_none item[? "none"]
item_none = {
  name              : "NO ITEM", // item name
	description_small : "THIS SHOULDNT APPEAR", // item description for the popup
	description_large : "THIS SHOUDLN'T APPEAR#IF IT DOES#PLEASE CONTACT GOBLET ABOUT IT", // more detailed description for the pause menu
	spr_index         : 0,  // index of the frame of the sprite for items
	tier              : -1,  // -1 = untiered, 0 = common, 1 = uncommon, 2 = rare, 3 = cursed, 4 = unique
  key               : "none"

};

// ITEM 1: ANCIENT ARMOUR PLATE
#macro item_ancient_armor_plate item[? "plate"]
item_ancient_armor_plate = {
  name              : "Ancient Armor Plate",
	description_small : "@sReduced @wdamage @sfrom touching @wenemies",
	description_large : "@sTake @w50% @d(+50 per stack) from @wtouch damage",
	spr_index         : 1,
	tier              : 1

};

// ITEM 2: INSIDE INFORMATION
#macro item_inside_information item[? "info"]
item_inside_information = {
  name              : "Inside Information",
	description_small : "@bIDPD @sare @wweaker @sand drop @wmore",
	description_large : "@sIncreases @wdamage @sdealt to @bIDPD @smembers by @w20% @d(+20% per stack)#@sand gives them a @w25% @d(+25% per stack)@schance for them to drop an @yammo pickup",
	spr_index         : 2,
	tier              : 0

};

// ITEM 3: HORROR IN A BOTTLE
#macro item_horror_in_a_bottle item[? "horror"]
item_horror_in_a_bottle = {
  name              : "Horror in a bottle",
	description_small : "@wEnemies @screate @gmini horrors @son @wdeath",
	description_large : "finish this item mr. gobletto",
	spr_index         : 3,
	tier              : 1

};

// ITEM 4: MECHANICAL LENS
#macro item_mechanical_lens item[? "lens"]
item_mechanical_lens = {
  name              : "Mechanical Lens",
	description_small : "@wBullets @sare @wslower @sand @phome",
	description_large : "@sDecreases @wprojectile speed @sby @w50%#@wBullets @phome @sinto @wenemies @s up to @w16 meters @d(+16 meters per stack) away",
	spr_index         : 4,
	tier              : 1

};

// ITEM 5: INCENDIARY ROUNDS
#macro item_incendiary_rounds item[? "incendiary"]
item_incendiary_rounds = {
  name              : "Incendiary Rounds",
	description_small : "@wEnemies @scatch @rFire @supon taking @wDamage",
	description_large : "@wBullets @sput @wenemies @son @rFire, dealing @w0.04 damage @d(+0.04 damage per stack)",
	spr_index         : 5,
	tier              : 1

};

// ITEM 6: PRE-WAR LIGHT BULB
#macro item_pre_war_light_bulb item[? "bulb"]
item_pre_war_light_bulb = {
  name              : "Pre-War Light Bulb",
	description_small : "@sGain a damaging @waura of light",
	description_large : "@wEnemies 25 meters @d(+10.5 meters per stack)@saway from you#take @w0.1 damage @d(+0.05 damage per stack)",
	spr_index         : 6,
	tier              : 1

};

// ITEM 7: RADI GUMDROP
#macro item_radi_gumdrop item[? "gumdrop"]
item_radi_gumdrop = {
  name              : "Radi Gumdrop",
	description_small : "@gHeal @sover time",
	description_large : "@severy minute you have a chance of @w3,6% @d(+0.6% per stack) @gheal @sfor @w1 HP#@schance of @ghealing @sincreases by @w3,6% @d(+0.6% per stack) @swhen not @ghealed",
	spr_index         : 7,
	tier              : 0

};

// ITEM 8: OCCULT ARTIFACT
#macro item_occult_artifact item[? "artifact"]
item_occult_artifact = {
  name              : "Occult Artifact",
	description_small : "@wEnemies @sexplode in @rblood @son @wdeath",
	description_large : "@wEnemies @shave a chance of @w50% @d(+50% per stack) @sto create @w3 @rBLOOD EXPLOSIONS",
	spr_index         : 8,
	tier              : 2

};

// ITEM 9: SLOSHER
#macro item_slosher item[? "slosher"]
item_slosher = {
  name              : "Slosher",
	description_small : "@wShoot @sadditional @wshots",
	description_large : "@sAll your @yprojectiles @sshoot @w2 @d(+2 per stack) @g slosher pelletes @s dealing @w1 damage @seach",
	spr_index         : 9,
	tier              : 2

};

// ITEM 10: GROWTH FUNGUS
#macro item_growth_fungus item[? "fungus"]
item_growth_fungus = {
  name              : "Growth Fungus",
	description_small : "@wstronger@s, larger @yProjectiles",
	description_large : "kinda gave up starting here since its not really used sorry#-Karmelyth, 2019",
	spr_index         : 10,
	tier              : 2

};

// ITEM 11: R-WING
#macro item_r_wing item[? "wing"]
item_r_wing = {
  name              : "R-Wing",
	description_small : "@sTake less @wdamage @sfrom @wheavy hits",
	description_large : "-",
	spr_index         : 11,
	tier              : 2

};

// ITEM 12: RADIATED SNACK
#macro item_radiated_snack item[? "snack"]
item_radiated_snack = {
  name              : "Radiated Snack",
	description_small : "@gRads @gheal",
	description_large : "-",
	spr_index         : 12,
	tier              : 0

};

// ITEM 13: GOLDEN SHOT
#macro item_golden_shot item[? "golden"]
item_golden_shot = {
  name              : "Golden Shot",
	description_small : "@sChance to shoot @wstrong, @ygolden @wbullets",
	description_large : "-",
	spr_index         : 13,
	tier              : 0

};

// ITEM 14: SABOTAGE TOOLS
#macro item_sabotage_tools item[? "tools"]
item_sabotage_tools = {
  name              : "Sabotage Tools",
	description_small : "@wEnemy @sbullets sometimes get @wjammed",
	description_large : "-",
	spr_index         : 14,
	tier              : 2

};

// ITEM 15: BANDIT MASK
#macro item_bandit_mask item[? "mask"]
item_bandit_mask = {
  name              : "Bandit Mask",
	description_small : "@sStart new @wareas @winvisible",
	description_large : "-",
	spr_index         : 15,
	tier              : 0

};

// ITEM 16: BLOODY LUST
#macro item_bloody_lust item[? "lust"]
item_bloody_lust = {
  name              : "Bloody Lust",
	description_small : "@sGo @rBerserk @safter taking @wdamage",
	description_large : "-",
	spr_index         : 16,
	tier              : 1

};

// ITEM 17: RUBBER ROUNDS
#macro item_rubber_rounds item[? "rubber"]
item_rubber_rounds = {
  name              : "Rubber Rounds",
	description_small : "Bullets @ybounce @soff of @wWalls",
	description_large : "-",
	spr_index         : 17,
	tier              : 0

};

// ITEM 18: LIQUID NITROGEN
#macro item_liquid_nitrogen item[? "nitrogen"]
item_liquid_nitrogen = {
  name              : "Liquid Nitrogen",
	description_small : "Gain an @waura @sthat @wslows @senemy @wbullets",
	description_large : "-",
	spr_index         : 18,
	tier              : 1

};

// ITEM 19: FOCUS
#macro item_focus item[? "focus"]
item_focus = {
  name              : "Focus",
	description_small : "@wEnemy bullets @sare @wsmaller",
	description_large : "-",
	spr_index         : 19,
	tier              : 0

};

// ITEM 20: BINKY
#macro item_binky item[? "binky"]
item_binky = {
  name              : "Binky",
	description_small : "@wEnemies @shave a chance to become @bbabies",
	description_large : "-",
	spr_index         : 20,
	tier              : 1

};

// ITEM 21: CRYO ROUNDS
#macro item_cryo_rounds item[? "cryo"]
item_cryo_rounds = {
  name              : "Cryo Rounds",
	description_small : "@wEnemies @sget @bstunned @supon taking @wdamage",
	description_large : "-",
	spr_index         : 21,
	tier              : 1

};

// ITEM 22: FORGOTTEN GIFT
#macro item_forgotten_gift item[? "gift"]
item_forgotten_gift = {
  name              : "Forgotten Gift",
	description_small : "+2 @sCommon @wItems!",
	description_large : "-",
	spr_index         : 22,
	tier              : 1

};

// ITEM 23: MINI-MUSH
#macro item_mini_mush item[? "mush"]
item_mini_mush = {
  name              : "Mini-Mush",
	description_small : "@sOne makes you @bsmall",
	description_large : "-",
	spr_index         : 23,
	tier              : 0

};

// ITEM 24: PERFECT PRIZE
#macro item_perfect_prize item[? "prize"]
item_perfect_prize = {
  name              : "Perfect Prize",
	description_small : "@sTake no @wdamage@s, get @yrewarded",
	description_large : "-",
	spr_index         : 24,
	tier              : 2

};

// ITEM 25: GUN GODS BLESSING
#macro item_gun_gods_blessing item[? "blessing"]
item_gun_gods_blessing = {
  name              : "Gun God's Blessing",
	description_small : "@sOccasional free @ypop pops",
	description_large : "-",
	spr_index         : 25,
	tier              : 2

};

// ITEM 26: GUN BOOTS
#macro item_gun_boots item[? "boots"]
item_gun_boots = {
  name              : "Gun Boots",
	description_small : "@sWalk to @wshoot @sbehind you",
	description_large : "-",
	spr_index         : 26,
	tier              : 0

};

// ITEM 27: TELEPORTER SIPHON
#macro item_teleporter_siphon item[? "siphon"]
item_teleporter_siphon = {
  name              : "Teleporter Siphon",
	description_small : " @wreload @sfaster @snear active @rTeleporters",
	description_large : "-",
	spr_index         : 27,
	tier              : 1

};

// ITEM 28: BULLET GREASE
#macro item_bullet_grease item[? "grease"]
item_bullet_grease = {
  name              : "Bullet Grease",
	description_small : "@sDecreases @wprojectile friction",
	description_large : "-",
	spr_index         : 28,
	tier              : 0

};

// ITEM 29: AMMO EXTRACTOR
#macro item_ammo_extractor item[? "extractor"]
item_ammo_extractor = {
  name              : "Ammo Extractor",
	description_small : "@sGain @winfinite ammo @son @wkill",
	description_large : "-",
	spr_index         : 29,
	tier              : 2

};

// ITEM 30: FIREWOOD
#macro item_firewood item[? "firewood"]
item_firewood = {
  name              : "Firewood",
	description_small : "@sKilling gains @ycharge@s, release @ycharge @son @whit",
	description_large : "-",
	spr_index         : 30,
	tier              : 1

};

// ITEM 31: CHOPPER
#macro item_chopper item[? "chopper"]
item_chopper = {
  name              : "Chopper",
	description_small : "@sAuto @wshank @snearby enemies",
	description_large : "-",
	spr_index         : 31,
	tier              : 0

};

// ITEM 32: BROKEN LOCKET
#macro item_broken_locket item[? "locket"]
item_broken_locket = {
  name              : "Broken Locket",
	description_small : "@wEnemies @sdrop @wRusty Chests @son @wdeath",
	description_large : "-",
	spr_index         : 32,
	tier              : 0

};

// ITEM 33: ANOMAL ENERGY
#macro item_anomal_energy item[? "energy"]
item_anomal_energy = {
  name              : "Anomal Energy",
	description_small : "@rTeleporters @sfinish @w10% earlier",
	description_large : "-",
	spr_index         : 33,
	tier              : 4

};

// ITEM 34: CHAOTIC DICE
#macro item_chaotic_dice item[? "dice"]
item_chaotic_dice = {
  name              : "Chaotic Dice",
	description_small : "@w+2 @gUncommon @wItems@s, @wreorder @severy @warea",
	description_large : "-",
	spr_index         : 34,
	tier              : 3

};

// ITEM 35: SOULFUL HEATER
#macro item_soulful_heater item[? "heater"]
item_soulful_heater = {
  name              : "Soulful Heater",
	description_small : "@sTurn 25% @rMax HP @sinto @ypermanent armor",
	description_large : "-",
	spr_index         : 35,
	tier              : 3

};

// ITEM 36: LUCKY COIN
#macro item_lucky_coin item[? "coin"]
item_lucky_coin = {
  name              : "Lucky Coin",
	description_small : "@gLuck @sis on your side",
	description_large : "-",
	spr_index         : 36,
	tier              : 1

};

// ITEM 37: GLOWING FERN
#macro item_glowing_fern item[? "fern"]
item_glowing_fern = {
  name              : "Glowing Fern",
	description_small : "@gHeal @sbeyond @rmax health",
	description_large : "-",
	spr_index         : 37,
	tier              : 2

};

// ITEM 38: HARD TIMES
#macro item_hard_times item[? "times"]
item_hard_times = {
  name              : "Hard Times",
	description_small : "@sEverything is more @wdangerous",
	description_large : "-",
	spr_index         : 38,
	tier              : 4

};

// ITEM 39: STEEL PLATING
#macro item_metal_plating item[? "metal"]
item_metal_plating = {
  name              : "Metal Plating",
	description_small : "@s+@w2 @yArmor @sper @warea",
	description_large : "-",
	spr_index         : 39,
	tier              : 0

};

// ITEM 40: CRACKED GEM
#macro item_cracked_gem item[? "gem"]
item_cracked_gem = {
  name              : "Cracked Gem",
	description_small : "@sYour @gluck @sis fluctuating",
	description_large : "At the start of an area, gain +5 or -5 luck (+/-2 per stack)",
	spr_index         : 40,
	tier              : 3

};


// ITEM 41: CELESTEEL
#macro item_celesteel item[? "celesteel"]
item_celesteel = {
  name              : "CELESTEEL",
	description_small : "@s+@w5 @yArmor@s, chance to not lose @yarmor",
	description_large : "@sGain 5 @warmor @son pickup, and have a small chance to not lose armor upon being hit",
	spr_index         : 41,
	tier              : 1

};

// ITEM 42: SCRAP MISSILE
#macro item_scrap_missile item[? "missile"]
item_scrap_missile = {
  name              : "Scrap Missile",
	description_small : "@s+@w8 @yArmor@s, scale @wdamage @swith @yarmor",
	description_large : "-",
	spr_index         : 42,
	tier              : 2

};

// ITEM 43: INJURY
#macro item_scrap_missile item[? "injury"]
item_scrap_missile = {
  name              : "Injury",
	description_small : "@r-20% Max HP",
	description_large : "-",
	spr_index         : 43,
	tier              : 4

};
#define items_finalize()
var keys = ds_map_keys(global.ItemDirectory),
    len  = array_length(keys),
    _item,
    _defkeys = [],
    _defvalues = [],
    _defn = 0;
for var o = 0; o < lq_size(global.defaultitem); o++{
    array_push(_defkeys, lq_get_key(global.defaultitem, o))
    array_push(_defvalues, lq_get_value(global.defaultitem, o))
}
for var i = 0; i < len; i++ {
    _item = global.ItemDirectory[? keys[i]];
    _item.key = keys[i]
    _defn = 0
    with _defkeys {
        lq_set(_item, self, lq_defget(_item, self, _defvalues[_defn++]))
    }
}
