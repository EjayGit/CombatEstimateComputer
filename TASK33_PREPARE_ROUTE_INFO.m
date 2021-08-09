% T_1033: Prepare Route Infomation

function [ START_ROW, START_COL, END_ROW, END_COL ] = TASK33_PREPARE_ROUTE_INFO( Z, REF_MATRIX, FR, FUP_LEFT_RIGHT )

[ START_ROW, START_COL ] = setpostn( Z, REF_MATRIX, FR( 1, 3, 1 ), FR( 1, 4, 1 ) );

[ LAST_FUP, ~, ~ ] = size( FUP_LEFT_RIGHT );

MAX_VALUE = 0;
MAX_FUP_NUM = 1;

for FUP = 1 : LAST_FUP
    
    if FUP_LEFT_RIGHT( FUP, 3, 1 ) > MAX_VALUE
        
        MAX_VALUE = FUP_LEFT_RIGHT( FUP, 3, 1 );
        MAX_FUP_NUM = FUP;
        
    else
        
        continue
        
    end
    
end

END_ROW = FUP_LEFT_RIGHT( MAX_FUP_NUM, 1, 1 );
END_COL = FUP_LEFT_RIGHT( MAX_FUP_NUM, 2, 1 );

end

