% Task 24: Line Quality Factor

function [ LINE_QF ] = TASK24_LINE_QF( LENGTH, FUP_WEIGHT_LENGTH )

LINE_CALC = degtorad( 90 * ( LENGTH / 30 ) );

LINE_QF = sin( LINE_CALC );

if FUP_WEIGHT_LENGTH == 3
    % Do nothing.
elseif FUP_WEIGHT_LENGTH < 3
    
    LINE_QF = ( ( FUP_WEIGHT_LENGTH - 1 ) * ( ( LINE_QF ) / 2 ) );
    
elseif FUP_WEIGHT_LENGTH > 3
    
    LINE_QF = ( LINE_QF + ( ( FUP_WEIGHT_LENGTH - 3 ) * ( ( 1 - FUP_WEIGHT_LENGTH ) / 2 ) ) );
    
end

end

