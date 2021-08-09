% T_1010_2: Calculate Route; calculate new nodes list.

function [ NODE_LIST, LAYER_MAP ] = TASK10_CALCULATE_ROUTE_2( NODE_LIST, LAYER_MAP, QF_MAP, LAT, LON, END_ROW, END_COL, START_ROW, START_COL, ROUTE_LENGTH )

    
[ NODES_1, ~, ~ ] = size( NODE_LIST );

% Initialise TEMP_NODES matrix.
TEMP_NODES = [];

% Cycle through nodes.
for ROUTE = 1 : NODES_1
    
    % If node is validated.
    if NODE_LIST( ROUTE, 3, 1 ) == 1
        
        % Find the last non-zero element in the Z dimension for the route
        [ END_3 ] = TASK27_FIND_LAST_NODE( NODE_LIST, ROUTE );

        ROW_FROM = NODE_LIST( ROUTE, 1, END_3 );
        COL_FROM = NODE_LIST( ROUTE, 2, END_3 );

        % Find the minimum and maximum elements permitted for the search.
        [ MIN_ROW, MIN_COL, MAX_ROW, MAX_COL ] = TASK20_MIN_MAX_ELEMENTS( 1, ROW_FROM, COL_FROM, LAYER_MAP );

        % Check surrounding elements.
        for ROW_TO = MIN_ROW : MAX_ROW

            for COL_TO = MIN_COL : MAX_COL

                if ( ( ( ROW_TO == ROW_FROM ) && ( COL_TO == COL_FROM ) ) || ( ( ROW_TO == START_ROW ) && ( COL_TO == START_COL ) ) )
                    
                    continue
                    
                else

                    % Check the element QF and update lists as required.
                    [ NODE_LIST, TEMP_NODES, LAYER_MAP  ] = TASK28_ELEMENT_UPDATE( LAYER_MAP, NODE_LIST, ROUTE, TEMP_NODES, ROW_FROM, COL_FROM, ROW_TO, COL_TO, QF_MAP, LAT, LON, END_ROW, END_COL, ROUTE_LENGTH );

                end

            end

        end
        
    else
        
        continue
        
    end

end

[ NODE_LIST ] = TASK31_UPDATE_NODE_LIST( NODE_LIST, TEMP_NODES );
% Edit above and below in order to ensure the end criteria of arriving at
% the end_row and end_col.
    
end

