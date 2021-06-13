function length() = LENGTH_UNITS * BASE_SIZE;
function width() = WIDTH_UNITS * BASE_SIZE;
function length_inner() = length() - 2 * WALL_THICKNESS;
function width_inner() = width() - 2 * WALL_THICKNESS;
function height_wall() = BASE_HEIGHT * HEIGHT_UNITS;
function height_total() = FOOT_HEIGHT + FOOT_TO_WALL_SIZE + height_wall();
function length_foot() = BASE_SIZE - 2 * FOOT_TO_WALL_SIZE;
function width_foot() = BASE_SIZE - 2 * FOOT_TO_WALL_SIZE;

function wall_z() = FOOT_HEIGHT + FOOT_TO_WALL_SIZE;