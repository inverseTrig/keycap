use <../functions.scad>
include <../settings.scad>

// a low-profile take on cherry, sized for Kailh Choc V2 switches with
// MX (19.05mm) keycap spacing. shape and dish match cherry; total depth
// and tilt are reduced, and stem throw is shortened to the ~3mm choc travel.

module low_cherry_row(row=3, column=0) {
  $bottom_key_width = 18.16;
  $bottom_key_height = 18.16;
  $width_difference = $bottom_key_width - 11.85;
  $height_difference = $bottom_key_height - 14.64;
  $dish_type = "cylindrical";
  $dish_depth = 0.65;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $top_skew = 1.25;

  // choc v2 has ~3mm of travel, so the stem doesn't need to be as long
  $stem_throw = 3;

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  extra_stem_inset_height = max(0.6 - $stem_inset, 0);

  if (row <= 1) {
    $total_depth = 5.5 - extra_stem_inset_height + extra_height;
    $top_tilt = 0;
    children();
  } else if (row == 2) {
    $total_depth = 4.6 - extra_stem_inset_height + extra_height;
    $top_tilt = 2;
    children();
  } else if (row == 3) {
    $total_depth = 4.2 - extra_stem_inset_height + extra_height;
    $top_tilt = 4;
    children();
  } else if (row >= 4) {
    $total_depth = 4.7 - extra_stem_inset_height + extra_height;
    $top_tilt = 9;
    children();
  } else {
    children();
  }
}
