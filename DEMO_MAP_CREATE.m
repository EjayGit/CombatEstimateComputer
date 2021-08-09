function [ DEMO_MAP ] = DEMO_MAP_CREATE( MAX_ROWS, MAX_COLS )

DEMO_MAP = zeros( MAX_ROWS, MAX_COLS );


for ROW_COUNT = 1 : MAX_ROWS

    for COL_COUNT = 1 : MAX_COLS

        DEMO_MAP(ROW_COUNT,COL_COUNT) = 30;
        
    end
    
end

for ROW_COUNT = 1 : MAX_ROWS

    for COL_COUNT = 1 : MAX_COLS

        if ((ROW_COUNT >= 1) && (ROW_COUNT < 50 ))

            if ( COL_COUNT > 10 ) && ( COL_COUNT < 70 )
                DEMO_MAP( ROW_COUNT, COL_COUNT ) = 1;
            end

        elseif ((ROW_COUNT >= 50) && (ROW_COUNT < 75))

            if ( COL_COUNT > 25 ) && ( COL_COUNT < 55 )
                DEMO_MAP( ROW_COUNT, COL_COUNT ) = 1;
            end

        elseif ((ROW_COUNT >= 75) && (ROW_COUNT < 85))

            if ( COL_COUNT > 30 ) && ( COL_COUNT < 50 )
                DEMO_MAP( ROW_COUNT, COL_COUNT ) = 1;
            end

        elseif (ROW_COUNT >= 85)

            if ( COL_COUNT > 35 ) && ( COL_COUNT < 45 )
                DEMO_MAP( ROW_COUNT, COL_COUNT ) = 1;
            end

        end

    end

end

end