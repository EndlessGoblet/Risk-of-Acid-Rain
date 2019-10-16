#define init


#define game_start
with (Player) {
typ_ammo[1] += 20;	// +8 Bullets
	typ_ammo[2] += 5;	// +2 Shells
	typ_ammo[3] += 4;	// +2 Bolts
	typ_ammo[4] += 4;	// +2 Explosives
	typ_ammo[5] += 7;
}

#define step
//GIVE PLAYER MORE HEALTH BASED ON LEVEL
with (GameCont) {
    
    if (level == 2) with (Player) { if ("boost1") not in self { maxhealth += 2; my_health += 2; boost1 = 1; }} // 2
    if (level == 3) with (Player) { if ("boost2") not in self { maxhealth += 3; my_health += 4;boost2 = 1; }} // 4
    if (level == 4) with (Player) { if ("boost3") not in self { maxhealth += 4; my_health += 6;boost3 = 1; }} // 8
    if (level == 5) with (Player) { if ("boost4") not in self { maxhealth += 5; my_health += 8;boost4 = 1; }} // 18
    if (level == 6) with (Player) { if ("boost5") not in self { maxhealth += 5; my_health += 10;boost5 = 1; }} // 30
    if (level == 7) with (Player) { if ("boost6") not in self { maxhealth += 5; my_health += 12;boost6 = 1; }} //50
    if (level == 8) with (Player) { if ("boost7") not in self { maxhealth += 5; my_health += 14;boost7 = 1; }} // 80
    if (level == 9) with (Player) { if ("boost8") not in self { maxhealth += 5; my_health += 16;boost8 = 1; }}  // 100

}

with instances_matching_le(enemy,"my_health",0){
var roll = round(random_range(1, 10))
if roll == 1 {
    instance_create(x, y, AmmoPickup)
}
}

with (Rad) {
    if "Balanced" not in self {
    var roll = round(random_range(1, 2))
    Balanced = true;
    if (roll = 1) instance_delete(self);
    break;
    }
}

//Balancing Bosses
with (BanditBoss) if "Balanced" not in self {
    maxhealth *= 2
    my_health *= 2  
    Balanced = true;
}

with (FrogQueen) if "Balanced" not in self {
    maxhealth /= 1.5
    my_health /= 1.5
    Balanced = true;
}

if (GameCont.area = 2) with (FrogQueenBall) if "Balanced" not in self {
    var roll = round(random_range(1, 4))
    Balanced = true;
    if (roll > 1) instance_delete(self);
}