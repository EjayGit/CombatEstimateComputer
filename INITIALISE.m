%%%%%%%%%%%%%%%%%%%%
%%%              %%%
%%%  INITIALISE  %%%
%%%              %%%
%%%%%%%%%%%%%%%%%%%%
% 
% MAIN2 Accessably Variable List
% 
global LAT LON Z REF_MATRIX EN_FOV FUP_RANGE ROUTE_WEIGHT FUP_WEIGHT
% SIT
% FR
% EN



% Load map data.
[ LAT, LON, Z ] = TASK01_LOAD_MAP_DATA;

% Acquire co-ordinates and set initial FR matrices.
[ REF_MATRIX, EN_FOV, FR, EN, FUP_RANGE ] = TASK02_INPUT_COORDINATES( LAT, LON, Z );

% Set roles and initialise situation matrix.
[ FR ] = TASK03_SECTION_ROLE( FR );
[ SIT ] = TASK18_INIT_EVENT_COUNTER;

% Acquire user route and FUP preferences.
[ ROUTE_WEIGHT ] = TASK35_USER_MAP_PREFERENCES;
[ FUP_WEIGHT ] = TASK36_USER_FUP_PREFERENCES;

% Prepare COA Node (needs to have a field that accepts a number), and COA
% Node List (list needs to have a field that accepts a other COA Nodes.
ROUTE_LIST = [];
COA_NODE = struct( 'ROUTE_NUM', [], 'END_COORD', [], 'FR', FR, 'EN', EN, 'PARENT', [] );
COA_NODE_LIST = [ COA_NODE ];
END_CHECK = 0;
NODE_NUM = 1;

% while end conditions not true.
while END_CHECK == 0
    
    % Enter Find COA (Input latest COA Node).
    [ COA_NODE_LIST, END_CHECK, ROUTE_LIST ] = FIND_COA( COA_NODE_LIST, NODE_NUM, ROUTE_LIST, EN, FR );
    
end

% Go through route and set events into FR matrix

% Present Results

























