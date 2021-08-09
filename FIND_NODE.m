%%%%%%%%%%%%%%%%%%%%%
%%%               %%%
%%%   FIND NODE   %%%
%%%               %%%
%%%%%%%%%%%%%%%%%%%%%

function [ COA_NODE, END_CHECK ] = FIND_NODE( ROUTE_LIST )

[ ROUTES, ~, ~ ] = size( ROUTE_LIST );
[ MAX_COORD, ~, ~ ] = size( ROUTE_LIST( ROUTES ).ROUTE_DETAILS.ROUTE );

% Check for events.
[ EN_FOV_START_NODES, EN_FOV_END_NODES ] = TASK40_FOV_NODES( NODE_LIST );

% For each sequential event.

    % Using current conditions, check En actions.

    % If En actions have changed to their previous state, node found so
    % set Node Check and return.
    
    % If co-ordinate == FUP, then set Node Check and FUP Check and return

end

