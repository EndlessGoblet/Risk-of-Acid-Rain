#define init

  global.sprDisc  = sprite_add("sprites/projectiles/sprDisc.png" , 2,  7,  7);
  global.sprDiscS = sprite_add("sprites/projectiles/sprDiscS.png", 2,  3,  3);
  global.sprDiscL = sprite_add("sprites/projectiles/sprDiscL.png", 2, 13, 13);

  global.sprDiscLTrail  = sprite_add("sprites/projectiles/sprDiscLTrail.png" , 3, 12, 12);
  global.sprDiscLBounce = sprite_add("sprites/projectiles/sprDiscLBounce.png", 4, 12, 12);
  global.sprDiscLDie    = sprite_add("sprites/projectiles/sprDiscLDie.png"   , 6, 12, 12);

  global.sprChopper      = sprite_add("sprites/projectiles/sprChopper.png"     , 1, 9, 9);
  global.sprChopperStick = sprite_add("sprites/projectiles/sprChopperStick.png", 1, 9, 9);


#macro current_frame_active (current_frame < floor(current_frame) + current_time_scale)


/// SHRINE OF DEATH GRENADE

#define create_deathnade(X, Y)
  with instance_create(X, Y, CustomProjectile)
  {
    name = "death grenade";
    size = choose(1, 1, 1, 1, 1, 2, 2)
    depth = TopCont.depth - 1

    switch size
    {
      case 1:
        sprite_index = sprGrenade;
        break;
      case 2:
        sprite_index = sprMininade;
        break;
    }
    mask_index = mskNone;

    team   = -10000;
    damage = 0;
    force  = 0;
    friction = .5;

    zspeed = 16 + irandom(8);
    zbase  = zspeed;
    z = .1
    grav = 1;

    on_draw    = deathnade_draw;
    on_step    = deathnade_step;
    on_hit     = deathnade_destroy;
    on_destroy = deathnade_destroy;

    return self;
  }

#define deathnade_step
  if z > 0
  {
    zspeed -= grav
    z += zspeed*current_time_scale
    if zspeed < -12 zspeed = -12
  }else instance_destroy()

  #define deathnade_destroy
  switch size
  {
    case 1:
      sound_play(sndExplosionS);
      instance_create(x, y, SmallExplosion);
      break;
    case 2:
      sound_play(sndExplosion);
      instance_create(x, y, Explosion);
      break;
  }

#define deathnade_draw
  draw_sprite(sprite_index, 0, x, y - (z - zspeed));


/// CHOPPER ///

#define create_chopper(x, y)
  var melee = 1;
  with instance_create(x, y, melee ? CustomSlash : CustomProjectile)
  {
    name   = "chopper";

    damage = 6;
    force  = 3;
    pierce = 1;
    bounce = 0;
    typ    = 1;

    mask_index   = sprHeavyGrenadeBlink
    sprite_index = global.sprChopper;
    spr_dead     = global.sprChopperStick;

    anglespeed = 120
    draw_angle = random(360)
    length     = 6

    if melee
    {
      on_anim       = void
      on_projectile = chopper_proj
      on_grenade    = chopper_proj
    }

    on_wall     = chopper_wall
    on_hit      = chopper_hit
    on_step     = chopper_step
    on_end_step = chopper_end_step
    on_draw     = chopper_draw

    return id
  }

#define chopper_hit
  var d = other.my_health > damage/2,
      a = other;
  sleep(4);
  if projectile_canhit_melee(other) = true && pierce > 0 {pierce--; projectile_hit(other, damage, force, direction)}

#define chopper_wall
  var _p = random_range(.9, 1.2);
  if "extra_bounce" in self && extra_bounce <= 0 || "extra_bounce" not in self
  {
    sound_play_hit(sndChickenSword, 1.5 * _p)
    sound_play_hit(sndBoltHitWall, .8 * _p)
    sleep(2)
    with instance_create(x, y, CustomObject)
    {
      sprite_index = other.spr_dead
      image_angle = other.direction
      move_contact_solid(image_angle, 0)
      x += lengthdir_x(other.length, image_angle)
      y += lengthdir_y(other.length, image_angle)
      repeat(12)
      {
        with instance_create(x, y, Dust)
        {
          direction = other.image_angle + 180 + random_range(-35,35)
          speed = random(5)+1
          depth = choose(1,-1)
        }
      }
      if fork()
      {
        wait(45)
        if instance_exists(self) instance_destroy()
        exit
      }
      other.x = x
      other.y = y
    }
    chopper_end_step()
    instance_destroy()
  }
  else
  {
    extra_bounce--;
    move_bounce_solid(false);
    instance_create(x, y, Dust);
    direction += random_range(-7, 7);
  }

#define chopper_proj
  with other if typ > 0 instance_destroy()

#define chopper_draw
  draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, draw_angle + image_angle, image_blend, image_alpha)

#define chopper_step
  var aspeed = anglespeed * sign(hspeed) * current_time_scale;
  draw_angle -= aspeed;
  if skill_get(mut_bolt_marrow)
  {
    var q = instance_nearest_matching_ne(x, y, hitme, "team", team)
    if instance_exists(q) and q.mask_index != mskNone and point_distance(x, y, q.x, q.y) <= 20 * skill_get(mut_bolt_marrow) * 2 - length/6
    {
      x = q.x - hspeed_raw
      y = q.y - vspeed_raw
    }
  }

#define chopper_end_step
  var e = 0, w = 1.5;
  repeat(2){
      var aspeed = anglespeed * sign(hspeed) * current_time_scale;
      var a = draw_angle + image_angle - 45 * sign(image_yscale) + e, l = length;
      var c = 3;
      var _x2 = x + lengthdir_x(l, a), _y2 = y + lengthdir_y(l, a);
      for var i = 1; i <= c; i++{
          var _x = lerp(x, xprevious, i/c) + lengthdir_x(l, a + aspeed * i/c), _y = lerp(y, yprevious, i/c) + lengthdir_y(l, a + aspeed * i/c);
          with instance_create(_x2, _y2, BoltTrail){
              image_yscale = w - .2*i/c
              image_xscale = point_distance(x, y, _x, _y)
              image_angle = point_direction(x, y, _x, _y)
          }
          _x2 = _x
          _y2 = _y
      }
      w /= 2
      e += 180
  }


/// DISCS ///

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
      var q = instance_nearest_matching_ne(x,y,hitme,"team",pi)
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


/// OTHER ///

#define instance_nearest_matching_ne(X,Y,OBJECT,VARNAME,VALUE)
  var num = instance_number(OBJECT),
      man = instance_nearest(X,Y,OBJECT),
      mans = [],
      n = 0,
      found = -4;
  if instance_exists(OBJECT)
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

#define void
