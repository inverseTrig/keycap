// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

include <./includes.scad>

// row to render. override on the command line with `-D row=N` (e.g. CI)
row = 3;

// low_cherry: cherry-shaped, low profile, choc v2 stem with MX spacing
low_cherry_row(row) key();

// example row
/* for (x = [1:1:4]) {
  translate_u(0,-x) low_cherry_row(x) key();
} */

// example layout
/* preonic_default("dcs") key(); */
