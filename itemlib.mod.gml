#define init
  _init()
  items_finalize()

#define _init // put code here
  global.ItemDirectory = ds_map_create()
  global.defaultitem = {
      name              : "NO ITEM",
      description_small : "THIS SHOULDNT APPEAR",
  }

#macro c_stack  merge_color(c_dkgray, c_aqua, .5);
#macro c_speed  merge_color(c_white , c_aqua, .5);
#macro c_debuff merge_color(c_orange,  c_red,.35);
#macro item global.ItemDirectory

  // ITEM 0: NO ITEM (JUST IN CASE)
  #macro item_none item[? "none"]
  item_none = {
    name              : "NO ITEM", // item name
  	description_small : "THIS SHOULDNT APPEAR", // item description for the popup
  	description_large : "THIS SHOUDLN'T APPEAR#IF IT DOES#PLEASE CONTACT GOBLET ABOUT IT", // more detailed description for the pause menu
    description_width : 0, // width of the large descripton, relevant letters
    spr_index         : 0,  // index of the frame of the sprite for items
  	tier              : -1,  // -1 = untiered, 0 = common, 1 = uncommon, 2 = rare, 3 = cursed, 4 = unique, 5 = garbage, 6 = purified
    key               : "none"

  };


#macro item_ancient_armor_plate item[? "plate"] // ITEM 1: ANCIENT ARMOUR PLATE
  item_ancient_armor_plate = {
    name              : "Ancient Armor Plate",
  	description_small : "@s+@w2 @yarmor@s, less @wcontact damage @staken",
  	description_large : `@sGain @w2 @yArmor@s,#reduce @wcontact damage @sby @w50%@(color:${c_stack})(+50% per stack)`,
    description_width : 44,
  	spr_index         : 1,
  	tier              : 1

  };

#macro item_inside_information item[? "info"] // ITEM 2: INSIDE INFORMATION
  item_inside_information = {
    name              : "Inside Information",
  	description_small : "@bIDPD @sare @wweaker @sand drop @wmore",
  	description_large : `@sIncreases @rdamage @sdealt to @bIDPD members @sby @w20%@(color:${c_stack})(+20% per stack)#@sand @wdrop chance @sby @w25%@(color:${c_stack})(+25% per stack)`,
    description_width : 61,
    spr_index         : 2,
  	tier              : 0

  };

#macro item_horror_in_a_bottle item[? "horror"] // ITEM 3: HORROR IN A BOTTLE
  item_horror_in_a_bottle = {
    name              : "Horror in a bottle",
  	description_small : "@wEnemies @screate @gmini horrors @son @wdeath",
  	description_large : "finish this item mr. gobletto",
    description_width : 0,
  	spr_index         : 3,
  	tier              : 1

  };

#macro item_mechanical_lens item[? "lens"] // ITEM 4: MECHANICAL LENS
  item_mechanical_lens = {
    name              : "Mechanical Lens",
  	description_small : "@yprojectiles @sare @wslower @sand @phome",
  	description_large : "@sDecreases @wprojectile speed @sby @w50%#@wBullets @phome @sinto @wenemies @s up to @w16 meters @d(+16 meters per stack) away",
    description_width : 0,
    spr_index         : 4,
  	tier              : 1

  };

#macro item_incendiary_rounds item[? "incendiary"] // ITEM 5: INCENDIARY ROUNDS
  item_incendiary_rounds = {
    name              : "Incendiary Rounds",
  	description_small : "@wEnemies @scatch @rfire @supon taking @wdamage",
  	description_large : `@sYour @yprojectiles @sapply the @rburning @(color:${c_debuff})debuff@s,#@rburning @wenemies @stake @w9.45@(color:${c_stack})(+7.55 per stack) @rdamage`,
    description_width : 49,
    spr_index         : 5,
  	tier              : 1

  };

#macro item_pre_war_light_bulb item[? "bulb"] // ITEM 6: PRE-WAR LIGHT BULB
  item_pre_war_light_bulb = {
    name              : "Pre-War Light Bulb",
  	description_small : "@sGain a damaging @waura of light",
  	description_large : "@wEnemies 25 meters @d(+10.5 meters per stack)@saway from you#take @w0.1 damage @d(+0.05 damage per stack)",
    description_width : 55,
    spr_index         : 6,
  	tier              : 1

  };

#macro item_old_bandages item[? "bandages"] // ITEM 7: OLD BANDAGES, FORMERLY RADI GUMDROP
  item_old_bandages = {
    name              : "Old Banages",
  	description_small : "@s+@w1 @rmax HP",
  	description_large : `@sGain @w1@(color:${c_stack})(+1 per stack) @rmax HP`,
    description_width : 27,
  	spr_index         : 7,
  	tier              : 0

  };

