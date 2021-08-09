% T_1025: Get FUP range.

function FUP_RANGE = TASK25_GET_FUP_RANGE( )

% Set the prompt for the user to enter the range from the FUP to the enemy
% position.
disp('Enter the maximum range of the FUP from the enemy position. The value must be between 20 and 150 metres... ');

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_NUM = input( '','s');
    FUP_RANGE = str2num( USER_NUM ); %#ok<*ST2NM>
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( FUP_RANGE ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value. Enter the maximum range of the FUP from the enemy position... ')
    
    elseif ( ( FUP_RANGE < 20 ) || ( FUP_RANGE > 150 ) )
        
        disp('You must enter a value between 20 and 150 metres... ');
        
    else
        
        % If array if not blank and value is between 20 and 150, set conditions to end while loop.
        ONLY_NUM = true;
                
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        FUP_RANGE = FUP_RANGE( 1, 1, 1 );
    
    end
    
end

end

