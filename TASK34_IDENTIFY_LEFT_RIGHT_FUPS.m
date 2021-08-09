% T_1034: Identify Best FUPs left and right.

function [ FUP_LEFT_RIGHT ] = TASK34_IDENTIFY_LEFT_RIGHT_FUPS( FUP_LIST, FR, EN, LAT, LON )

FUP_LEFT_RIGHT = [];
MAX_FUP_LEFT = [];
MAX_FUP_RIGHT = [];

% Indentify the highest value of the FUPs.
[ LAST_FUP, ~, ~ ] = size( FUP_LIST );

MAX_VALUE = 0;

if LAST_FUP > 0
    
    for FUP = 1 : LAST_FUP

        if FUP_LIST( FUP, 3, 1 ) > MAX_VALUE

            MAX_VALUE = FUP_LIST( FUP, 3, 1 );

        else

            continue

        end

    end
    
    % Identify the threshold of acceptable FUPs (1/3rd below this maximum
    % value).
    MIN_VALUE = ( ( 2 / 3 ) * MAX_VALUE );

    % Identify the FUP with the highest value to the left and to the right of arc of the En
    % position from the FST.

    % Initialise Max Value and FUP Left and FUP right matrices.
    FUP_LEFT = [];
    FUP_RIGHT = [];

    % For all potential FUPs...
    for FUP = 1 : LAST_FUP

        [ ANGLE_FST_FUP ] = TASK19_ANGLE( FR(3).LAT, FR(3).LON, LAT(FUP_LIST(FUP, 1, 1), FUP_LIST(FUP, 2, 1)), LON(FUP_LIST(FUP, 1, 1), FUP_LIST(FUP, 2, 1)) );
        [ ANGLE_FST_EN ] = TASK19_ANGLE( FR(3).LAT, FR(3).LON, EN.LAT, EN.LON );
        % For those which have an angle from the FST, less than that from the
        % FST to the En, and have a value above the Min Value.
        if ( ( FUP_LIST( FUP, 3, 1 ) > MIN_VALUE ) && ( ANGLE_FST_FUP < ANGLE_FST_EN ) )

            % Store the FUP in the FUP Left matrix
            FUP_LEFT = cat( 1, FUP_LEFT, FUP_LIST( FUP, :, 1 ) );

        elseif ( ( FUP_LIST( FUP, 3, 1 ) > MIN_VALUE ) && ( ANGLE_FST_FUP > ANGLE_FST_EN ) )

            % Store the FUP in the FUP Right matrix
            FUP_RIGHT = cat( 1, FUP_RIGHT, FUP_LIST( FUP, :, 1 ) );

        else

            continue

        end

    end
    
    % Indentify the highest value of the FUPs to the left of centre from the FST.
    [ LAST_FUP_LEFT, ~, ~ ] = size( FUP_LEFT );
    
    MAX_VALUE = 0;
    MAX_FUP_NUM_LEFT = 0;

    if LAST_FUP_LEFT > 0

        for FUP = 1 : LAST_FUP_LEFT

            if FUP_LEFT( FUP, 3, 1 ) > MAX_VALUE

                MAX_VALUE = FUP_LEFT( FUP, 3, 1 );
                MAX_FUP_NUM_LEFT = FUP;

            else

                continue

            end

        end

        MAX_FUP_LEFT_ROW = FUP_LEFT( MAX_FUP_NUM_LEFT, 1, 1 );
        MAX_FUP_LEFT_COL = FUP_LEFT( MAX_FUP_NUM_LEFT, 2, 1 );
        MAX_FUP_LEFT_QV = FUP_LEFT( MAX_FUP_NUM_LEFT, 3, 1 );

    end
    
    % Indentify the highest value of the FUPs to the right of centre from the FST.
    [ LAST_FUP_RIGHT, ~, ~ ] = size( FUP_RIGHT );
    
    MAX_VALUE = 0;
    MAX_FUP_NUM_RIGHT = 0;

    if LAST_FUP_RIGHT > 0

        for FUP = 1 : LAST_FUP_RIGHT

            if FUP_RIGHT( FUP, 3, 1 ) > MAX_VALUE

                MAX_VALUE = FUP_RIGHT( FUP, 3, 1 );
                MAX_FUP_NUM_RIGHT = FUP;

            else

                continue

            end

        end

        MAX_FUP_RIGHT_ROW = FUP_RIGHT( MAX_FUP_NUM_RIGHT, 1, 1 );
        MAX_FUP_RIGHT_COL = FUP_RIGHT( MAX_FUP_NUM_RIGHT, 2, 1 );
        MAX_FUP_RIGHT_QV = FUP_RIGHT( MAX_FUP_NUM_RIGHT, 3, 1 );

    end
    
    if ( size( FUP_LEFT ) > 0 )
        
        MAX_FUP_LEFT = cat( 1, MAX_FUP_LEFT, [ MAX_FUP_LEFT_ROW, MAX_FUP_LEFT_COL, MAX_FUP_LEFT_QV ] );
        FUP_LEFT_RIGHT = cat( 1, FUP_LEFT_RIGHT, MAX_FUP_LEFT );
        
    end
    
    if ( size( FUP_RIGHT ) > 0 )
        
        MAX_FUP_RIGHT = cat( 1,  MAX_FUP_RIGHT, [ MAX_FUP_RIGHT_ROW, MAX_FUP_RIGHT_COL, MAX_FUP_RIGHT_QV ] );
        FUP_LEFT_RIGHT = cat( 1, FUP_LEFT_RIGHT, MAX_FUP_RIGHT );
        
    end
        
else
    
    disp('There are no FUPs available for you. Call the cavalry...');
    exit;
        
end

end

