% T_1038: Find Blind Locations Enroute.

function [ BLIND_LIST ] = TASK38_BLIND_LIST( NODE_LIST, LAYER_MAP, EN_FOV_START_NODES, EN_FOV_END_NODES, BLIND_LIST )

TEMP_BLIND_LIST = [];
[ NUM_OPEN_REGIONS, ~ , ~ ] = size( EN_FOV_START_NODES );

% For all open regions that lie in the En FOV.
for OPEN_REGION = 1 : NUM_OPEN_REGIONS;
    
    START_DISTANCE = LAYER_MAP( NODE_LIST( 1, 1, EN_FOV_START_NODES( OPEN_REGION ) ), NODE_LIST( 1, 2, EN_FOV_START_NODES( OPEN_REGION ) ), 2 );
    END_DISTANCE = LAYER_MAP( NODE_LIST( 1, 1, EN_FOV_END_NODES( OPEN_REGION ) ), NODE_LIST( 1, 2, EN_FOV_END_NODES( OPEN_REGION ) ), 2 );
    
    % At this point, find the distance of the open region.
    DISTANCE = END_DISTANCE - START_DISTANCE;

    % If distance < 20 metres
    if DISTANCE <= 20

        % Find halfway point.
        HALFWAY = DISTANCE / 2;
        for COUNTER = EN_FOV_START_NODES( OPEN_REGION ) : EN_FOV_END_NODES( OPEN_REGION )

            if LAYER_MAP( NODE_LIST( 1, 1, COUNTER ), NODE_LIST( 1, 2, COUNTER ), 2 ) > HALFWAY

                NEW_BLIND_POS = [ NODE_LIST( 1, 1, COUNTER ), NODE_LIST( 1, 2, COUNTER ) ];
                break

            end

        end

        % At this point, identify the element 20 metres towards the
        % En position. This point represents the blind effect
        % location.
        %%% This section of code would be done by identifying the lat
        %%% lon of the point, the angle towards the En position, and
        %%% then using lat and lon calculations, the position 20 metres
        %%% towards the enemy. This would then be converted back into
        %%% co-ordinates using the raster map and the 'setpostn'
        %%% function. Instead, the halfway point shall be identified
        %%% for the blind effect.
        TEMP_BLIND_LIST = cat( 3, TEMP_BLIND_LIST, NEW_BLIND_POS ); 

    % Else.
    else

        % Divide distance by 20 metres = segment.
        SEG_COUNTER = 0;

        % For every node in the route.
        for COUNTER = EN_FOV_START_NODES( OPEN_REGION ) : EN_FOV_END_NODES( OPEN_REGION )

            CURRENT_VALUE = ( LAYER_MAP( NODE_LIST( 1, 1, COUNTER ), NODE_LIST( 1, 2, COUNTER ), 2 ) ) - ( LAYER_MAP( NODE_LIST( 1, 1, EN_FOV_START_NODES( OPEN_REGION ) ), NODE_LIST( 1, 2, EN_FOV_START_NODES( OPEN_REGION ) ), 2 ) );

            % Identify the halfway point.
            if CURRENT_VALUE > ( ( SEG_COUNTER * 20 ) + 10 )

                NEW_BLIND_POS = [ NODE_LIST( 1, 1, COUNTER ), NODE_LIST( 1, 2, COUNTER ) ];
                % At this point, identify the element 20 metres towards the
                % En position. This point represents the blind effect
                % location.
                %%% This section of code would be done by identifying the lat
                %%% lon of the point, the angle towards the En position, and
                %%% then using lat and lon calculations, the position 20 metres
                %%% towards the enemy. This would then be converted back into
                %%% co-ordinates using the raster map and the 'setpostn'
                %%% function. Instead, the halfway point shall be identified
                %%% for the blind effect.
                TEMP_BLIND_LIST = cat( 3, TEMP_BLIND_LIST, NEW_BLIND_POS );
                SEG_COUNTER = SEG_COUNTER + 1;

            end

        end

    end
    [ ~, ~, TBL_LENGTH ] = size( TEMP_BLIND_LIST );
    [ BL_ROWS, ~, BL_LENGTH ] = size( BLIND_LIST );
    if BL_ROWS > 0
        
        if BL_LENGTH < TBL_LENGTH

            BLIND_LIST = TASK26_MATCH_DIMENSION( BLIND_LIST, TEMP_BLIND_LIST, 3 );

        elseif BL_LENGTH > TBL_LENGTH

            TEMP_BLIND_LIST = TASK26_MATCH_DIMENSION( TEMP_BLIND_LIST, BLIND_LIST, 3 );

        end
        
    end
    BLIND_LIST = cat( 1, BLIND_LIST, TEMP_BLIND_LIST );

end
        
end

