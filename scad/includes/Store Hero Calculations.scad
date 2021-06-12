function length() = LENGTH_UNITS * BASE_SIZE;
function width() = WIDTH_UNITS * BASE_SIZE;
function box_height() = HEIGHT_OVERRIDE != "" ? HEIGHT_OVERRIDE : HEIGHTS[search(HEIGHT, HEIGHTS)[0]][1];