#macro item_occult_artifact item[? "artifact"] // ITEM 8: OCCULT ARTIFACT
  item_occult_artifact = {
    name              : "Occult Artifact",
  	description_small : "@wEnemies @sexplode in @rblood @son @wdeath",
  	description_large : `@wEnemies @shave a chance of @w50%@(color:${c_stack})(+50% per stack) @sto create a @rBLOOD EXPLOSION`,
    description_width : 72,
    spr_index         : 8,
  	tier              : 2

  };

#macro item_slosher item[? "slosher"] // ITEM 9: SLOSHER
  item_slosher = {
    name              : "Slosher",
  	description_small : "@wShoot @sadditional @wshots",
  	description_large : `@sAll your @yprojectiles @sshoot @w2@(color:${c_stack})(+2 per stack) @gslosher pellets`,
    description_width : 58,
  	spr_index         : 9,
  	tier              : 2

  };

#macro item_growth_fungus item[? "fungus"] // ITEM 10: GROWTH FUNGUS
  item_growth_fungus = {
    name              : "Growth Fungus",
  	description_small : "@wstronger@s, larger @yprojectiles",
  	description_large : `@sIncreases @rdamage @sby @w50%@s,#@wprojectile size @sby @w20%@(color:${c_stack})(+20% per stack)@s,#@sand @wprojectile speed @sby @w10%`,
    description_width : 39,
  	spr_index         : 10,
  	tier              : 2

  };

#macro item_r_wing item[? "wing"] // ITEM 11: R-WING
  item_r_wing = {
    name              : "R-Wing",
  	description_small : "@sTake less @rdamage @sfrom @wheavy hits",
  	description_large : `@sYou can only lose @w%75@(color:${c_stack})(-15% per stack)#@sof your @rmax HP @sin one @whit`,
    description_width : 37,
  	spr_index         : 11,
  	tier              : 2

  };

#macro item_radiated_fruit item[? "fruit"] // ITEM 12: RADIATED FRUIT
  item_radiated_fruit = {
    name              : "Radiated Fruit",
  	description_small : "@gRads @smay @gheal @syou",
  	description_large : `@sEvery @w1 @sin @w250@(color:${c_stack})(/2 per stack)@g rads @gheals @w1#@sRads @gheal @wtwice as often@s for each @rmax HP`,
    description_width : 41,
  	spr_index         : 12,
  	tier              : 0

  };

#macro item_golden_shot item[? "golden"] // ITEM 13: GOLDEN SHOT
  item_golden_shot = {
    name              : "Golden Shot",
  	description_small : "@sChance to shoot @wstrong @yprojectiles",
  	description_large : `@sYour @yprojectiles @shave a @w10%@(color:${c_stack})(+10% per stack) @wchance#@sto deal @w100% @smore @rdamage`,
    description_width : 50,
  	spr_index         : 13,
  	tier              : 0

  };

#macro item_sabotage_tools item[? "tools"] // ITEM 14: SABOTAGE TOOLS
  item_sabotage_tools = {
    name              : "Sabotage Tools",
  	description_small : "@wEnemy @yprojectiles @ssometimes get @wjammed",
  	description_large : `@wEnemy @yprojectiles @shave an @w8%@(color:${c_stack})(+8% per stack)@s chance to become the @gplayers team`,
    description_width : 77,
  	spr_index         : 14,
  	tier              : 2

  };

#macro item_bandit_mask item[? "mask"] // ITEM 15: BANDIT MASK
  item_bandit_mask = {
    name              : "Bandit Mask",
  	description_small : "@sbecome @wstealthed @swhen leaving @pportals",
  	description_large : `@sbecome @wstealthed @sfor @w5@(color:${c_stack})(+4 per stack) @wseconds @swhen leaving @pportals`,
    description_width : 65,
  	spr_index         : 15,
  	tier              : 0

  };

#macro item_bloody_lust item[? "lust"] // ITEM 16: BLOODY LUST
  item_bloody_lust = {
    name              : "Bloody Lust",
  	description_small : "@sGo @rBerserk @swhen taking @rdamage",
  	description_large : `@sWhen you lose @rhealth, @wgain@s,#@(color:${c_speed})1 @wspeed@s,#@w33% @rdamage@s,#@w30% @wreload speed@s,#@sFor @w3 seconds@(color:${c_stack})(+1 second per stack)`,
    description_width : 34,
  	spr_index         : 16,
  	tier              : 1

  };

