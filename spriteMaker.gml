//IT WORKS SO WELL :D
/*  How it works
    Sprites are made in a seperate files using the provided methods.
    These will add the sprites to the spriteSheet and using methods inside here will give 
    easy access to sprites.
    spriteSheet is a 2d array which hold all sprites for a single project.
    
    NOTE: Please use the spriteMaker_surface_open_index() function, it's much easier and
          more reliable than spriteMaker_surface_open().
    
  Updates:
    v1.0: - Can hold sprites in a 1d array.
    v1.3: - Started testing for 2d array capabilities. Currently crashes on compile.
    v2.2: - Completed 2d array functionality. Copy and pasting of template allows for creation of sprites.
            (Requires the use of indexing to know where sprites are stored.)
    v2.6: - Made quicker to make sprites and more compact bybuilding functions 
            to do surface targeting and creation. This will save space and make less
            clutter on other code as the copy and pasting of the template is no longer needed.
    v2.7: - Fixed sprite creation. (The surface was made too small so the size was increased internally.)
          - Better error checking.
          - Less obtuse code.
          - spriteSheet no longer global; use drawSprite().
          - Fixed spriteMaker_surface_open() not adding to index [0,0]
    v2.8: - Fixed spriteSheet[0,0] being empty by making it global. Code from this was being compiled
            later so I made spriteSheet global again to prevent it from compiling later.
          - Added getSprite as quality of life.
          - Added drawSpriteStretch
          - Added spriteMaker_sprite_modify as sprites could not be changed in any way, drawn or not, after being
            created.
           
    
*/

global.spriteSheet[0, 0] = array_create(0); //Has to be global so it's compiled before other code.
tempSurf = surface_create(0,0);
arr = array_create(0);

onSurface = false;
spIndex = -1;
dx = 0;
dy = 0;

debugvar_i = 0;
debugvar_a = 0;

//--------------------------------------------------------------------------------------------------
// Sprite creation method --------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

#define spriteMaker_surface_open
  if(onSurface == true)
    return show_debug_message("Error: on_active_surface | Surface already active.");
  dx = floor(argument0) + 1;
  dy = floor(argument1) + 1;
  onSurface = true;
  tempSurf = surface_create(dx,dy);
  arr = array_create(0);
  surface_set_target(tempSurf);
  
#define spriteMaker_surface_open_index
  if(onSurface == true)
    return show_debug_message("Error: on_active_surface | Surface already active.");
  spIndex = argument2;
  spriteMaker_surface_open(argument0, argument1);

#define spriteMaker_surface_next
  if(onSurface == false)
    return show_debug_message("Error: off_active_surface | No surface active.");
  arr[array_length_1d(arr)] = newSprite(tempSurf);
  drawReset();
  surface_free(tempSurf);
  tempSurf = surface_create(dx,dy);
  surface_set_target(tempSurf);
  

#define spriteMaker_surface_close
  if(onSurface == false)
    return show_debug_message("Error: off_active_surface | No surface active.");
    
  drawReset();
  arr[array_length_1d(arr)] = newSprite(tempSurf);
  surface_free(tempSurf);
  if(spIndex == -1)
    addToSheet(arr);
  else
    addToSheet_index(arr, spIndex);
  onSurface = false;
  spIndex = -1;
  dx = 0;
  dy = 0;

#define spriteMaker_sprite_modify


#define drawSprite ///Draws a sprite using the position of a sprite in spriteSheet
  var temp = floor(argument0);
  var sub = floor(argument1);
  var xv = argument2;
  var yv = argument3;
  if(is_undefined(spriteSheet[temp,sub]))
    return 0;
  draw_sprite(spriteSheet[temp, sub], 0, xv, yv);
  
#define drawSpriteCentered
  var temp = floor(argument0);
  var sub = floor(argument1);
  var xv = argument2;
  var yv = argument3;
  xv -= sprite_get_width(spriteSheet[temp, sub])/2;
  yv -= sprite_get_width(spriteSheet[temp, sub])/2;
  drawSprite(temp,sub,xv,yv);
 
#define drawSpriteStretch


 
#define getSprite
  return spriteSheet[argument0,argument1];
  

//--------------------------------------------------------------------------------------------------
// Private/internal methods ------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

/*Adds to the spriteSheet. Sprite sheet holds all sprites in 2d array form.
    spriteSheet[i,j] = the i'th sprite, using subimage j
*/
#define addToSheet
/// @param {undefined} arr
/// addToSheet(arr)
  #args arr
  if(array_height_2d(spriteSheet) == 0)
    addToSheet_index(arr, 0);
  var s = array_height_2d(spriteSheet);
  for(var a = 0; a < array_length_1d(arr); a++)
    spriteSheet[s, a] = arr[a];
#define addToSheet_index
  var arr = argument0;
  var s = argument1;
  for(var a = 0; a < array_length_1d(arr); a++)
    spriteSheet[s, a] = arr[a];
    
//For making sprites, not putting in arrays
#define newSprite
  var temp = argument0; //A surface
  return  getNewSprite(temp, surface_get_width(temp), surface_get_height(temp), 0, 0);
#define newSprite_centered
  var temp = argument0; //A surface
  return getNewSprite(temp, surface_get_width(temp), surface_get_height(temp), surface_get_width(temp)/2, surface_get_height(temp)/2);

#define getNewSprite
  var a0 = argument0;
  var a1 = argument1;
  var a2 = argument2;
  var a3 = argument3;
  var a4 = argument4;
  return sprite_create_from_surface(a0, 0, 0, a1, a2, false, false, a3, a4);
    
#define drawReset
  draw_set_colour(c_white);
  draw_set_alpha(1);
  if(onSurface)
    surface_reset_target();  

//--------------------------------------------------------------------------------------------------
// Debugging and contents cecking methods ----------------------------------------------------------
//--------------------------------------------------------------------------------------------------

#define debug_spriteMaker_runThrough
  var arraySpeed = 0.2;
  if(debugvar_a >= array_length_2d(spriteSheet, floor(debugvar_i))) 
  { 
    debugvar_i = (debugvar_i+1)%array_height_2d(spriteSheet);
    debugvar_a = 0; 
  }else debugvar_a += arraySpeed;
  if(!(is_undefined(spriteSheet[debugvar_i,0])))
    drawSprite(debugvar_i,debugvar_a,32,32);

#define debug_spriteMaker_drawAll //Assumes all sprites of 1 kind are the same size. (No longer an issue as of 2.6)
  for(var xv = 0; xv < array_height_2d(spriteSheet); xv++)
  {
    if(is_undefined(spriteSheet[xv,0]))
      continue;
    var yPos = sprite_get_height(spriteSheet[xv,0]);
    var xPos = sprite_get_width(spriteSheet[xv,0]);
    for(var yv = 0; yv < array_length_2d(spriteSheet, xv); yv++)
      drawSprite(xv, yv, yPos*yv, xPos*xv);
  }
 