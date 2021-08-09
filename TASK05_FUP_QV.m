 % T_1005: FUP Quality Value

function [ FUP_QV_MATRIX ] = TASK05_FUP_QV( LAT, LON, Z, REF_MATRIX, EN_FOV, EN_LAT, EN_LON, FUP_RANGE, FST_LAT, FST_LON, FUP_WEIGHT_EN_FOV, FUP_WEIGHT_ANGLE, FUP_WEIGHT_POSITION, FUP_WEIGHT_LENGTH, FUP_WEIGHT_DISTANCE )

% Initilise FUP QV Matrix.
FUP_QV_MATRIX = zeros( size( Z ) );

% Reset En lat and lon positions to help account for shifting.
[ EN_ROW, EN_COL ] = setpostn( Z, REF_MATRIX, EN_LAT, EN_LON );
EN_LAT = LAT( EN_ROW, EN_COL );
EN_LON = LON( EN_ROW, EN_COL );

% Check for minimum and maximum co-ordinates to check for FUPs.
[ MIN_FUP_ROW, MIN_FUP_COL, MAX_FUP_ROW, MAX_FUP_COL ] = TASK20_MIN_MAX_ELEMENTS( FUP_RANGE, EN_ROW, EN_COL, Z );

% Create search loops for maximum FUP boundaries.
for FUP_ROW = MIN_FUP_ROW : MAX_FUP_ROW
    
    for FUP_COL = MIN_FUP_COL : MAX_FUP_COL
        
        FUP_LAT = LAT( FUP_ROW, FUP_COL );
        FUP_LON = LON( FUP_ROW, FUP_COL );
        
        [ DISTANCE ] = TASK04_DISTANCE( FUP_LAT, FUP_LON, EN_LAT, EN_LON );
        
        % Check if distance is above the maximum permitted.
        if DISTANCE > FUP_RANGE
            
            % If above maximum distance, check next position.
            continue
            
        % Check if distance is above the maximum permitted.
        elseif DISTANCE < 20
            
            % If below minimum distance, check next position.
            continue
            
        % Check if potential FUP position is in En FOV.
        elseif EN_FOV( FUP_ROW, FUP_COL ) == 1
            
            % Check if the user variable, FUP_WEIGHT_EN_FOV.
            if FUP_WEIGHT_EN_FOV == 2
                
                % If in En FOV, check next position.
                continue
                
            else
                
                [ DIST_QF ] = TASK21_DISTANCE_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, FUP_RANGE, FUP_WEIGHT_DISTANCE );
                [ LINE_ANGLE_QF ] = TASK22_LINE_ANGLE_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, Z, REF_MATRIX, EN_FOV, FST_LAT, FST_LON, FUP_WEIGHT_ANGLE, FUP_WEIGHT_POSITION, FUP_WEIGHT_LENGTH );
                
                QV = DIST_QF * LINE_ANGLE_QF;
                
                FUP_QV_MATRIX( FUP_ROW, FUP_COL ) = QV;
                
            end
            
        % If within permitted distance and not in En FOV, find quality
        % value.
        else
            
        [ DIST_QF ] = TASK21_DISTANCE_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, FUP_RANGE, FUP_WEIGHT_DISTANCE );
        [ LINE_ANGLE_QF ] = TASK22_LINE_ANGLE_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, Z, REF_MATRIX, EN_FOV, FST_LAT, FST_LON, FUP_WEIGHT_ANGLE, FUP_WEIGHT_POSITION, FUP_WEIGHT_LENGTH );
        
        QV = DIST_QF * LINE_ANGLE_QF;
        
        FUP_QV_MATRIX( FUP_ROW, FUP_COL ) = QV;
        
        end
        
    end
    
end

end