#macro item_rubber_rounds item[? "rubber"] // ITEM 17: RUBBER ROUNDS
  item_rubber_rounds = {
    name              : "Rubber Rounds",
  	description_small : "@yprojectiles @wbounce @soff of @wwalls",
  	description_large : `@sAll of your @yprojectiles @wbounce @sof off @wwalls 1@(color:${c_stack})(+1 per stack) @stime`,
    description_width : 64,
    spr_index         : 17,
  	tier              : 0

  };

#macro item_liquid_nitrogen item[? "nitrogen"] // ITEM 18: LIQUID NITROGEN
  item_liquid_nitrogen = {
    name              : "Liquid Nitrogen",
  	description_small : "@sGain an @waura @sthat deletes @yprojectiles",
  	description_large : `@sGain an @waura @sthat has a @wchance @sto delete enemy @yprojectiles@s,#@(color:${c_stack})(Deletions more common each stack)`,
    description_width : 59,
  	spr_index         : 18,
  	tier              : 1
  };

#macro item_focus item[? "focus"] // ITEM 19: FOCUS
  item_focus = {
    name              : "Focus",
  	description_small : "@wDamage up @snear active @rteleporters",
  	description_large : `@sIncrease @rteleporter @wrange @sby @w10%@s,#increase @rdamage @sby @w25%@(color:${c_stack})(+10% per stack) @snear @rteleporters`,
    description_width : 55,
    spr_index         : 19,
  	tier              : 0

  };

#macro item_binky item[? "binky"] // ITEM 20: BINKY
  item_binky = {
    name              : "Binky",
  	description_small : "@wEnemies @smay turn into @bbabies",
  	description_large : `@wEnemies @shave a @w4%@(color:${c_stack})(+3% per stack)@s chance to have,#@w-50% @(color:${c_speed})size@s,#@w-50% @rHealth`,
    description_width : 48,
  	spr_index         : 20,
  	tier              : 1

  };

#macro item_cryo_rounds item[? "cryo"] // ITEM 21: CRYO ROUNDS
  item_cryo_rounds = {
    name              : "Cryo Rounds",
  	description_small : "@wEnemies @sget @bstunned @supon taking @wdamage",
  	description_large : `@sYour @yprojectiles @sapply the @bfrozen @(color:${c_debuff})debuff @sfor @w1@(color:${c_stack})(+1 per stack) @wsecond @swith a @w7% chance@s,#@bfrozen @wenemies @scannot @gact @sor @wmove`,
    description_width : 68,
  	spr_index         : 21,
  	tier              : 1

  };

#macro item_forgotten_gift item[? "gift"] // ITEM 22: FORGOTTEN GIFT
  item_forgotten_gift = {
    name              : "Forgotten Gift",
  	description_small : "+@w3 @scommon @witems!",
  	description_large : "@sdrops @w3 common @sitems when picked up",
    description_width : 35,
  	spr_index         : 22,
  	tier              : 1

  };

#macro item_mini_mush item[? "mush"] // ITEM 23: MINI-MUSH
  item_mini_mush = {
    name              : "Mini-Mush",
  	description_small : "@sOne makes you @bsmall",
  	description_large : `Gain @w2 @(color:${c_speed})speed@s,#reduce @wsize @sby @w25%@(color:${c_stack})(-25% per stack)`,
    description_width : 34,
  	spr_index         : 23,
  	tier              : 0

  };

#macro item_perfect_prize item[? "prize"] // ITEM 24: PERFECT PRIZE
  item_perfect_prize = {
    name              : "Perfect Prize",
  	description_small : "@sTake no @wdamage@s, get @yrewarded",
  	description_large : `@sIf you survive an entire @warea @swithout losing any @rhealth@s,#@sThe next @warea@s will have @w1@(color:${c_stack})(+1 per stack) @ygolden chest`,
    description_width : 56,
  	spr_index         : 24,
  	tier              : 2

  };

#macro item_gun_gods_blessing item[? "blessing"] // ITEM 25: GUN GODS BLESSING
  item_gun_gods_blessing = {
    name              : "Gun God's Blessing",
  	description_small : "@sOccasional free @ypop pops",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 25,
  	tier              : 2

  };

