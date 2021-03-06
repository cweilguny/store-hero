function base_size_length_reduced() = BASE_SIZE_LENGTH - 2 * BASE_SIZE_REDUCTION;
function base_size_width_reduced() = BASE_SIZE_WIDTH - 2 * BASE_SIZE_REDUCTION;
function length() = LENGTH_UNITS * BASE_SIZE_LENGTH;
function width() = WIDTH_UNITS * BASE_SIZE_WIDTH;
function length_reduced() = length() - 2 * BASE_SIZE_REDUCTION;
function width_reduced() = width() - 2 * BASE_SIZE_REDUCTION;
function length_inner() = length() - 2 * WALL_THICKNESS;
function width_inner() = width() - 2 * WALL_THICKNESS;
function length_inner_reduced() = length_reduced() - 2 * WALL_THICKNESS;
function width_inner_reduced() = width_reduced() - 2 * WALL_THICKNESS;
function height_total() = (BASE_HEIGHT * HEIGHT_UNITS) - (FOOT_HEIGHT * (HEIGHT_UNITS - 1));
function height_wall() = height_total() - (FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE);
function length_foot() = base_size_length_reduced() - 2 * FOOT_TO_WALL_XY_SIZE;
function width_foot() =  base_size_width_reduced() - 2 * FOOT_TO_WALL_XY_SIZE;
function length_grid_cell() = length_foot() + 2 * GRID_WALL_TOLERANCE;
function width_grid_cell() = width_foot() + 2 * GRID_WALL_TOLERANCE;
function grid_cell_hole_inset_length() = GRID_HOLE_SIZE_SPACING / 2;
function grid_cell_hole_inset_width() = GRID_HOLE_SIZE_SPACING / 2;
function wall_z() = FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE;
function grid_wall_thickness() = (BASE_SIZE - length_grid_cell()) / 2;
function spacer_spacing() = grid_wall_thickness();
function spacer_min_width() = 2 * spacer_spacing() + SPACER_CUTOUT_MIN_WIDTH;
function display_width() = length_inner() - 2 * DISPLAY_SPACING;
