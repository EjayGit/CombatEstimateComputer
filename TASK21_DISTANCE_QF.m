% Task 21: Distance Quality Factor

function [ DIST_QF ] = TASK21_DISTANCE_QF( LAT1, LON1, LAT2, LON2, RANGE, WEIGHT_DISTANCE )

% Distance quality factor.
METRES = TASK04_DISTANCE( LAT1, LON1, LAT2, LON2 );

DIST_QF = ( 1 - ( ( METRES - 20 ) / ( RANGE - 20 ) ) );

if WEIGHT_DISTANCE == 3
    % Do nothing.
elseif WEIGHT_DISTANCE < 3

    DIST_QF = ( ( WEIGHT_DISTANCE - 1 ) * ( ( DIST_QF ) / 2 ) );

elseif WEIGHT_DISTANCE > 3

    DIST_QF = ( DIST_QF + ( ( WEIGHT_DISTANCE - 3 ) * ( ( 1 - DIST_QF ) / 2 ) ) );

end

end