#macro item_gun_boots item[? "boots"] // ITEM 26: GUN BOOTS
  item_gun_boots = {
    name              : "Gun Boots",
  	description_small : "@wPanic run @safter getting @whit",
  	description_large : `@sGain @w1 @(color:${c_speed})speed@s,#when @whit @sgain @w4 @(color:${c_speed})speed @sand shoot @yshells @sfor @w2@(color:${c_stack})(+.5 per stack) @wseconds`,
    description_width : 67,
  	spr_index         : 26,
  	tier              : 0

  };

#macro item_teleporter_siphon item[? "siphon"] // ITEM 27: TELEPORTER SIPHON
  item_teleporter_siphon = {
    name              : "Teleporter Siphon",
  	description_small : "@wReload @sfaster @snear active @rteleporters",
  	description_large : `@sIncrease @rteleporter @wrange @sby @w10%@s,#increase @wreload speed @sby @w30%@(color:${c_stack})(+20% per stack) @snear @rteleporters`,
    description_width : 61,
  	spr_index         : 27,
  	tier              : 1

  };

#macro item_bullet_grease item[? "grease"] // ITEM 28: BULLET GREASE
  item_bullet_grease = {
    name              : "Bullet Grease",
  	description_small : "@sDecreases @yprojectile @wfriction",
  	description_large : `@sIncreases @yprojectile @wspeed@s by @w15%@s,#@sDecreases @yprojectile @wfriction @sby @w15%@(color:${c_stack})(+15% per stack)`,
    description_width : 52,
  	spr_index         : 28,
  	tier              : 0

  };

#macro item_ammo_extractor item[? "extractor"] // ITEM 29: AMMO EXTRACTOR
  item_ammo_extractor = {
    name              : "Ammo Extractor",
  	description_small : "@wEnemies @smay drop @yinfammo packs",
  	description_large : `@wEnemies @shave a chance to drop @yinfammo packs#@yInfammo packs @sgrant @w3 seconds @sof @yInfinite ammo#@(color:${c_stack})(Chance increases per stack)`,
    description_width : 46,
  	spr_index         : 29,
  	tier              : 2

  };

#macro item_firewood item[? "firewood"] // ITEM 30: FIREWOOD
  item_firewood = {
    name              : "Firewood",
  	description_small : "@sKilling gains @ycharge@s, release @ycharge @son @whit",
  	description_large : `@sTaking @wdamage @sadds @y1 charge@(color:${c_stack})(+1 per stack) @sUpon taking#@wdamage, @srelease @yfire shells@s in random directions for each @ycharge.`,
    description_width : 65,
  	spr_index         : 30,
  	tier              : 1

  };

#macro item_chopper item[? "chopper"] // ITEM 31: CHOPPER
  item_chopper = {
    name              : "Chopper",
  	description_small : "@wEnemies @sshoot out @ychoppers @son @wdeath",
  	description_large : `@wEnemies @shave an @w8% chance@s to shoot out @w1@s to @w2@(color:${c_stack})(+1 per stack)#@wspinning @ychoppers@s on @wdeath,#@ychoppers @spierce through @w1@(color:${c_stack})(+1 per stack)@s enemies`,
    description_width : 59,
  	spr_index         : 31,
  	tier              : 0

  };

#macro item_broken_locket item[? "locket"] // ITEM 32: BROKEN LOCKET
  item_broken_locket = {
    name              : "Broken Locket",
  	description_small : "@wEnemies @sdrop @wrusty chests @son @wdeath",
  	description_large : `@wEnemies @shave a @w6%@(color:${c_stack})(+2% per stack) @schance to drop a @wrusty chest @supon death.#@wRusty chests @scontain mostly @wcommon @sitems`,
    description_width : 73,
  	spr_index         : 32,
  	tier              : 0

  };

#macro item_anomal_energy item[? "energy"] // ITEM 33: ANOMAL ENERGY
  item_anomal_energy = {
    name              : "Anomal Energy",
  	description_small : "@rTeleporters @sfinish @w10% earlier",
  	description_large : `@rTeleporters @sare fully @wcharged @sat @w90%@(color:${c_stack})(-10% per stack)@s,#finishing the @rteleporter @wevent kills @sall @wenemies`,
    description_width : 53,
  	spr_index         : 33,
  	tier              : 4

  };

#macro item_chaotic_brooch item[? "brooch"] // ITEM 34: CHAOTIC DICE
  item_chaotic_brooch = {
    name              : "Chaotic Brooch",
  	description_small : "@w+2 @guncommons@s, @wreorder @swhen leaving @pportals",
  	description_large : `@sdrops @w2 @guncommon @sitems when picked up,#@wreorder @syour @witems @swhen leaving @pportals`,
    description_width : 39,
  	spr_index         : 34,
  	tier              : 3
  };

