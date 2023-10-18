frame = 0;
spFrame = 0;
debugVar = 0;
background_colour = $000000;
delprev = 0;
global.gameState = 0;
offset = 3;
textoffset = 6;
textboxIndexX = 80;
textboxIndexY = 12;

fnt_default = font_add("Arial", 14, false, false, 32, 128);
fnt_menuLarge = font_add("Courier New", 14, false, false, 32, 128);
fnt_menuSmall = font_add("Courier New", 11, false, false, 32, 128);
draw_set_font(fnt_menuLarge);

bg_backgroundTest = background_create_colour(room_width, room_height, $BAFAC0);
bg1 = background_create_gradient(room_width, room_height, c_silver, c_black, 1);

//Ratio is 16:9 - 640x360
//Boxes
var rectCurveL = 6;
var rectCurveR = 0;

//Background
spriteMaker_surface_open_index(room_width, room_height, 0);
  // draw_set_alpha(1);
  // draw_set_colour(c_white);
  // draw_rectangle(0, 0, room_width, room_height, false);
  // draw_set_alpha(0.5);
  // draw_set_colour(c_olive);
  // draw_rectangle(0, 0, room_width, room_height, false);
  // draw_set_colour(c_white);
  // draw_rectangle(0, 0, room_width, room_height, true);
  // draw_rectangle(1, 1, room_width-1, room_height-1, true);
  draw_background(bg_backgroundTest, 0, 0);
spriteMaker_surface_close();

//Top bar
spriteMaker_surface_open_index(room_width, round(room_height/12), 1);
  draw_set_colour(c_silver);
  draw_set_alpha(1);
  draw_roundrect_ext(0, 0, room_width, room_height/12, rectCurveR, rectCurveL, false);
  draw_set_colour(c_navy);
  draw_set_alpha(0.35);
  draw_roundrect_ext(0, 0, room_width, room_height/12, rectCurveR, rectCurveL, false);
  draw_set_alpha(0.4);
  draw_roundrect_ext(offset, offset, room_width - offset, room_height/12 - offset, rectCurveR, rectCurveL, false);
  draw_set_colour(c_black);
  draw_set_alpha(1);
  draw_roundrect_ext(0, 0, room_width, room_height/12, rectCurveR, rectCurveL, true);
  draw_roundrect_ext(offset, offset, room_width - offset, room_height/12 - offset, rectCurveR, rectCurveL, true);
spriteMaker_surface_close();

//Center Area
spriteMaker_surface_open_index(room_width, round(room_height - room_height/12 - room_height/4), 2);
  draw_set_alpha(1);
  draw_set_colour(c_white);
  draw_background(bg1,0,0);
spriteMaker_surface_close();

//Bottom bar
spriteMaker_surface_open_index(room_width, round(room_height *(1/4)), 3);
  //Box
  draw_set_colour(c_silver);
  draw_set_alpha(1);
  draw_roundrect_ext(0, 0, room_width, room_height/4, rectCurveR, rectCurveL, false);
  draw_set_colour(c_navy);
  draw_set_alpha(0.35);
  draw_roundrect_ext(0, 0, room_width, room_height/4, rectCurveR, rectCurveL, false);
  draw_set_alpha(0.4);
  draw_roundrect_ext(offset, offset, room_width - offset, room_height/4 - offset, rectCurveR, rectCurveL, false);
  draw_set_colour(c_black);
  draw_set_alpha(1);
  draw_roundrect_ext(0, 0, room_width, room_height/4, rectCurveR, rectCurveL, true);
  draw_roundrect_ext(offset, offset, room_width - offset, room_height/4 - offset, rectCurveR, rectCurveL, true);
  
  //Text
  draw_set_colour($FFFFFF);
  draw_text(textoffset + textboxIndexX*0, textoffset + textboxIndexY*0, "Lorem ipsum dolor sit amet");
spriteMaker_surface_close();


//For entities, each is an array of values.
/*
  //Max is 5 monsters
  
  e[0] = String   //The name of the entity
  
  e[1] = int      //The sprite position in spriteSheet
  e[2] = int      //The current sprite index
    //ex: spriteSheet[1,0] is sprite 1 subimage 0;
    
  e[3] = int      //The health value of the entity
  e[4] = int      //The magic value of the entity
  e[5] = int      //The damage value of the entity
  e[6] = int      //The armor value of the entity
  e[7] = int      //The amount of xp the entity gives on defeat 
  
  e[8] = boolean  //The current state of the entity (Can attack)
                    If this value is false and health is <= 0, then the entity is dead.
                    
  e[9] = float    //x position on screen
  e[10] = float   //y position on screen
*/

