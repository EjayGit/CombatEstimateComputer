% T_1026: Match Dimension.

% The dimension of the FINAL matrix must be larger than the dimension of
% the CHANGE matrix.

function [ CHANGE ] = TASK26_MATCH_DIMENSION( CHANGE, FINAL, DIMENSION )

[ ROW_FINAL, COL_FINAL, DEPTH_FINAL ] = size( FINAL );

[ ROW_CHANGE, COL_CHANGE, DEPTH_CHANGE ] = size( CHANGE );

if DIMENSION == 1
    
    ROW_DIFF = ROW_FINAL - ROW_CHANGE;
    
    BLANK = zeros( ROW_DIFF, COL_CHANGE, DEPTH_CHANGE );
    
    CHANGE = cat( 1, CHANGE, BLANK );
    
end

if DIMENSION == 2
    
    COL_DIFF = COL_FINAL - COL_CHANGE;
    
    BLANK = zeros( ROW_CHANGE, COL_DIFF, DEPTH_CHANGE );
    
    CHANGE = cat( 2, CHANGE, BLANK );
    
end

if DIMENSION == 3
    
    DEPTH_DIFF = DEPTH_FINAL - DEPTH_CHANGE;
    
    BLANK = zeros( ROW_CHANGE, COL_CHANGE, DEPTH_DIFF );
    
    CHANGE = cat( 3, CHANGE, BLANK );
    
end

end

