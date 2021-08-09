
%COA_NODE = struct('FR', FR, 'EN', EN, 'SIT', SIT, 'ROUTE_WEIGHT', ROUTE_WEIGHT, 'FUP_WEIGHT', FUP_WEIGHT );

function [ FR ] = CALCULATE_COA( FUP_LIST, FR )

TEMP_FR = [];
[ FUP_NUM, ~, ~ ] = size( FUP_LIST );

% If FUPs exist, carry out COA creation.
if FUP_NUM > 0
    
    % For each FUP
    for FUP = 1 : FUP_NUM
        
        TEMP_FR = cat( 1, TEMP_FR, FR );
        
        [ START_ROW, START_COL ] = setpostn( Z, REF_MATRIX, TEMP_FR( 1, 1 ).LAT, TEMP_FR( 1, 1 ).LON );
        
        % Calculate the best route.
        [ QV, NODE_LIST, LAYER_MAP ] = TASK10_CALCULATE_ROUTE_1( START_ROW, START_COL, FUP_LIST( FUP_NUM, 1, 1 ), FUP_LIST( FUP_NUM, 2, 1 ), QF_MAP, LAT, LON, ROUTE_WEIGHT.LENGTH, Z );
        
        % For each event en route.
        
            % Check to see if En situation has changed.
            
            % If is has not, continue.
            
            % Else, 
        
    end
    
else
    
    disp('There are no FUPs. Call the Cavalry!!! Or choose a larger FUP range.');
    
end

end

