% T_1010_1: Calculate Route.

function [ NODE_LIST ] = TASK10_CALCULATE_ROUTE_1( START_ROW, START_COL, END_ROW, END_COL, QF_MAP, LAT, LON, ROUTE_LENGTH, Z )

% Layer Map: [ ROW, COL, 1 ] = sum of QF layer. [ ROW, COL, 2 ] = sum of distances layer.
[ MAP_SIZE_1, MAP_SIZE_2, ~ ] = size( QF_MAP );
LAYER_MAP = zeros( MAP_SIZE_1, MAP_SIZE_2, 2 );
LAYER_MAP( START_ROW, START_COL, 1 ) = 1;

% Initialise the node lists. [ ROW, COL, VALIDATION ].
NODE_LIST = [ START_ROW, START_COL, 1 ];

% Initialise the variable DO_LOOP.
DO_LOOP = true;

% For all nodes in the (relevant) list.
while DO_LOOP
    
    [ NODE_LIST, LAYER_MAP ] = TASK10_CALCULATE_ROUTE_2( NODE_LIST, LAYER_MAP, QF_MAP, LAT, LON, END_ROW, END_COL, START_ROW, START_COL, ROUTE_LENGTH );
    
    % Find the number of routes in the Node List.
    [ NODE_LIST_1, ~, ~ ] = size( NODE_LIST );
    [ NODE_LIST_LAST ] = TASK27_FIND_LAST_NODE( NODE_LIST, 1 );
%    DRAW_NODES(NODE_LIST, LAT, LON);
    
    % Set the end condition; Node List has one route in it and the end
    % location is the FUP element.
    if ( ( NODE_LIST_1 == 1 ) && ( NODE_LIST( 1, 1, NODE_LIST_LAST) == END_ROW ) && ( NODE_LIST( 1, 2, NODE_LIST_LAST) == END_COL ) )
        
        NODE_LIST = NODE_LIST( 1, 1 : 2, 1 : NODE_LIST_LAST );
        break

    end
        
end

% Update Node List to include the QF and Distances relevant to the node.
[ ~, ~, MAX_NODES ] = size( NODE_LIST );
TEMP_NODE_LIST = zeros( MAX_NODES, 4, 1 );
for COUNTER = 1 : MAX_NODES
    
    TEMP_NODE_LIST( COUNTER, 1, 1 ) = cat( 1, TEMP_NODE_LIST, NODE_LIST( 1, 1, COUNTER ) );
    TEMP_NODE_LIST( COUNTER, 2, 1 ) = cat( 1, TEMP_NODE_LIST, NODE_LIST( 1, 2, COUNTER ) );
    TEMP_NODE_LIST( COUNTER, 3, 1 ) = cat( 1, TEMP_NODE_LIST, LAYER_MAP( NODE_LIST( 1, 1, COUNTER ), NODE_LIST( 1, 2, COUNTER ), 1 ) );
    TEMP_NODE_LIST( COUNTER, 4, 1 ) = cat( 1, TEMP_NODE_LIST, LAYER_MAP( NODE_LIST( 1, 1, COUNTER ), NODE_LIST( 1, 2, COUNTER ), 2 ) );
    
end
NODE_LIST = TEMP_NODE_LIST;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Can delete the following code once modications have been made. Can
%%% reuse the concept of this code later on.
% if ROUTE_LENGTH == 1
%     
%     QV = ( LAYER_MAP( END_ROW, END_COL, 1 ) / ( ( LAYER_MAP( END_ROW, END_COL, 2 ) )^3 ) );
%     
% elseif ROUTE_LENGTH == 2
%     
%     QV = ( LAYER_MAP( END_ROW, END_COL, 1 ) / ( ( LAYER_MAP( END_ROW, END_COL, 2 ) )^2 ) );
%     
% elseif ROUTE_LENGTH == 3
%     
%     QV = ( LAYER_MAP( END_ROW, END_COL, 1 ) / ( ( LAYER_MAP( END_ROW, END_COL, 2 ) ) ) );
%     
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

