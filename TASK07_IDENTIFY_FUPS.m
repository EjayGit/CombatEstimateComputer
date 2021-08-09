% T_1007: Identify FUPs

function [ FUP_LIST ] = TASK07_IDENTIFY_FUPS( FUP_QV_MATRIX )

% Create matrix identifying local maximums in the FUP_QV_MATRIX as 1's.
LOCAL_MAXIMAS = imregionalmax( FUP_QV_MATRIX );

% Initialise the FUP list..
FUP_LIST = [ ];
TEMP_FUP_LIST = [ 0 0 0 ];

[ MAX_ROW, MAX_COL ] = size(FUP_QV_MATRIX);

% Cycle through the matrix and list the co-ordinates of the local maximas.
for CURRENT_ROW = 1 : MAX_ROW
    
    for CURRENT_COL = 1 : MAX_COL
        
        if LOCAL_MAXIMAS( CURRENT_ROW, CURRENT_COL ) == 1
            
            TEMP_FUP_LIST( 1, 1 ) = CURRENT_ROW;
            TEMP_FUP_LIST( 1, 2 ) = CURRENT_COL;
            TEMP_FUP_LIST( 1, 3 ) = FUP_QV_MATRIX( CURRENT_ROW, CURRENT_COL );
            FUP_LIST = cat( 1, FUP_LIST, TEMP_FUP_LIST );
            
        end
        
    end
    
end

% Indentify the highest value of the FUPs.
[ LAST_FUP, ~, ~ ] = size( FUP_LIST );

if LAST_FUP > 0
    
elseif ( ( LAST_FUP > 0 ) && ( RANGE == 150 ) )
    
    disp('There are no FUPs available for you. Call the cavalry...');
    exit;
    
else
    
    disp('There are no FUPs available within the speicifed range. Consider increasing the range up to the maximum of 150 metres.');
    exit;
    
end

end

