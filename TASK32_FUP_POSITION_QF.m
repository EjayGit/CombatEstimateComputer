% T_1032: FUP/ FST Angle Quality Factor.

function [ FUP_POSITION_QF ] = TASK32_FUP_POSITION_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, FST_LAT, FST_LON, FUP_WEIGHT_POSITION )

ANGLE_FUP_EN = TASK19_ANGLE( FUP_LAT, FUP_LON, EN_LAT, EN_LON );
ANGLE_EN_FST = TASK19_ANGLE( EN_LAT, EN_LON, FST_LAT, FST_LON );

FUP_POSITION_QF = abs( sin( deg2rad( ANGLE_EN_FST - ANGLE_FUP_EN ) ) );

if FUP_WEIGHT_POSITION == 3
    % Do nothing.
elseif FUP_WEIGHT_POSITION < 3
    
    FUP_POSITION_QF = ( ( FUP_WEIGHT_POSITION - 1 ) * ( ( FUP_POSITION_QF ) / 2 ) );
    
elseif FUP_WEIGHT_POSITION > 3
    
    FUP_POSITION_QF = ( FUP_POSITION_QF + ( ( FUP_WEIGHT_POSITION - 3 ) * ( ( 1 - FUP_POSITION_QF ) / 2 ) ) );
    
end

end

