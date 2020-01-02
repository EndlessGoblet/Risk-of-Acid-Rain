#define init

global.sprDisc  = sprite_add("sprites/projectiles/sprDisc.png" , 2,  7,  7);
global.sprDiscS = sprite_add("sprites/projectiles/sprDiscS.png", 2,  3,  3);
global.sprDiscL = sprite_add("sprites/projectiles/sprDiscL.png", 2, 13, 13);

global.sprDiscLTrail  = sprite_add("sprites/projectiles/sprDiscLTrail.png" , 3, 12, 12);
global.sprDiscLBounce = sprite_add("sprites/projectiles/sprDiscLBounce.png", 4, 12, 12);
global.sprDiscLDie    = sprite_add("sprites/projectiles/sprDiscLDie.png"   , 6, 12, 12);


#macro current_frame_active (current_frame < floor(current_frame) + current_time_scale)

#define create_disc_small(X, Y)
with instance_create(X, Y, CustomProjectile)
{
    damage = 3;
    image_speed = .5;
    name = "Small Cursed Disc";
    sprite_index = global.sprDiscS;
    team = -100;

    disc_init()

    on_step = disc_step
    on_hit  = disc_hit
    on_wall = disc_wall

    return id
}

#define create_disc(X, Y)
with instance_create(X, Y, CustomProjectile)
{
    damage = 4;
    image_speed = .5;
    name = "Cursed Disc";
    sprite_index = global.sprDisc;
    team = -100;

    disc_init()

    on_step = disc_step
    on_hit  = disc_hit
    on_wall = disc_wall

    return id
}

#define create_disc_large(X, Y)
with instance_create(X, Y, CustomProjectile)
{
    damage = 6;
    image_speed = .5;
    name = "Large Cursed Disc";
    sprite_index = global.sprDiscL;
    team = -100;

    disc_init()

    spr_bounce = global.sprDiscLBounce
    spr_trail  = global.sprDiscLTrail
    spr_dead   = global.sprDiscLDie

    on_step = disc_step
    on_hit  = disc_hit
    on_wall = disc_wall

    return id
}

#define disc_init()
typ = 1
dist = 0
mask_index = mskDisc
spr_bounce = sprDiscBounce
spr_trail  = sprDiscTrail
spr_dead   = sprDiscDisappear
hitid      = [sprite_index, name]
on_destroy = disc_destroy

#define disc_step
disc_trail(speed/4)
if skill_get(mut_bolt_marrow){
    var q = instance_nearest_matching_ne(x,y,hitme,"team",lastteam)
    if instance_exists(q){
        if distance_to_object(q) < 30{
            var dir = point_direction(x,y,q.x,q.y)
            x += lengthdir_x(current_time_scale,dir)
            y += lengthdir_y(current_time_scale,dir)
        }
    }
}

#define disc_trail(dis)
dist += dis * current_time_scale
if speed > 0 and current_frame_active with instance_create(x, y, DiscTrail){sprite_index = other.spr_trail}

#define disc_hit
if projectile_canhit_melee(other) = true
{
  projectile_hit(other,damage+floor(speed/2),5,direction)
  sound_play_pitch(sndDiscHit,random_range(.8,1.2))
  view_shake_max_at(x, y, damage / 2)
}

#define disc_wall
move_bounce_solid(false)
direction += random_range(-6,6)
with instance_create(x,y,DiscBounce) sprite_index = other.spr_bounce
image_angle = direction
sleep(damage);
view_shake_at(x, y, damage / 2)
sound_play_pitch(sndDiscBounce,random_range(.9,1.1)+((speed/4)-1)*.2)
sound_play_pitch(sndBouncerBounce,random_range(1,1))
if dist > 250{instance_destroy();exit}

#define disc_destroy()
sound_play_hit(sndDiscDie, .2)
with instance_create(x, y, DiscTrail)
sprite_index = other.spr_dead

#define instance_nearest_matching_ne(X,Y,OBJECT,VARNAME,VALUE)
var num = instance_number(OBJECT),
    man = instance_nearest(X,Y,OBJECT),
    mans = [],
    n = 0,
    found = -4;
if instance_exists(obj)
{
    while ++n <= num && variable_instance_get(man,VARNAME) = VALUE || (instance_is(man,prop) && !instance_is(man,Generator))
    {
        man.x += 10000
        array_push(mans,man)
        man = instance_nearest(X,Y,OBJECT)
    }
    if variable_instance_get(man,VARNAME) != VALUE && (!instance_is(man,prop) || instance_is(man,Generator)) found = man
    with mans x-= 10000
}
return found
