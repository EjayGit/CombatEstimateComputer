% T_1040: 

function [ EN_FOV_START_NODES, EN_FOV_END_NODES ] = TASK40_FOV_NODES( NODE_LIST )

global EN_FOV

END_CHECK = 0;
EN_FOV_START_NODES = [];
EN_FOV_END_NODES = [];
[ ~, ~, LAST_NODE ] = size( NODE_LIST );

for START_NODE = 1 : ( LAST_NODE - 1 )
    
    if ( ( ( EN_FOV( NODE_LIST( 1, 1, START_NODE ), NODE_LIST( 1, 2, START_NODE ) ) == 0 ) && ( EN_FOV( NODE_LIST( 1, 1, ( START_NODE + 1 ) ), NODE_LIST( 1, 2, ( START_NODE + 1 ) ) ) == 1 ) ) || ( ( START_NODE == 1 ) && ( ( EN_FOV( NODE_LIST( 1, 1, START_NODE ), NODE_LIST( 1, 2, START_NODE ) ) == 1 ) && ( EN_FOV( NODE_LIST( 1, 1, ( START_NODE + 1 ) ), NODE_LIST( 1, 2, ( START_NODE + 1 ) ) ) == 1 ) ) ) )
        
        EN_FOV_START_NODES = cat( 3, EN_FOV_START_NODES, START_NODE );
        
        for END_NODE = ( START_NODE + 1 ) : ( LAST_NODE - 1 )
            
            if ( ( ( EN_FOV( NODE_LIST( 1, 1, END_NODE ), NODE_LIST( 1, 2, END_NODE ) ) == 1 ) && ( EN_FOV( NODE_LIST( 1, 1, ( END_NODE + 1 ) ), NODE_LIST( 1, 2, ( END_NODE + 1 ) ) ) == 0 ) ) || ( END_NODE == ( LAST_NODE - 1 ) ) )
            
                EN_FOV_END_NODES = cat( 3, EN_FOV_END_NODES, ( END_NODE + 1 ) );
                if END_NODE == ( LAST_NODE - 1 )
                    
                    END_CHECK = 1;
                    
                end
                break
                
            end
            
            if END_CHECK == 1;
                
                break
                
            end
            
        end
        
    end
    
    if END_CHECK == 1;
        
        break
        
    end
    
end

end