#macro item_soulful_heater item[? "heater"] // ITEM 35: SOULFUL HEATER
  item_soulful_heater = {
    name              : "Soulful Heater",
  	description_small : "@sTurn 3 @rmax HP @sinto @w2 @ypermanent armor",
  	description_large : `@sLose @w3@(color:${c_stack})(+3 per stack) @rmax HP@s,#Gain @w2@(color:${c_stack})(+2 per stack) @ypermanent armor`,
    description_width : 36,
  	spr_index         : 35,
  	tier              : 3

  };

#macro item_lucky_coin item[? "coin"] // ITEM 36: LUCKY COIN
  item_lucky_coin = {
    name              : "Lucky Coin",
  	description_small : "@gLuck @sis on your side",
  	description_large : `@sGain @w1@(color:${c_stack})(+1 per stack) @gluck`,
    description_width : 25,
  	spr_index         : 36,
  	tier              : 1

  };

#macro item_glowing_fern item[? "fern"] // ITEM 37: GLOWING FERN
  item_glowing_fern = {
    name              : "Glowing Fern",
  	description_small : "@wEnemies @smay drop @wstealth packs",
  	description_large : `@wEnemies @shave a chance to drop @wstealth packs@s,#@wStealth packs @sgrant @w+5 seconds @sof @ystealth#@(color:${c_stack})(Chance increases per stack)`,
    description_width : 44,
  	spr_index         : 37,
  	tier              : 1

  };

#macro item_hard_times item[? "times"] // ITEM 38: HARD TIMES
  item_hard_times = {
    name              : "Hard Times",
  	description_small : "@sEverything is more @wdangerous",
  	description_large : `@sIncreased @wBoss @rHealth @sby @w10%@(color:${c_stack})(+10% per stack)@s,#@wdifficulty @sincreases @w50%@(color:${c_stack})(+50% per stack) @wfaster@s,#@yElite @wenemies @sappear more Often@s,#@wEnemies @gact @w15%@(color:${c_stack})(+15% per stack) @wfaster#@sand @w10%@(color:${c_stack})(+10% per stack) @smore @wenemies @sspawn`,
    description_width : 48,
  	spr_index         : 38,
  	tier              : 4

  };

#macro item_metal_plating item[? "metal"] // ITEM 39: STEEL PLATING
  item_metal_plating = {
    name              : "Metal Plating",
  	description_small : "@s+@w2 @yarmor @swhen leaving @pportals",
  	description_large : `@sGain @w2@(color:${c_stack})(+2 per stack) @yarmor @swhen leaving @pportals`,
    description_width : 47,
  	spr_index         : 39,
  	tier              : 0

  };

#macro item_cracked_gem item[? "gem"] // ITEM 40: CRACKED GEM
  item_cracked_gem = {
    name              : "Cracked Gem",
  	description_small : "@sYour @gluck @sis fluctuating",
  	description_large : `@sAt the start of an @warea@s, gain @wOR @sloose @w5 @gluck@(color:${c_stack})(+/-2 per stack)`,
    description_width : 61,
  	spr_index         : 40,
  	tier              : 3

  };

#macro item_celesteel item[? "celesteel"] // ITEM 41: CELESTEEL
  item_celesteel = {
    name              : "CELESTEEL",
  	description_small : "@s+@w5 @yarmor@s, chance to not lose @yarmor",
  	description_large : `@sGain @w5 @yarmor@s,#chance to not lose @yarmor @swhen getting hit@(color:${c_stack})(Chance increased per stack)`,
    description_width : 69,
  	spr_index         : 41,
  	tier              : 1

  };

#macro item_scrap_missile item[? "missile"] // ITEM 42: SCRAP MISSILE
  item_scrap_missile = {
    name              : "SCRAP MISSILE",
  	description_small : "@s+@w8 @yarmor@s, scale @wdamage @swith @yarmor",
  	description_large : `@sGain @w8 @yArmor@s,#Increase @rdamage @sby @w7.5%@(color:${c_stack})(+2.5% per stack) @sper @yarmor`,
    description_width : 50,
  	spr_index         : 42,
  	tier              : 2

  };

#macro item_mercenary_canteen item[? "canteen"] // ITEM 43: MERC'S CANTEEN
  item_mercenary_canteen = {
    name              : "MERC'S CANTEEN",
  	description_small : "@wEnemies @smay drop @yarmor packs",
  	description_large : `@wEnemies @shave a chance to drop @yarmor pickups@s,#@sThe more @yarmor @syou have, the lower the chance#@(color:${c_stack})(Chance increases per stack)`,
    description_width : 45,
  	spr_index         : 43,
  	tier              : 1

  };