mon1 = makeArray("Slime", 4, 0, 12, 0, 3, 0, 50, true);
mon2 = makeArray("Slime", 4, 0, 12, 0, 3, 0, 50, true);
mon3 = makeArray("Slime", 4, 0, 12, 0, 3, 0, 50, true);
monster[0] = mon1;
monster[1] = mon1;
monster[2] = mon1;
// monster[3] = mon1;
// monster[4] = mon1;
numEnemies = array_length_1d(monster);

// cursor_sprite = getSprite(10,0);
// window_set_cursor(cr_none);

#define step
  // step event code
  switch(keyboard_key)
  {
    case(vk_up):
    case(ord("W")):
    
      break;
      
    case(vk_down):
    case(ord("S")):
    
      break;
      
    case(vk_enter):
    case(vk_space):
    case(vk_right):
    case(ord("D")):
    case(ord("X")):
      
      break;
      
    case(vk_backspace):
    case(vk_left):
    case(ord("A")):
    case(ord("Z")):
      
      break;
      
    case(vk_escape):
      
      break;
  }


#define draw
  drawReset();
  drawSprite(0, 0, 0, 0);
  //drawSprite(2, 0, 0, sprite_get_height(getSprite(1,0)));
  drawSprite(1, 0, 0, 0);
  drawSprite(3, 0, 0, sprite_get_height(getSprite(1,0)) + sprite_get_height(getSprite(2,0)));
  drawCurrentMonsters();
  debug_drawMonNum();
  drawName(monster[0], c_white);
  

  
#define scr_show
  // define scripts like this
  draw_text(10, 10 + sin(frame / 0.7) * 3, argument0);
  
#define drawCurrentMonsters
  for(var i = 0; i < numEnemies; i++)
    monster[i,2] = spFrame;
  for(var i = 0; i < numEnemies; i++)
  {
    var spW = sprite_get_width(getSprite(monster[i,1], 0));
    var spH = sprite_get_height(getSprite(monster[i,1], 0));
    var posX = room_width/2;
    var posY = room_height/3 + spH/4;
    var sep = 2;
    if(numEnemies == 1)
      posX -= spW/2;
    else if(numEnemies%2 == 0)
    {
      if(i <= numEnemies/2) posX -= spW*i*sep;
      else posX += spW*(i-numEnemies/2)*sep;
      posX += spW/2;
    }else
    {
      if(i < numEnemies/2) posX -= spW*i*sep;
      else posX += spW*(i-floor(numEnemies/2))*sep;
      posX -= spW/2;
    }
    drawSprite(monster[i,1], monster[i,2], posX, posY);
    
    //Position on monsters on screen for convinience.
    monster[i,9] = posX;
    monster[i,10] = posY;
  }
  
#define debug_drawMonNum
  for(var i = 0; i < numEnemies; i++)
  {
    var spW = sprite_get_width(getSprite(monster[i,1], 0));
    var spH = sprite_get_height(getSprite(monster[i,1], 0));
    var posX = room_width/2;
    var posY = room_height/3 + spH/4;
    var sep = 2;
    if(numEnemies == 1)
      posX -= spW/2;
    else if(numEnemies%2 == 0)
    {
      if(i <= numEnemies/2) posX -= spW*i*sep;
      else posX += spW*(i-numEnemies/2)*sep;
      posX += spW/2;
    }else
    {
      if(i < numEnemies/2) posX -= spW*i*sep;
      else posX += spW*(i-floor(numEnemies/2))*sep;
      posX -= spW/2;
    }
    
    draw_set_alpha(0.8);
    draw_set_colour($333333);
    draw_rectangle(posX,posY,posX+8,posY+12,false);
    
    draw_set_alpha(1);
    draw_set_colour($7777FF);
    draw_text(posX, posY, i);
  }

#define drawName
  var e = argument0;
  var c = argument1;
  draw_set_alpha(1);
  draw_set_colour(c);
  draw_set_font(fnt_menuLarge);
  draw_text(12, 9, e[0]);

#define makeArray
  var arr;
  for (var i = 0; i < max(argument_count, 7); i++)
      arr[i] = argument[i];
  return arr;
  
#define debug_Game_cycleCurrentsMobs
  debugVar = debugVar%60 + 1;
  trace(debugVar);
  if(debugVar == 60)
    numEnemies = (numEnemies)%array_length_1d(monster) + 1;

