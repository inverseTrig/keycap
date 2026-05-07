use <../functions.scad>
include <../settings.scad>

// DSA v2: identical exterior to DSA, but with thinner walls so the inner
// cavity can clear a Kailh Choc V2 (PG1353) top housing, which is wider
// than a Cherry MX top housing. With the standard DSA wall thickness the
// Choc V2's housing collides with the inside of the keycap before the stem
// can fully seat, so the cap doesn't bottom out.
//
// Outer: 18.24mm (same as DSA). Inner @ bottom: ~18.24 - 2.0 = 16.24mm,
// which clears a ~15.6mm Choc V2 top housing with ~0.3mm of side clearance.
module dsa_v2_row(row=3, column = 0) {
  $key_shape_type = "sculpted_square";
  $bottom_key_width = 18.24;
  $bottom_key_height = 18.24;
  $width_difference = 6;
  $height_difference = 6;
  $top_tilt = row == 5 ? -21 : (row-3) * 7;
  $top_skew = 0;
  $dish_type = "spherical";
  $dish_depth = 1.2;
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $height_slices = 10;

  // 1.0mm walls (vs DSA's 1.5mm) to widen the inner cavity for Choc V2
  $wall_thickness = 2.0;

  $side_sculpting = function(progress) (1 - progress) * 4.5;
  $corner_sculpting = function(progress) pow(progress, 2);

  $corner_radius = 1;
  $more_side_sculpting_factor = 0.4;

  $top_tilt_y = side_tilt(column);
  extra_height = $double_sculpted ? extra_side_tilt_height(column) : 0;

  depth_raisers = [0, 3.5, 1, 0, 1, 3];
  if (row < 1 || row > 4) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 1) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 2) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 3) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else if (row == 4) {
    $total_depth = 8.1 + depth_raisers[row] + extra_height;
    children();
  } else {
    children();
  }
}
