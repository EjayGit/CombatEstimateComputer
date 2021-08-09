% T_1042: Complete Fr Matrix.

function [ SIT, BLIND_LIST ] = TASK42_COMPLETE_FR_MATRIX( ROUTE, LAYER_MAP, SIT, FR )

COA_NODE = struct('FR', FR, 'EN', EN, 'SIT', SIT, 'ROUTE_WEIGHT', ROUTE_WEIGHT, 'FUP_WEIGHT', FUP_WEIGHT );
COA_NODE_LIST = struct( COA_NODE );
BLIND_LIST = [];

% Check for an event (i.e. going into En FOV).
[ EN_FOV_START_NODES, EN_FOV_END_NODES ] = TASK40_FOV_NODES( ROUTE, EN_FOV );
if ROUTE_WEIGHT.BLIND == 2
    
    [ BLIND_LIST ] = TASK38_BLIND_LIST( ROUTE, LAYER_MAP, EN_FOV_START_NODES, EN_FOV_END_NODES, BLIND_LIST );
        
end

% For all co-ordinates en route.
[ ~, ~, END_NODE ] = size( EN_FOV_START_NODES );
for NODE = 1 : END_NODE
    
    SIT = SIT + 1;
    % At each event, record the details into the row of Fr that
    % corresponds to the Event number.
    for ROLE_TYPE = 1 : 3
        
        for FR_REF = 1 : 3
            
            LAST_ROLE = size(FR(FR_REF).ROLE);
            if FR(FR_REF).ROLE( LAST_ROLE ) == 1
                
                FR(FR_REF).ROLE = cat( 1, FR(FR_REF).ROLE, 1 );
                FR(FR_REF).LAT = cat( 1, FR(FR_REF).LAT,  );
                FR(FR_REF).LON = cat( 1, FR(FR_REF).LON,  );
                FR(FR_REF).EFFECT = cat( 1, FR(FR_REF).EFFECT,  );
                FR(FR_REF).EVENT_NUM = cat( 1, FR(FR_REF).EVENT_NUM,  );
                FR(FR_REF).FIRE_ARC = cat( 1, FR(FR_REF).FIRE_ARC,  );
                
            elseif FR(FR_REF).ROLE( LAST_ROLE ) == 2
                
                FR(FR_REF).ROLE = cat( 1, FR(FR_REF).ROLE, 2 );
                FR(FR_REF).LAT = cat( 1, FR(FR_REF).LAT,  );
                FR(FR_REF).LON = cat( 1, FR(FR_REF).LON,  );
                FR(FR_REF).EFFECT = cat( 1, FR(FR_REF).EFFECT,  );
                FR(FR_REF).EVENT_NUM = cat( 1, FR(FR_REF).EVENT_NUM,  );
                FR(FR_REF).FIRE_ARC = cat( 1, FR(FR_REF).FIRE_ARC,  );
                
            elseif FR(FR_REF).ROLE( LAST_ROLE ) == 3
                
                FR(FR_REF).ROLE = cat( 1, FR(FR_REF).ROLE, 3 );
                FR(FR_REF).LAT = cat( 1, FR(FR_REF).LAT,  );
                FR(FR_REF).LON = cat( 1, FR(FR_REF).LON,  );
                FR(FR_REF).EFFECT = cat( 1, FR(FR_REF).EFFECT,  );
                FR(FR_REF).EVENT_NUM = cat( 1, FR(FR_REF).EVENT_NUM,  );
                FR(FR_REF).FIRE_ARC = cat( 1, FR(FR_REF).FIRE_ARC,  );
                
        end
        
    end
    
end

end

