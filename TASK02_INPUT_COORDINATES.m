% T_1002: Input Fr and En Co-ordinates

function [ REF_MATRIX, EN_FOV, FR, EN, FUP_RANGE ] = TASK02_INPUT_COORDINATES( LAT, LON, Z )

% Sets any data a sea level to -1 so that they shall be coloured blue. 
Z(Z==0) = -1;

% Acquire the latitude and longitude limits.
latlim = [min(LAT(:)) max(LAT(:))];
lonlim = [min(LON(:)) max(LON(:))];

% Create reference matrix.
REF_MATRIX = makerefmat('RasterSize', size(Z), ...
   'Latlim', latlim, 'Lonlim', lonlim, 'ColumnsStartFrom', 'north');

% Display the image in a figure.
figure(1)
worldmap(latlim, lonlim)
geoshow(LAT, LON, Z, 'DisplayType', 'surface')

% Colour map with regard to its elevation data.
demcmap(Z)

% Force Z axis to be in proportion with the x-y coordinates.
daspectm('m', 1)

% Provide user to enter 2 co-ordinates. The first click shall represent the
% Fr units, and the second, the enemy unit.
disp('Click the position of the En position, and then the Fr position, on the map display.');

% User to select 2 points.
[USER_LAT, USER_LON] = inputm(2);

% Initialise 3 Fr units and 1 En unit, into Fr and En Matrices.
FR_UNIT = struct( 'ROLE', [], 'LAT', [], 'LON', [], 'EFFECT', NaN, 'EVENT_NUM', 1, 'FIRE_ARC', [ NaN, NaN, NaN ] );
FR = [ FR_UNIT, FR_UNIT, FR_UNIT ];
EN_UNIT = struct( 'LAT', [], 'LON', [] );
EN = [ EN_UNIT ];

% The first set of co-ordinates are to be entered into the En matrix under
% event 1 location for the En unit.
EN(1).LAT = USER_LAT(1);
EN(1).LON = USER_LON(1);

% The second set of co-ordinates are to be entered into the Fr matrix under
% event 1 locations for all 3 Fr units.
FR(1).LAT = USER_LAT(2);
FR(2).LAT = USER_LAT(2);
FR(3).LAT = USER_LAT(2);
FR(1).LON = USER_LON(2);
FR(2).LON = USER_LON(2);
FR(3).LON = USER_LON(2);

% T_1008: Determine En FOV.
MYALT = ltln2val( Z, REF_MATRIX, USER_LAT(1), USER_LON(1));
EN_FOV = viewshed( Z, REF_MATRIX, USER_LAT(1), USER_LON(1), (MYALT+2), 2, 'AGL', 'AGL', 20000, Inf);
%EN_FOV = zeros(size(Z));
figure(2)
imshow(EN_FOV);

% Request user for maximum distance of FUP from En position.
FUP_RANGE = TASK25_GET_FUP_RANGE( );

end
