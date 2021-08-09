% T_1039: Route to FUP

function [ FR ] = TASK39_ROUTE_TO_FUP( COA_NODE, FUP_LIST, FR, Z, REF_MATRIX, QF_MAP, LAT, LON, ROUTE_WEIGHT, FUP_WEIGHT, NODE_LIST, EN_FOV, COA_NODE_LIST )

[ LAST_FUP, ~, ~ ] = size( FUP_LIST );
if LAST_FUP > 0

    
    for FUP = 1 : LAST_FUP  % Duplicated with line 20
        
        ROUTE_END_ROW = 0;
        ROUTE_END_COL = 0;
        FUP_ROW = FUP_LIST( LAST_FUP, 1, 1 );
        FUP_COL = FUP_LIST( LAST_FUP, 2, 1 );

        while ( ( ROUTE_END_ROW ~= FUP_ROW ) || ( ROUTE_END_COL ~= FUP_COL ) ) % SHIFT TO BE TAKEN INTO ACCOUNT BY LOOKING AT CO-ORDS INSTEAD???

            ROUTE_LIST = struct( 'FUP', [], 'ROUTE', [] );

            for FUP_NUM = 1 : LAST_FUP % Duplicated with line 9

                FUP = [ FUP_LIST( FUP_NUM, 1, 1 ), FUP_LIST( FUP_NUM, 2, 1 ) ];

                ROUTE_LIST.FUP = cat( 1, ROUTE_LIST.FUP, FUP );

                [ START_ROW, START_COL ] = setpostn( Z, REF_MATRIX, FR(1).LAT, FR(1).LON );

                [ QV, NODE_LIST, LAYER_MAP ] = TASK10_CALCULATE_ROUTE_1( START_ROW, START_COL, FUP_LIST( FUP_NUM, 1, 1 ), FUP_LIST( FUP_NUM, 2, 1 ), QF_MAP, LAT, LON, ROUTE_WEIGHT.LENGTH, Z );

                ROUTE_LIST.ROUTE = cat( 1, ROUTE_LIST, NODE_LIST );

                [ EN_FOV_START_NODES, EN_FOV_END_NODES ] = TASK40_FOV_NODES( NODE_LIST, EN_FOV );

                if ROUTE_WEIGHT.BLIND == 2

                    [ BLIND_LIST ] = TASK38_BLIND_LIST( NODE_LIST, LAYER_MAP, EN_FOV_START_NODES, EN_FOV_END_NODES );

                end

            end

        end
            
    end
    
else

disp('There are no FUPs available under these conditions... Try setting a larger range or accepting FUPs in the En FOV...');

end

end

