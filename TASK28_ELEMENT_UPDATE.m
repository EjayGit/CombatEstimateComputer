% T_1028: Update Node List and Temp Nodes list.

function [ NODE_LIST, TEMP_NODES, LAYER_MAP ] = TASK28_ELEMENT_UPDATE( LAYER_MAP, NODE_LIST, ROUTE, TEMP_NODES, ROW_FROM, COL_FROM, ROW_TO, COL_TO, QF_MAP, LAT, LON, END_ROW, END_COL, ROUTE_LENGTH )

% Identify result of sum of QF at new position divided with sum of distance
% at new position.
if ROUTE_LENGTH == 1
    
    PRIOR_NEW_ELEMENT_TOTAL = ( LAYER_MAP( ROW_TO, COL_TO, 1 ) ) / ( ( LAYER_MAP( ROW_TO, COL_TO, 2 )^3 ) );
    
elseif ROUTE_LENGTH == 2
    
    PRIOR_NEW_ELEMENT_TOTAL = ( LAYER_MAP( ROW_TO, COL_TO, 1 ) ) / ( ( LAYER_MAP( ROW_TO, COL_TO, 2 )^2 ) );
    
elseif ROUTE_LENGTH == 3
    
    PRIOR_NEW_ELEMENT_TOTAL = ( LAYER_MAP( ROW_TO, COL_TO, 1 ) ) / ( ( LAYER_MAP( ROW_TO, COL_TO, 2 ) ) );
    
end


if isnan(PRIOR_NEW_ELEMENT_TOTAL)
    PRIOR_NEW_ELEMENT_TOTAL = 0;
end

% Sum current QF with new QF.
POTENTIAL_NEW_ELEMENT_QF = exp( log( LAYER_MAP( ROW_FROM, COL_FROM, 1 ) ) + ( QF_MAP( ROW_TO, COL_TO ) ) );

% Sum current distance with new distance.
POTENTIAL_NEW_ELEMENT_DIST = ( LAYER_MAP( ROW_FROM, COL_FROM, 2 ) ) + ( TASK04_DISTANCE( LAT( ROW_FROM, COL_FROM ), LON( ROW_FROM, COL_FROM ), LAT( ROW_TO, COL_TO ), LON( ROW_TO, COL_TO ) ) );

% Divide new potential sum of QF with new potential sum of distance.
if ROUTE_LENGTH == 1
    
    POTENTIAL_NEW_TOTAL = POTENTIAL_NEW_ELEMENT_QF / ( ( POTENTIAL_NEW_ELEMENT_DIST )^3 );
    
elseif ROUTE_LENGTH == 2
    
    POTENTIAL_NEW_TOTAL = POTENTIAL_NEW_ELEMENT_QF / ( ( POTENTIAL_NEW_ELEMENT_DIST )^2 );
    
elseif ROUTE_LENGTH == 3
    
    POTENTIAL_NEW_TOTAL = POTENTIAL_NEW_ELEMENT_QF / ( ( POTENTIAL_NEW_ELEMENT_DIST ) );
    
end


