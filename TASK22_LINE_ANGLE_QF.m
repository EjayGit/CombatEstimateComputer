% Task 22: Line and Angle Quality Factor

function [ LINE_ANGLE_QF ] = TASK22_LINE_ANGLE_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, Z, REF_MATRIX, EN_FOV, FST_LAT, FST_LON, FUP_WEIGHT_ANGLE, FUP_WEIGHT_POSITION, FUP_WEIGHT_LENGTH )

% Init LINE_ANGLE_QF to zero.
LINE_ANGLE_QF = 0;

% Find 
[ FUP_ROW, FUP_COL ] = setpostn( Z, REF_MATRIX, FUP_LAT, FUP_LON );

for ANGLE = 0 : 10 : 179
    
    for LENGTH = 1 : 5 : 30
        
        SE = strel( 'line', LENGTH, ANGLE );
        NHOOD = getnhood(SE);
        [ROWS_IN_NHOOD, COLS_IN_NHOOD] = size(NHOOD);
        ROWS_TO_EDGE = ( ROWS_IN_NHOOD + 1 ) / 2;
        COLS_TO_EDGE = ( COLS_IN_NHOOD + 1 ) / 2;
        
        for ROW_NHOOD_COUNT = 1 : ROWS_IN_NHOOD
            
            ROW_FUP_COUNT = ROW_NHOOD_COUNT + FUP_ROW - ROWS_TO_EDGE;
            
            for COL_NHOOD_COUNT = 1 : COLS_IN_NHOOD
                
                COL_FUP_COUNT = COL_NHOOD_COUNT + FUP_COL - COLS_TO_EDGE;
                
                if NHOOD(ROW_NHOOD_COUNT, COL_NHOOD_COUNT) == 0
                    
                    continue
                    
                elseif EN_FOV(ROW_FUP_COUNT, COL_FUP_COUNT) == 1
                    
                    break
                    
                else
                    
                    continue
                    
                end
                
            end
            
            if EN_FOV(ROW_FUP_COUNT, COL_FUP_COUNT) == 1 % Check required
                
                break % Check required
                
            else % Check required
                
                continue % Check required
                
            end % Check required
            
        end
        
        ANGLE_QF = TASK23_FUP_ANGLE_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, ANGLE, FUP_WEIGHT_ANGLE );
        LINE_QF = TASK24_LINE_QF( LENGTH, FUP_WEIGHT_LENGTH );
        FUP_POSITION_QF = TASK32_FUP_POSITION_QF( FUP_LAT, FUP_LON, EN_LAT, EN_LON, FST_LAT, FST_LON, FUP_WEIGHT_POSITION );
        TEMP_LINE_ANGLE_QF = ANGLE_QF * LINE_QF * FUP_POSITION_QF;
        
        if TEMP_LINE_ANGLE_QF > LINE_ANGLE_QF
            
            LINE_ANGLE_QF = TEMP_LINE_ANGLE_QF;
            
        end
        
    end
    
end

end

