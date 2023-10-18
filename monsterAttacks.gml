//For entities, each is an array of values.
/*
  e[0] = String   //The name of the entity
  e[1] = int      //The sprite value the entity holds (see monsterSprites)
  e[2] = int      //The health value of the entity
  e[3] = int      //The magic value of the entity
  e[4] = int      //The damage value of the entity
  e[5] = int      //The armor value of the entity
  e[6] = int      //The amount of xp the entity gives on defeat 
  e[7] = boolean  //The current state of the entity (Can attack)
                    If this value is false and health is <= 0, then the entity is dead.
*/

//Simple Damage Type
#define attackMon_physical
  var user = argument0;
  var target = argument1;
  if(!(is_array(argument0) || is_array(argument0)))
  {
    show_debug_message("Arguments must be array.");
    return;
  }
  target[2] -= max((user[4] - target[5]), 0);
  
#define attackMon_element
  var user = argument0;
  var target = argument1;
  if(!(is_array(argument0) || is_array(argument0)))
  {
    show_debug_message("Arguments must be array.");
    return;
  }
  target[2] -= user[3];


//Status Effect
#define statusMon_dfDown
  

#define statusMon_burn

#define statusMon_



//State of the creature
#define stateDead





  