% If result is larger than pre position, then replace with new values for
% sum of QF and sum of distance. 
if ( ( POTENTIAL_NEW_TOTAL > PRIOR_NEW_ELEMENT_TOTAL ) && ( POTENTIAL_NEW_TOTAL > 0.00001 ) ) % FOR NORMAL MAP, 0.0000005
    
    LAYER_MAP( ROW_TO, COL_TO, 1 ) = POTENTIAL_NEW_ELEMENT_QF;
    LAYER_MAP( ROW_TO, COL_TO, 2 ) = POTENTIAL_NEW_ELEMENT_DIST;
    
    % Update TEMP_NODES with new node and invalidate all other routes
    % which had this prior element within their route. Check through
    % current NODE_LIST, and TEMP_NODES.
    
    % Check through Node List for routes to be invalidated.
    [ MAX_N1, ~, ~ ] = size( NODE_LIST );
    for DIM_N1 = 1 : MAX_N1
        
        % Find the last node in the current route.
        [ END_N3 ] = TASK27_FIND_LAST_NODE( NODE_LIST, DIM_N1 );
        
        % For all nodes in the list.
        for DIM_N3 = 1 : END_N3
            
            % If the node is of the same co-ordinate...
            if ( ( NODE_LIST( DIM_N1, 1, DIM_N3 ) == ROW_TO ) && ( NODE_LIST( DIM_N1, 2, DIM_N3 ) == COL_TO ) )
                
                % ...invalidate it.
                NODE_LIST( DIM_N1, 3, 1 ) = 0;
                break

            else
                
                % If not, check the next node in the route.
                continue
                
            end
            
        end
        
    end
    
    % Check through Temp Nodes for routes to be invalidated.
    [ MAX_T1, ~, ~ ] = size( TEMP_NODES );
    if MAX_T1 > 0
        
        % Find the last node in the current route.
        for DIM_T1 = 1 : MAX_T1

            % Find the last node in the current route.
            [ END_T3 ] = TASK27_FIND_LAST_NODE( TEMP_NODES, DIM_T1 );
            
            % For all nodes in the list.
            for DIM_T3 = 1 : END_T3
                
                % If the node is of the same co-ordinate...
                if ( ( TEMP_NODES( DIM_T1, 1, DIM_T3 ) == ROW_TO ) && ( TEMP_NODES( DIM_T1, 2, DIM_T3 ) == COL_TO ) )
                    
                    % ...invalidate it.
                    TEMP_NODES( DIM_T1, 3, 1 ) = 0;
                    break

                else
                    
                    % If the  check the next node in the route.
                    continue
                    
                end

            end

        end
        
    end
    
    % Add the new route to TEMP_NODES.
    
    % Copy the route up to the new node.
    [ END_NODE ] = TASK27_FIND_LAST_NODE( NODE_LIST, ROUTE );
    TEMP_ROUTE = NODE_LIST( ROUTE, 1 : 3, 1 : END_NODE );
    
    % Add the new node onto the new route list and set status.
    NEW_NODE = [ ROW_TO, COL_TO, 0 ];
    TEMP_ROUTE = cat( 3, TEMP_ROUTE, NEW_NODE );
    
    % If the new node is the FUP, set status to '2', if it is not, set status to '1'.
    if ( ROW_TO == END_ROW ) && ( COL_TO == END_COL )
        
        TEMP_ROUTE( 1, 3, 1 ) = 2;
    
    else
        % This may not be necessary due to the copy of the top layer node
        % already having a status of '1'.
        TEMP_ROUTE( 1, 3, 1 ) = 1;
        
    end
    
    % Concatenate the TEMP_ROUTE onto the TEMP_NODES matrix.
    [ MAX_N1, ~, MAX_N3 ] = size( TEMP_NODES );
    [ ~, ~, MAX_T3 ] = size( TEMP_ROUTE );
    if MAX_N1 == 0
        
        TEMP_NODES = cat( 1, TEMP_NODES, TEMP_ROUTE );
        
    elseif MAX_N3 > MAX_T3

        [ TEMP_ROUTE ] = TASK26_MATCH_DIMENSION( TEMP_ROUTE, TEMP_NODES, 3 );
        TEMP_NODES = cat( 1, TEMP_NODES, TEMP_ROUTE );

    elseif MAX_N3 < MAX_T3

        [ TEMP_NODES ] = TASK26_MATCH_DIMENSION( TEMP_NODES, TEMP_ROUTE, 3 );
        TEMP_NODES = cat( 1, TEMP_NODES, TEMP_ROUTE );

    elseif MAX_N3 == MAX_T3
        
        TEMP_NODES = cat( 1, TEMP_NODES, TEMP_ROUTE );
        
    end
            
else
    % Do nothing.
end

end

