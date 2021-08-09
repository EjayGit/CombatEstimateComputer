% T_1036: User FUP Preferences.
%
% FUP_WEIGHT_LENGTH: Scale 0 - 5:
% 0 = default (3).
% 1 = Length of FUP more significant.
% 5 = Length of FUP less significant.
%
% FUP_WEIGHT_ANGLE: Scale 0 - 5:
% 0 = default (3).
% 1 = Perpendicular angle of FUP more significant.
% 5 = Perpendicular angle of FUP less significant.
%
% FUP_WEIGHT_EN_FOV: Scale 0 - 2:
% 0 = default (2).
% 1 = FUP in En FOV acceptable.
% 2 = FUP in En FOV not acceptable.
%
% FUP_WEIGHT_DISTANCE: Scale 0 - 5:
% 0 = default (3).
% 1 = Distance to the En position more significant.
% 5 = Distance to the En position less significant.
%
% FUP_WEIGHT_POSITION: Scale 0 - 5:
% 0 = default (3).
% 1 = Perpendicular angle from FST to En more significant.
% 5 = Perpendicular angle from FST to En less significant.

function [ FUP_WEIGHT ] = TASK36_USER_FUP_PREFERENCES()

% FUP_WEIGHT_LENGTH

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_FUP_WEIGHT_LENGTH = input( 'LENGTH WEIGHTING: 0 = Default. 1 = Length of FUP more significant. 5 = Length of FUP less significant... ','s');
    FUP_WEIGHT_LENGTH = str2num( USER_FUP_WEIGHT_LENGTH );
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( FUP_WEIGHT_LENGTH ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( FUP_WEIGHT_LENGTH < 0 ) || ( FUP_WEIGHT_LENGTH > 5 ) )
        
        disp('You must enter a value between 0 and 5.');
        
    else
        
         % If array if not blank and value is between 0 and 5, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( FUP_WEIGHT_LENGTH( 1, 1, 1 ) >= 0 ) && ( FUP_WEIGHT_LENGTH( 1, 1, 1 ) < 1 ) )
            
            FUP_WEIGHT_LENGTH( 1, 1, 1 ) = 3;
            
        elseif ( ( FUP_WEIGHT_LENGTH( 1, 1, 1 ) >= 1 ) && ( FUP_WEIGHT_LENGTH( 1, 1, 1 ) < 1.2 ) )
            
            FUP_WEIGHT_LENGTH( 1, 1, 1 ) = 1.2;
        
        elseif ( ( FUP_WEIGHT_LENGTH( 1, 1, 1 ) > 4.8 ) && ( FUP_WEIGHT_LENGTH( 1, 1, 1 ) <= 5 ) )
            
            FUP_WEIGHT_LENGTH( 1, 1, 1 ) = 4.8;
            
        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        FUP_WEIGHT_LENGTH = FUP_WEIGHT_LENGTH( 1, 1, 1 );
        
    end
    
end

% FUP_WEIGHT_ANGLE

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_FUP_WEIGHT_ANGLE = input( 'ANGLE WEIGHTING: 0 = Default. 1 = Perpendicular angle of FUP more significant. 5 = Perpendicular angle of FUP less significant... ','s');
    FUP_WEIGHT_ANGLE = str2num( USER_FUP_WEIGHT_ANGLE );
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( FUP_WEIGHT_ANGLE ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( FUP_WEIGHT_ANGLE < 0 ) || ( FUP_WEIGHT_ANGLE > 5 ) )
        
        disp('You must enter a value between 0 and 5.');
        
    else
        
         % If array if not blank and value is between 0 and 5, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( FUP_WEIGHT_ANGLE( 1, 1, 1 ) >= 0 ) && ( FUP_WEIGHT_ANGLE( 1, 1, 1 ) < 1 ) )
            
            FUP_WEIGHT_ANGLE( 1, 1, 1 ) = 3;
            
        elseif ( ( FUP_WEIGHT_ANGLE( 1, 1, 1 ) >= 1 ) && ( FUP_WEIGHT_ANGLE( 1, 1, 1 ) < 1.2 ) )
            
            FUP_WEIGHT_ANGLE( 1, 1, 1 ) = 1.2;
            
        elseif ( ( FUP_WEIGHT_ANGLE( 1, 1, 1 ) > 4.8 ) && ( FUP_WEIGHT_ANGLE( 1, 1, 1 ) <= 5 ) )
            
            FUP_WEIGHT_ANGLE( 1, 1, 1 ) = 4.8;
            
        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        FUP_WEIGHT_ANGLE = FUP_WEIGHT_ANGLE( 1, 1, 1 );
        
    end
    
end

