/*
TODO:
  - Allow user input and attacking
  -
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Game:
1.09.1: - Updated functions to match current version of GMLive.
        - Started patch notes tab.
1.09:   - Added foundation for enemies.
        - Created monster sprite.
        - Created menu sprites.
        - Added foundation for user input.
        - Corrected sprite drawing
        - Added foundation for icons and menu interactions.
        - Added foundation for monster attacking.
        - Added debug functions.
1.02 - 1.08: - Sprite Tool updates

----------------------------------------------------------------------------------------------------------------------------------------------------------------
Sprite Tool:
2.8: - Fixed spriteSheet[0,0] being empty by making it global. Code from this was being compiled
       later so I made spriteSheet global again to prevent it from compiling later.
     - Added getSprite as quality of life.
     - Added drawSpriteStretch
     - Added spriteMaker_sprite_modify as sprites could not be changed in any way, drawn or not, after being
       created.
2.7: - Fixed sprite creation. (The surface was made too small so the size was increased internally.)
     - Better error checking.
     - Less obtuse code.
     - spriteSheet no longer global; use drawSprite().
     - Fixed spriteMaker_surface_open() not adding to index [0,0]
2.6: - Made quicker to make sprites and more compact bybuilding functions 
       to do surface targeting and creation. This will save space and make less
       clutter on other code as the copy and pasting of the template is no longer needed.
2.2: - Completed 2d array functionality. Copy and pasting of template allows for creation of sprites.
      (Requires the use of indexing to know where sprites are stored.)
1.3: - Started testing for 2d array capabilities. Currently crashes on compile.
1.0: - Can hold sprites in a 1d array.

*/