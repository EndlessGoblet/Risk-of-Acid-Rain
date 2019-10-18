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

with instances_matching_le(enemy,"my_health",0){
var roll = round(random_range(1, 10))
if roll == 1 {
    instance_create(x, y, AmmoPickup)
}
}

with (GameCont) {
    if (level == 2)  if ("boost1") not in self { Player.my_health += 3;Player.boost1 = 1; } // 4
    if (level == 3)  if ("boost2") not in self { Player.my_health += 3;Player.boost2 = 1; } // 4
    if (level == 4)  if ("boost3") not in self {  Player.my_health += 4;Player.boost3 = 1; } // 8
    if (level == 5)  if ("boost4") not in self {  Player.my_health += 5;Player.boost4 = 1; } // 18
    if (level == 6)  if ("boost5") not in self {  Player.my_health += 5;Player.boost5 = 1; } // 30 //Health currently doesn't increase with level due to the stat chanes /!\
    if (level == 7)  if ("boost6") not in self {  Player.my_health += 5;Player.boost6 = 1; } //50
    if (level == 8)  if ("boost7") not in self {  Player.my_health += 5;Player.boost7 = 1; } // 80
    if (level == 9)  if ("boost8") not in self {  Player.my_health += 5;Player.boost8 = 1; }  // 100

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