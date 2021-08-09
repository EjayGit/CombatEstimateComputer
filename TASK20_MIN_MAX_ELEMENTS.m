function [ MIN_ROW, MIN_COL, MAX_ROW, MAX_COL ] = TASK20_MIN_MAX_ELEMENTS( RANGE, ROW, COL, Z )

% range = the maximum range to which the min and max x and y co-ordinates
% shall be given with respect to.

% m = the maximum number of rows in the matrix.
% n = the maximum number of columns in the matrix.
% x = the row number of the point of interest.
% y = the column number of the point of interest.

% Set min and max range of search limits dependant on the range and which
% point the search is conducted about.

[ MATRIX_ROWS , MATRIX_COLS, ~ ] = size( Z );

% Find minimum row.
for CHECK_ROW = 0 : RANGE
    
    % If either the range, or row 1 has been identified, classify this as
    % the minimum row (minx).
    if ( ( ( ROW - CHECK_ROW  ) == 1 ) || ( CHECK_ROW == RANGE ) )
        MIN_ROW = ROW - CHECK_ROW;
        break;
    end
end

% Find minimum column.
for CHECK_COL = 0 : RANGE
    
    % If either the range, or column 1 has been identified, classify this 
    % as the minimum column (miny).
    if ( ( ( COL - CHECK_COL  ) == 1 ) || ( CHECK_COL == RANGE ) )
        MIN_COL = COL - CHECK_COL;
        break;
    end
end

% Find maximum row.
for CHECK_ROW = 0 : RANGE
    
    % If either the range, or maximum row number has been identified,
    % classify this as the maximum row (maxx).
    if ( ( ( ROW + CHECK_ROW  ) == MATRIX_ROWS ) || ( CHECK_ROW == RANGE ) )
        MAX_ROW = ROW + CHECK_ROW;
        break;
    end
end

% Find maximum column.
for CHECK_COL = 0 : RANGE
    
    % If either the range, or maximum column number has been identified,
    % classify this as the maximum column (maxy).
    if ( ( ( COL + CHECK_COL  ) == MATRIX_COLS ) || ( CHECK_COL == RANGE ) )
        MAX_COL = COL + CHECK_COL;
        break;
    end
end

end