% FUP_WEIGHT_EN_FOV

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_FUP_WEIGHT_EN_FOV = input( 'FUP IN EN FOV: 0 = default. 1 = FUP in En FOV acceptable. 2 = FUP in En FOV not acceptable... ','s');
    FUP_WEIGHT_EN_FOV = str2num( USER_FUP_WEIGHT_EN_FOV );
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( FUP_WEIGHT_EN_FOV ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( FUP_WEIGHT_EN_FOV < 0 ) || ( FUP_WEIGHT_EN_FOV > 2 ) )
        
        disp('You must enter a value between 0 and 2.');
        
    else
        
         % If array if not blank and value is between 0 and 5, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( FUP_WEIGHT_EN_FOV( 1, 1, 1 ) >= 0 ) && ( FUP_WEIGHT_EN_FOV( 1, 1, 1 ) < 1 ) )
            
            FUP_WEIGHT_EN_FOV( 1, 1, 1 ) = 2;
            
        elseif ( ( FUP_WEIGHT_EN_FOV( 1, 1, 1 ) >= 1 ) && ( FUP_WEIGHT_EN_FOV( 1, 1, 1 ) < 2 ) )
            
            FUP_WEIGHT_EN_FOV( 1, 1, 1 ) = 1;
        
        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        FUP_WEIGHT_EN_FOV = FUP_WEIGHT_EN_FOV( 1, 1, 1 );
        
    end
    
end

% FUP_WEIGHT_DISTANCE

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_FUP_WEIGHT_DISTANCE = input( 'DISTANCE WEIGHTING: 0 = Default. 1 = Distance to the En position more significant. 5 = Distance to the En position less significant... ','s');
    FUP_WEIGHT_DISTANCE = str2num( USER_FUP_WEIGHT_DISTANCE );
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( FUP_WEIGHT_DISTANCE ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( FUP_WEIGHT_DISTANCE < 0 ) || ( FUP_WEIGHT_DISTANCE > 5 ) )
        
        disp('You must enter a value between 0 and 5.');
        
    else
        
         % If array if not blank and value is between 0 and 5, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( FUP_WEIGHT_DISTANCE( 1, 1, 1 ) >= 0 ) && ( FUP_WEIGHT_DISTANCE( 1, 1, 1 ) < 1 ) )
            
            FUP_WEIGHT_DISTANCE( 1, 1, 1 ) = 3;
            
        elseif ( ( FUP_WEIGHT_DISTANCE( 1, 1, 1 ) >= 1 ) && ( FUP_WEIGHT_DISTANCE( 1, 1, 1 ) < 1.2 ) )
            
            FUP_WEIGHT_DISTANCE( 1, 1, 1 ) = 1.2;
            
        elseif ( ( FUP_WEIGHT_DISTANCE( 1, 1, 1 ) > 4.8 ) && ( FUP_WEIGHT_DISTANCE( 1, 1, 1 ) <= 5 ) )
            
            FUP_WEIGHT_DISTANCE( 1, 1, 1 ) = 4.8;
            
        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        FUP_WEIGHT_DISTANCE = FUP_WEIGHT_DISTANCE( 1, 1, 1 );
        
    end
    
end

% FUP_WEIGHT_POSITION

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_FUP_WEIGHT_POSITION = input( 'POSITION WEIGHTING: 0 = Default. 1 = Perpendicular angle from FST to En more significant. 5 = Perpendicular angle from FST to En less significant... ','s');
    FUP_WEIGHT_POSITION = str2num( USER_FUP_WEIGHT_POSITION ); %#ok<*ST2NM>
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( FUP_WEIGHT_POSITION ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( FUP_WEIGHT_POSITION < 0 ) || ( FUP_WEIGHT_POSITION > 5 ) )
        
        disp('You must enter a value between 0 and 5.');
        
    else
        
         % If array if not blank and value is between 0 and 5, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( FUP_WEIGHT_POSITION( 1, 1, 1 ) >= 0 ) && ( FUP_WEIGHT_POSITION( 1, 1, 1 ) < 1 ) )
            
            FUP_WEIGHT_POSITION( 1, 1, 1 ) = 3;

        elseif ( ( FUP_WEIGHT_POSITION( 1, 1, 1 ) >= 1 ) && ( FUP_WEIGHT_POSITION( 1, 1, 1 ) < 1.2 ) )
            
            FUP_WEIGHT_POSITION( 1, 1, 1 ) = 1.2;

        elseif ( ( FUP_WEIGHT_POSITION( 1, 1, 1 ) > 4.8 ) && ( FUP_WEIGHT_POSITION( 1, 1, 1 ) <= 5 ) )
            
            FUP_WEIGHT_POSITION( 1, 1, 1 ) = 4.8;

        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        FUP_WEIGHT_POSITION = FUP_WEIGHT_POSITION( 1, 1, 1 );
        
    end
    
end

FUP_WEIGHT = struct('LENGTH', FUP_WEIGHT_LENGTH, 'ANGLE', FUP_WEIGHT_ANGLE, 'EN_FOV', FUP_WEIGHT_EN_FOV, 'DISTANCE', FUP_WEIGHT_DISTANCE, 'POSITION', FUP_WEIGHT_POSITION);

end

