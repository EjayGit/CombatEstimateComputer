function DRAW_NODES( NODE_LIST, LAT, LON )

[LAST_ROUTE, ~, ~] = size(NODE_LIST);

for ROUTE = 1 : LAST_ROUTE
    
    LAST_NODE = TASK27_FIND_LAST_NODE(NODE_LIST, ROUTE);
    
    ROW_LAT = LAT( NODE_LIST( ROUTE, 1, LAST_NODE ), NODE_LIST( ROUTE, 2, LAST_NODE ) );
    ROW_LON = LON( NODE_LIST( ROUTE, 1, LAST_NODE ), NODE_LIST( ROUTE, 2, LAST_NODE ) );
    
    hPos = plot3(ROW_LAT, ROW_LON, 150, 'ko');
    figure(10)
    set(hPos, 'MarkerSize', 6);
    set(hPos, 'LineWidth', 2);
    
end

end