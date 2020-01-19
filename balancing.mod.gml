#define init


#define game_start

#define step
//GIVE PLAYER MORE HEALTH BASED ON LEVEL

with (Rad) {
    if "Balanced" not in self {
    var roll = round(random_range(1, 2))
    Balanced = true;
    if (roll = 1) instance_delete(self);
    break;
    }
}

if (GameCont.area = 2) with (FrogQueenBall) if "Balanced" not in self {
    var roll = round(random_range(1, 4))
    Balanced = true;
    if (roll > 1) instance_delete(self);
}
