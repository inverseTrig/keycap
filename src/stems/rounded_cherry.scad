include <../functions.scad>
include <cherry.scad>

module rounded_cherry_stem(depth, slop, throw) {
  // $rounded_cherry_offset raises the stem above the keycap floor without
  // touching $total_depth. The cylinder is shortened by the same amount so
  // the stem top still meets the keytop underside, and the cross cutout is
  // re-rendered relative to the new (raised) stem bottom — its depth stays
  // $stem_throw, so engagement length within the cutout is preserved.
  translate([0, 0, $rounded_cherry_offset]) {
    difference(){
      cylinder(d=$rounded_cherry_stem_d, h=depth - $rounded_cherry_offset);

      // inside cross
      // translation purely for aesthetic purposes, to get rid of that awful lattice
      inside_cherry_cross($stem_inner_slop);
    }
  }
}
