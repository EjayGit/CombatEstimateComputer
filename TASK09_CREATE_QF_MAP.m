% T_1009: Range Information Layer

function [ QF_MAP ] = TASK09_CREATE_QF_MAP( EN_FOV, EN, LAT, LON, ROUTE_EN_FOV, BLIND )

% Check size of Z matrix for max values in for loops, and initialise range
% information matrix.
[ MAX_ROWS, MAX_COLS ] = size( EN_FOV );
QF_MAP = zeros( MAX_ROWS, MAX_COLS );

% For every element in the matrix
for ROW = 1 : MAX_ROWS
    
    for COL = 1 : MAX_COLS
        
        % If the En cannot see the point...
        if EN_FOV( ROW, COL ) == 0
            
            % Set the QF for that element as '1'.
            QF_MAP( ROW, COL ) = 0;
        
        % If the En can see the point...
        else
            
            % If no blind available, carry out normal distance QF calculation.
            if BLIND == 1
                
                % Find and set the values of the element lat and lon into the
                % relevant variables, and...
                % Set the distance QF into the appropriate element of the range info matrix.
                if ( TASK04_DISTANCE( LAT( ROW, COL ), LON( ROW, COL ), EN.LAT, EN.LON ) >= ( ( ROUTE_EN_FOV / 5 ) * 100 ) )

                    QF_MAP( ROW, COL ) = 0;

                else

                    QF_MAP( ROW, COL ) = log( TASK04_DISTANCE( LAT( ROW, COL ), LON( ROW, COL ), EN.LAT, EN.LON ) / ( ( ROUTE_EN_FOV / 5 ) * 100 ) );

                end
                
            % If blind is available, identify those co-ordinates which
            % a blind should be placed at.
            elseif BLIND == 2
                
                
                %[ BLIND_COORDS ] = TASK37_BLIND_COORDS( EN, EN_FOV );
                % Find and set the values of the element lat and lon into the
                % relevant variables, and...
                % Set the distance QF into the appropriate element of the range info matrix.
                if ( TASK04_DISTANCE( LAT( ROW, COL ), LON( ROW, COL ), EN.LAT, EN.LON ) >= ( ( ROUTE_EN_FOV / 5 ) * 100 ) )

                    QF_MAP( ROW, COL ) = 0;

                else
                    
                    QF_MAP( ROW, COL ) = log( 1 - ( ( 1 - ( TASK04_DISTANCE( LAT( ROW, COL ), LON( ROW, COL ), EN.LAT, EN.LON ) / ( ( ROUTE_EN_FOV / 5 ) * 100 ) ) ) / 8 ) ); % full map = 30
                    
                end
                
            end
            
        end
        
    end
    
end

end

