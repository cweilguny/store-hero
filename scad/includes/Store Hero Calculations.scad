function length() = LENGTH_UNITS * BASE_SIZE;
function width() = WIDTH_UNITS * BASE_SIZE;
function length_reduced() = length() - 2 * BASE_SIZE_REDUCTION;
function width_reduced() = width() - 2 * BASE_SIZE_REDUCTION;
function length_inner() = length() - 2 * WALL_THICKNESS;
function width_inner() = width() - 2 * WALL_THICKNESS;
function length_inner_reduced() = length_reduced() - 2 * WALL_THICKNESS;
function width_inner_reduced() = width_reduced() - 2 * WALL_THICKNESS;
function height_total() = (BASE_HEIGHT * HEIGHT_UNITS) - (FOOT_HEIGHT * (HEIGHT_UNITS - 1));
function height_wall() = height_total() - (FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE);
function length_foot() = BASE_SIZE - 2 * FOOT_TO_WALL_XY_SIZE - 2 * BASE_SIZE_REDUCTION;
function width_foot() = BASE_SIZE - 2 * FOOT_TO_WALL_XY_SIZE - 2 * BASE_SIZE_REDUCTION;

function wall_z() = FOOT_HEIGHT + FOOT_TO_WALL_Z_SIZE;

function display_width() = width_inner() - 2 * DISPLAY_SPACING;