#macro item_injury item[? "injury"] // ITEM 44: INJURY
  item_injury = {
    name              : "INJURY",
  	description_small : "@s-@w1 @rmax HP",
  	description_large : `@sLose @w1@(color:${c_stack})(+1 per stack) @rmax HP`,
    description_width : 27,
  	spr_index         : 44,
  	tier              : 4

  };

#macro item_backup_heart item[? "heart"] // ITEM 45: BACKUP HEART
  item_backup_heart = {
    name              : "BACKUP HEART",
  	description_small : "@sPrevent @wdeath @sonce",
  	description_large : "@sUpon @wdeath @srevive with @w5 @yarmor@s,#@w1 @rHP @sand @w5 seconds @sof @winvincibility#@sUsed up on @wdeath",
    description_width : 35,
  	spr_index         : 45,
  	tier              : 2
  };

#macro item_backup_heart_spent item[? "spent heart"] // ITEM 46: USED BACKUP HEART
  item_backup_heart_spent = {
    name              : "SPENT HEART",
  	description_small : "@sIt's all used up",
  	description_large : "@sWas once a @wBackup Heart, @sbut you died and now it's @dused",
    description_width : 55,
  	spr_index         : 46,
  	tier              : 5
  };

#macro item_fel_rounds item[? "fel"] // ITEM 47: FEL ROUNDS
  item_fel_rounds = {
    name              : "FEL ROUNDS",
  	description_small : "@yprojectiles @smake @wenemies explde @sinto @bfel fire",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 47,
  	tier              : 3
  };

#macro item_molding_clay item[? "clay"] // ITEM 48: MOLDING CLAY
  item_molding_clay = {
    name              : "MOLDING CLAY",
  	description_small : "@wChests @scontain @wdouble @sor@w nothing",
  	description_large : `@wItems @shave a @w1 @sin @w2@(color:${c_stack})(+1 per stack)@schance of#giving you @w1@(color:${c_stack})(+1 per stack) @Wextra @scopy,#otherwise @witems @sgive you @wnothing`,
    description_width : 42,
  	spr_index         : 48,
  	tier              : 3
  };

#macro item_nothing item[? "nothing"] // ITEM 49: NOTHING
  item_nothing = {
    name              : "NOTHING",
  	description_small : "@sIt's nothing",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 49,
  	tier              : 5
  };

#macro item_metafillings item[? "fillings"] // ITEM 50: METAFILLINGS
  item_metafillings = {
    name              : "METAFILLINGS",
  	description_small : "@yPickups @sare @yworth @w50% @smore",
  	description_large : `@wAll @ypickups @sgrant @w50%@(color:${c_stack})(+50% per stack) @smore benefits`,
    description_width : 51,
  	spr_index         : 50,
  	tier              : 2
  };

#macro item_small_accolade item[? "accolade"] // ITEM 51: SMALL ACCOLADE
  item_small_accolade = {
    name              : "SMALL ACCOLADE",
  	description_small : "@gHeal @swhen using @wshrines",
  	description_large : `@GHeal @w2@(color:${c_stack})(+2 per stack) @swhen activating @wshrines`,
    description_width : 44,
  	spr_index         : 51,
  	tier              : 1
  };

#macro item_crystal_rounds item[? "crystal"] // ITEM 52: CRYSTAL ROUNDS
  item_crystal_rounds = {
    name              : "CRYSTAL ROUNDS",
  	description_small : "@better @sand @bpricier @yprojectiles",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 52,
  	tier              : 3
  };

#macro item_death_scythe item[? "scythe"] // ITEM 53: SCYTHE
  item_death_scythe = {
    name              : "DEATH'S SCYTHE",
  	description_small : "@sDegernate @rHP, @skilling @gheals you",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 53,
  	tier              : 3
  };

#macro item_CD item[? "CD"] // ITEM 54: CD
  item_CD = {
    name              : "SHARP DISC",
  	description_small : "@wEnemies @sshoot @ydiscs @son @wdeath",
  	description_large : `@wEnemies @shave a chance to shoot @w1@(color:${c_stack})(+1 per stack) @ydiscs @son @wdeath#@sMultiple @ydiscs @smay become @wlarger @sinstead`,
    description_width : 61,
  	spr_index         : 54,
  	tier              : 3
  };

