% T_1004: Distance

function [ METRES ] = TASK04_DISTANCE( LAT1, LON1, LAT2, LON2 )

% Find the great circle distance (in degrees) between 2 co-ordinates.
ARCLEN = distance(LAT1, LON1, LAT2, LON2);

% Convert the distance (in degrees), to kilometres.
KM = deg2km(ARCLEN);

% Convert kilometres to metres.
METRES = KM * 1000;

% Project imposed map scaling factor. Divide by 30.
METRES = METRES / 30;

end