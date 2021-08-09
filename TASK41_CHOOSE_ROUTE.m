% Create COA

function [ BEST_ROUTE, LAYER_MAP ] = TASK41_CHOOSE_ROUTE( FUP_LIST, FR_LAT, FR_LON )

[ LAST_FUP, ~, ~ ] = size( FUP_LIST );
ROUTE_LIST = struct( 'FUP', [], 'FUP_QV', [], 'ROUTE', [], 'ROUTE_QV', [], 'TOTAL_QV', [] );
BEST_ROUTE = struct( 'FUP', [], 'FUP_QV', [], 'ROUTE', [], 'ROUTE_QV', [], 'TOTAL_QV', [] );
if LAST_FUP > 0
    
    % For each FUP.
    for FUP_NUM = 1 : LAST_FUP
        
        % Copy FUP into Route List.
        FUP = [ FUP_LIST( FUP_NUM, 1, 1 ), FUP_LIST( FUP_NUM, 2, 1 ) ];
        ROUTE_LIST.FUP = cat( 1, ROUTE_LIST.FUP, FUP );
        ROUTE_LIST.FUP_QV = cat( 1, ROUTE_LIST.FUP_QV, FUP_LIST( FUP_NUM, 3, 1 ) );
                
        % Calculate best route.
        [ START_ROW, START_COL ] = setpostn( Z, REF_MATRIX, FR_LAT, FR_LON );
        [ QV, NODE_LIST, LAYER_MAP ] = TASK10_CALCULATE_ROUTE_1( START_ROW, START_COL, FUP_LIST( FUP_NUM, 1, 1 ), FUP_LIST( FUP_NUM, 2, 1 ), QF_MAP, LAT, LON, ROUTE_WEIGHT.LENGTH, Z );
        
        % Copy Route into Route List.
        if FUP_NUM > 1
            
            [ ~, ~, LENGTH_NODE_LIST ] = size( NODE_LIST );
            [ ~, ~, LENGTH_ROUTE_LIST ] = size( ROUTE_LIST.ROUTE );
            if LENGTH_NODE_LIST < LENGTH_ROUTE_LIST
                
                [ NODE_LIST ] = TASK26_MATCH_DIMENSION( NODE_LIST, ROUTE_LIST.ROUTE, 3 );
            
            elseif LENGTH_NODE_LIST > LENGTH_ROUTE_LIST
                
                [ ROUTE_LIST.ROUTE ] = TASK26_MATCH_DIMENSION( ROUTE_LIST.ROUTE, NODE_LIST, 3 );
                
            end
            
        end
        ROUTE_LIST.ROUTE = cat( 1, ROUTE_LIST.ROUTE, NODE_LIST );
        ROUTE_LIST.ROUTE_QV = cat( 1, ROUTE_LIST.ROUTE_QV, QV );
        
    end
    
else
    
    disp('There are no FUPs available under these conditions... Try setting a larger range or accepting FUPs in the En FOV...');
    
end

%%% Prepare best FUP/ Route combination for output.
% Check max options in Route List.
[ MAX_OPTIONS, ~, ~ ] = size( ROUTE_LIST.FUP );
MAX_VALUE = 0;
MAX_OPTION = 0;

% For all options, calculate the Total QV.
for OPTION = 1 : MAX_OPTIONS
    
    ROUTE_LIST.TOTAL_QV( OPTION, 1, 1 ) = ROUTE_LIST.FUP_QV( OPTION, 1, 1 ) * ROUTE_LIST.ROUTE_QV( OPTION, 1, 1 );
    if ROUTE_LIST.TOTAL_QV( OPTION, 1, 1 ) > MAX_VALUE
        
        MAX_VALUE = ROUTE_LIST.TOTAL_QV( OPTION, 1, 1 );
        MAX_OPTION = OPTION;
        
    end
    
end

% Copy best option into output variable.
BEST_ROUTE.FUP = ROUTE_LIST.FUP( MAX_OPTION, 1, 1 );
BEST_ROUTE.FUP_QV = ROUTE_LIST.FUP_QV( MAX_OPTION, 1, 1 );
BEST_ROUTE.ROUTE = ROUTE_LIST.ROUTE( MAX_OPTION, :, : );
BEST_ROUTE.ROUTE_QV = ROUTE_LIST.ROUTE_QV( MAX_OPTION, 1, 1 );
BEST_ROUTE.TOTAL_QV = ROUTE_LIST.TOTAL_QV( MAX_OPTION, 1, 1 );

end

