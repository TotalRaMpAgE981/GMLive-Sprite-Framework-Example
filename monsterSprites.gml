var c1 = $8FFFAF;
var c2 = $11B410;
var c3 = $BDFBED;
spriteMaker_surface_open_index(64,64,4);
  //Main
  draw_set_alpha(1);
  draw_set_color(c2);
  draw_roundrect_ext(0, 32, 64, 64, 14, 16, false);
  draw_ellipse(0, 16, 64, 68, false);
  draw_set_color(c1);
  draw_roundrect_ext(1, 33, 63, 63, 14, 16, false);
  draw_ellipse(1, 17, 63, 67, false);
  draw_set_color(c2);
  draw_set_alpha(1);
  draw_rectangle(12, 63, 52, 64, false);
  //Details
  draw_set_color(c3);
  draw_set_alpha(0.8);
  draw_ellipse(16, 24, 30, 36, false);
  draw_ellipse(7, 34, 13, 40, false);
  draw_set_color(c2);
  draw_set_alpha(0.3);
  draw_ellipse(6, 49, 58, 61, false);
// spriteMaker_surface_next();
// spriteMaker_surface_next();
// spriteMaker_surface_next();
spriteMaker_surface_close();

//Troll

//Dragon