#macro item_currency item[? "currency"] // ITEM 55: CURSED COIN
  item_currency = {
    name              : "CURSED COIN",
  	description_small : "@sAmount of @pcursed coins @sgotten this run",
  	description_large : "@sAmount of @pcursed coins @syou've picked up this run#@pCursed Coins @scan be exchanged for @wgoods @sand @wservices",
    description_width : 52,
  	spr_index         : 55,
  	tier              : 5
  };

#macro item_sarkora item[? "sarkora"] // ITEM 56: SARKORA
  item_sarkora = {
    name              : "SARKORA",
  	description_small : "@s+@w50% item power@s, -@w25% @gmutation @wpower",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 56,
  	tier              : 3
  };

#macro item_papora item[? "papora"] // ITEM 57: PAPORA
  item_papora = {
    name              : "PAPORA",
  	description_small : "@s+@w50% @gmutation @wpower@s, -@w25% item power",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 57,
  	tier              : 3
  };

#macro item_Fcurrency item[? "Fcurrency"] // ITEM 58: FALSE COIN
  item_Fcurrency = {
    name              : "FAUX COIN",
  	description_small : "@dCheaters@s get @wfake coins",
  	description_large : "@swhen @rcheats @sare enabled, these drop instead of @pcursed coins.",
    description_width : 60,
  	spr_index         : 58,
  	tier              : 5
  };

#macro item_radi_gumdrop item[? "gumdrop"] // ITEM 59: RADI GUMDROP
  item_radi_gumdrop = {
    name              : "RADI GUMDROP",
  	description_small : "@sChance for @grads @sto turn into @gchunks",
  	description_large : `@gRads @shave a @w1%@(color:${c_stack})(+1% chance per stack) @wchance @sto turn into @grad chunks`,
    description_width : 67,
  	spr_index         : 59,
  	tier              : 0

  };

#macro item_idol_paragon item[? "paragon"] // ITEM 60: IDOL PARAGON
  item_idol_paragon = {
    name              : "IDOL PARAGON",
  	description_small : "@wShrines @sare more @wpowerful",
  	description_large : `@wShrines @sare each uniquely more @wpowerful#@(color:${c_stack})(Increased power per stack)`,
    description_width : 39,
  	spr_index         : 60,
  	tier              : 1

  };

#macro item_kalidos item[? "kalidos"] // ITEM 61: KALIDOS
  item_kalidos = {
    name              : "KALIDOS",
  	description_small : "@s+@w50% item power",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 61,
  	tier              : 6
  };

#macro item_kaliaxi item[? "kaliaxi"] // ITEM 62: KALIAXI
  item_kaliaxi = {
    name              : "KALIAXI",
  	description_small : "@s+@w50% @gmutation @wpower",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 62,
  	tier              : 6
  };

#macro item_key item[? "key"] // ITEM 63: PRISMATIC KEY
  item_key = {
    name              : "PRISMATIC KEY",
  	description_small : "@sFragile",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 63,
  	tier              : 5
  };

#macro item_keyB item[? "keyB"] // ITEM 64: PRISMATIC KEY (BROKEN)
  item_keyB = {
    name              : "BROKEN KEY",
  	description_small : "@sBroken, useless",
  	description_large : "-",
    description_width : 0,
  	spr_index         : 64,
  	tier              : 5
  };

#macro item_vile_flask item[? "flask"] // ITEM 65: VILE FLASK
  item_vile_flask = {
    name              : "VILE FLASK",
  	description_small : "@sApply @gblight @swith @gtoxic gas",
  	description_large : `@wEnemies @shurt by @ggas @sare given the @gblight @(color:${c_debuff})debuff#@gBlight @sdrains enemy @rhealth @wforever@s but cant @wkill @sthem`,
    description_width : 53,
  	spr_index         : 65,
  	tier              : 4
  };

#macro item_quartz_flower item[? "flower"] // ITEM 66: QUARTZ FLOWER
  item_quartz_flower = {
    name              : "QUARTZ FLOWER",
  	description_small : "@wall stats @sup, @wbreaks @son @whit",
    description_large : `@sGain @w2 @(color:${c_speed})speed@s,#@w200%@(color:${c_stack})(+200% per stack) @rdamage@s,#@w30%@(color:${c_stack})(+30% per stack) @wreload speed@s,#@w60%@(color:${c_stack})(+60% per stack) @yaccuracy @s,#@w2@(color:${c_stack})(+2 per stack) @rmax HP@s,#@w1@(color:${c_stack})(+1 per stack) @gluck`,
    description_width : 33,
    spr_index         : 66,
  	tier              : 2
  };

