% T_1031: Update Node List.

function [ NODE_LIST ] = TASK31_UPDATE_NODE_LIST( NODE_LIST, TEMP_NODES )

% Initialise Temp Nodes List and Temp Route.
TEMP_NODES_LIST = [];
TEMP_ROUTE = [];
% Cycle through the Node List identifying all routes that have a
% validation code of '2'.
[ MAX_N1, ~, ~ ] = size( NODE_LIST );
for ROUTE = 1 : MAX_N1
    
    % If the route status  is '2', copy the route into the Temp Nodes List.
    if NODE_LIST( ROUTE, 3, 1 ) == 2;
        
        % When identified, concatenate them into the Temp Nodes List, matching dimensions for each one.
        % Match 3rd dimension in preparation for concatenation.
        [ LAST_N_NODE ] = TASK27_FIND_LAST_NODE( NODE_LIST, ROUTE );
        TEMP_ROUTE = NODE_LIST( ROUTE, :, 1 : LAST_N_NODE );
        [ MAX_TN1, ~, MAX_TN3 ] = size( TEMP_NODES_LIST );
        if MAX_TN1 > 0
            
            if LAST_N_NODE > MAX_TN3
                
                TEMP_NODES_LIST = TASK26_MATCH_DIMENSION( TEMP_NODES_LIST, TEMP_ROUTE, 3 );
                TEMP_NODES_LIST = cat( 1, TEMP_NODES_LIST, TEMP_ROUTE );
                
            elseif MAX_TN3 > LAST_N_NODE
                
                TEMP_ROUTE = TASK26_MATCH_DIMENSION( TEMP_ROUTE, TEMP_NODES_LIST, 3 );
                TEMP_NODES_LIST = cat( 1, TEMP_NODES_LIST, TEMP_ROUTE );
                
            else
                % Do nothing.
            end
            
        elseif MAX_TN1 == 0
            
            TEMP_NODES_LIST = NODE_LIST( ROUTE, :, : );
            
        else
            % Do nothing.
        end
        
    end
    
end

% Cycle through the Temp Nodes list identifying all those route which have a
% validation code of '1', or '2'.
[ MAX_T1, ~, ~ ] = size( TEMP_NODES );

for ROUTE = 1 : MAX_T1
    
    % If the route status  is '1' or '2', copy the route into the Temp Nodes List.
    if ( TEMP_NODES( ROUTE, 3, 1 ) == 1 ) || (TEMP_NODES( ROUTE, 3, 1 ) == 2 )
        % When identified, concatenate them into the Temp Nodes List, matching
        % dimensions for each one.
        [ LAST_T_NODE ] = TASK27_FIND_LAST_NODE( TEMP_NODES, ROUTE );
        TEMP_ROUTE = TEMP_NODES( ROUTE, :, 1 : LAST_T_NODE );
        [ MAX_TN1, ~, MAX_TN3 ] = size( TEMP_NODES_LIST );
        if MAX_TN1 > 0
            
            if MAX_TN3 < LAST_T_NODE
                
                TEMP_NODES_LIST = TASK26_MATCH_DIMENSION( TEMP_NODES_LIST, TEMP_ROUTE, 3 );
                TEMP_NODES_LIST = cat( 1, TEMP_NODES_LIST, TEMP_ROUTE );
                
            elseif MAX_TN3 > LAST_T_NODE
                
                TEMP_ROUTE = TASK26_MATCH_DIMENSION( TEMP_ROUTE, TEMP_NODES_LIST, 3 );
                TEMP_NODES_LIST = cat( 1, TEMP_NODES_LIST, TEMP_ROUTE );
                
            elseif MAX_TN3 == LAST_T_NODE
                
                TEMP_NODES_LIST = cat( 1, TEMP_NODES_LIST, TEMP_ROUTE );
                
            end
            
        elseif MAX_TN1 == 0
            
            TEMP_NODES_LIST = TEMP_NODES( ROUTE, :, : );
            
        else
            % Do nothing.
        end
        
    end
    
end

% Rename the Temp Nodes list, Node List.
NODE_LIST = TEMP_NODES_LIST;
[ROUTES_IN_NODE_LIST, ~, NODES_IN_NODES_LIST] = size(NODE_LIST);
disp(ROUTES_IN_NODE_LIST);
disp(NODES_IN_NODES_LIST);

end

