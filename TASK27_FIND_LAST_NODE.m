% T_1027: Find last node.

function [ END_3 ] = TASK27_FIND_LAST_NODE( NODE_LIST, ROUTE )

[ ~, ~, MAX_3 ] = size( NODE_LIST );

for END_3 = MAX_3 : -1 : 1
    
    if NODE_LIST( ROUTE, 1, END_3 ) == 0
        
        continue
    
    else
        
        break
        
    end

end

