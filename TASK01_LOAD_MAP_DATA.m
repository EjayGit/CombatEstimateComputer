% T_1001: Load Map Data

function [ LAT, LON, Z ] = TASK01_LOAD_MAP_DATA( )

% usgs24kdem function pulls out required information from selected .dem file.
[ LAT, LON, Z ] = usgs24kdem('8426_75m.dem', 1);

% Test map create.
[ MAX_ROWS, MAX_COLS ] = size(Z);

[ TEST_MAP ] = TEST_MAP_CREATE( MAX_ROWS, MAX_COLS );

Z = TEST_MAP;

% % DEMO MAP CREATE.
% [ DEMO_MAP ] = DEMO_MAP_CREATE( 100, 80 );
% 
% LAT = LAT( 1 : 100, 1 : 80 );
% LON = LON( 1 : 100, 1 : 80 );
% 
% Z = DEMO_MAP;

end