#macro item_broken_quartz_flower item[? "spent flower"] // ITEM 67: BROKEN QUARTZ FLOWER
  item_broken_quartz_flower = {
    name              : "BROKEN FLOWER",
  	description_small : "@sUseless, @wreturns @sfixed next @warea",
  	description_large : "@sWas once a @rQuartz Flower, @sbut you got @whit, @sand you @wbroke it.#@sWill return to a @rquartz flower@w next area.",
    description_width : 60,
    spr_index         : 67,
  	tier              : 5
  };

#macro item_digital_shield item[? "shield"] // ITEM 68: DIGITAL SHIELD
  item_digital_shield = {
    name              : "DIGITAL SHIELD",
  	description_small : "@sGain a rechargable @bshield",
  	description_large : `@sGain a rechargable @bshield @sthat blocks @wALL @rdamage @w1@(color:${c_stack})(+1 per stack) @stime#Recharges by @wkilling @w16@(color:${c_stack})(-1 per stack) @wenemies#`,
    description_width : 69,
  	spr_index         : 68,
  	tier              : 1
  };

#macro item_nuclear_exhaust item[? "exhaust"] // ITEM 69: NICE
  item_nuclear_exhaust = {
    name              : "NUCLEAR EXHAUST",
    description_small : "@sLose @grads @sinstead of @rhealth",
    description_large : `@gRads @sreplace your regular @rHealth#@sTaking @rdamage @scauses you to drop your @grads#@(color:${c_stack})(Rad drop/gain increased per stack)`,
    description_width : 42,
    spr_index         : 69,
    tier              : 3
  };

#macro item_double_edge item[? "edge"] // ITEM 70: DOUBLE-EDGE
  item_double_edge = {
    name              : "DOUBLE-EDGE",
    description_small : "@sDouble @wALL @yprojectile @rdamage",
    description_large : `@sIncrease @wAll @yprojectile @rdamage @sby @w100%@(color:${c_stack})(+100% per stack)`,
    description_width : 55,
    spr_index         : 70,
    tier              : 3
  };

#macro item_radiating_core item[? "core"] // ITEM 71: RADIATING CORE
  item_radiating_core = {
    name              : "RADIATING CORE",
    description_small : "@s+@w1 @grad @sper @wenemy",
    description_large : `@wEnemies @sdrop @w1@(color:${c_stack})(+1 per stack) @smore @grad`,
    description_width : 39,
    spr_index         : 71,
    tier              : 4
  };

#macro item_crystal_fragment item[? "fragment"] // ITEM 72: CRYSTAL FRAGMENT
  item_crystal_fragment = {
    name              : "CRYSTAL FRAGMENT",
    description_small : "@s+@w4 @rmax HP",
    description_large : `@sGain @w4@(color:${c_stack})(+1 per stack) @rmax HP`,
    description_width : 27,
    spr_index         : 72,
    tier              : 4
  };

#macro item_medical_tweezers item[? "tweezers"] // ITEM 73: MEDICAL TWEEZERS
  item_medical_tweezers = {
    name              : "MEDICAL TWEEZERS",
    description_small : "@gHeal @swhen leaving @pportals",
    description_large : `@gHeal @w1@(color:${c_stack})(+.5 per stack) @swhen leaving @pportals`,
    description_width : 42,
    spr_index         : 73,
    tier              : 0
  };

#macro item_stone_dagger item[? "dagger"] // ITEM 74: STONE DAGGER
  item_stone_dagger = {
    name              : "STONE DAGGER",
    description_small : "@sThe more @wenemies@s, the more @wdamage",
    description_large : `@sIncrease @rdamage @sby @w1%@(color:${c_stack})(+.5% per stack) @sfor each @wenemy alive`,
    description_width : 58,
    spr_index         : 74,
    tier              : 0
  };
  
#macro item_large_magnet item[? "magnet"] // ITEM 75: LARGE MAGNET
item_large_magnet = {
  name              : "LARGE MAGNET",
	description_small : "@sPulls items @wtowards @wthe teleporter",
	description_large : "@yPickups@s are pulled @wtowards @sthe @rteleporter",
	description_width : 41,
	spr_index         : 75,
	tier              : 1
};

#macro item_hazmat_gear item[? "gear"] // ITEM 76: HAZMAT GEAR (placeholder bro dont mind it)
item_hazmat_gear = {
  name              : "HAZMAT GEAR",
	description_small : "@s+@w6 @rmax HP@s, immunity @sto @blightning@s, @rfire @sand @gtoxic gas",
	description_large : "-",
  description_width : 1,
	spr_index         : 76,
	tier              : 2
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
