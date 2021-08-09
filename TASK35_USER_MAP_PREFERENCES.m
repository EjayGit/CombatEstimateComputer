% T_1035: User Map Preferences.
%
% ROUTE_EN_FOV: Scale 0 - 10: ***
% 0 = default (5).
% 1 = Route inside En FOV more acceptable.
% 9 = Route inside En FOV less acceptable.
%
% ROUTE_LENGTH: Scale 1 - 3: ***
% 0 = default (2).
% 1 = Shorter Route Length Preferred over being inside En_FOV: QFs divided by D^3. 
% 2 = Balance between route length and being inside En FOV: QFs divided by D^2.
% 3 = Longer route lengths preferred to help remain being outside En FOV: QFs divided by D.
%
% BLIND: ***WILL NEED TO CONSIDER EMPLOYING STRUCTURING ELEMENTS TO SEARCH FOR GAPS OF 40 METRES***
% 0 = default (2).
% 1 = Blinds are not available.
% 2 = Blinds are available.

function [ ROUTE_WEIGHT ] = TASK35_USER_MAP_PREFERENCES

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_ROUTE_EN_FOV = input( 'ROUTE EN FOV WEIGHTING: 0 = Default. 1 = Route inside En Fov is considered more acceptable. 9 = Route inside En FOV is considered less acceptable... ','s');
    ROUTE_EN_FOV = str2num( USER_ROUTE_EN_FOV );
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( ROUTE_EN_FOV ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( ROUTE_EN_FOV < 0 ) || ( ROUTE_EN_FOV > 9 ) )
        
        disp('You must enter a value between 0 and 9.');
        
    else
        
         % If array if not blank and value is between 0 and 9, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( ROUTE_EN_FOV( 1, 1, 1 ) >= 0 ) && ( ROUTE_EN_FOV( 1, 1, 1 ) < 1 ) )
            
            ROUTE_EN_FOV( 1, 1, 1 ) = 5;

        elseif ( ( ROUTE_EN_FOV( 1, 1, 1 ) >= 1 ) && ( ROUTE_EN_FOV( 1, 1, 1 ) < 1.2 ) )
            
            ROUTE_EN_FOV( 1, 1, 1 ) = 1.2;
        
        elseif ( ( ROUTE_EN_FOV( 1, 1, 1 ) > 8.8 ) && ( ROUTE_EN_FOV( 1, 1, 1 ) <= 9 ) )
            
            ROUTE_EN_FOV( 1, 1, 1 ) = 8.8;
            
        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        ROUTE_EN_FOV = ROUTE_EN_FOV( 1, 1, 1 );
        
    end
    
end

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_ROUTE_LENGTH = input( 'ROUTE LENGTH WEIGHTING: 0 = Default. 1 = Shorter Route Length Preferred. 2 = Balance between route length and being inside En FOV. 3 = Longer route lengths preferred. ','s');
    ROUTE_LENGTH = str2num( USER_ROUTE_LENGTH );
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( ROUTE_LENGTH ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( ROUTE_LENGTH < 0 ) || ( ROUTE_LENGTH > 3 ) )
        
        disp('You must enter a value between 0 and 3.');
        
    else
        
         % If array if not blank and value is between 1 and 3, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( ROUTE_LENGTH( 1, 1, 1 ) >= 0 ) && ( ROUTE_LENGTH( 1, 1, 1 ) < 1 ) )
            
            ROUTE_LENGTH( 1, 1, 1 ) = 2;

        elseif ( ( ROUTE_LENGTH( 1, 1, 1 ) >= 1 ) && ( ROUTE_LENGTH( 1, 1, 1 ) < 2 ) )
            
            ROUTE_LENGTH( 1, 1, 1 ) = 1;

        elseif ( ( ROUTE_LENGTH( 1, 1, 1 ) >= 2 ) && ( ROUTE_LENGTH( 1, 1, 1 ) < 3 ) )
            
            ROUTE_LENGTH( 1, 1, 1 ) = 2;
            
        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        ROUTE_LENGTH = ROUTE_LENGTH( 1, 1, 1 );
        
    end
    
end

% Initialise conditions for the while loop.
ONLY_NUM = false;

% When ONLY_NUM is set to false, request and check for numerical value
% entered by user.
while ONLY_NUM == false
    
    % Prompt user and collect user input.
    USER_BLIND = input( 'BLIND AVAILABILITY: 0 = Default. 1 = Blinds NOT available. 2 = Blinds available. ','s');
    BLIND = str2num( USER_BLIND ); %#ok<*ST2NM>
    
    % Convert string to numeric array. If non-numeric values are in matrix,
    % then leave array blank.
    if isempty( BLIND ) == true
        
        % If array is blank, request user to enter numeric value again.
        disp('You must enter a numerical value.');
        
    elseif ( ( BLIND < 0 ) || ( BLIND > 2 ) )
        
        disp('You must enter a value between 0 and 2.');
        
    else
        
         % If array if not blank and value is between 0 and 2, set conditions to end while loop.
        ONLY_NUM = true;
        
        if ( ( BLIND( 1, 1, 1 ) >= 0 ) && ( BLIND( 1, 1, 1 ) < 1 ) )
            
            BLIND( 1, 1, 1 ) = 2;

        elseif ( ( BLIND( 1, 1, 1 ) >= 1 ) && ( BLIND( 1, 1, 1 ) < 2 ) )
            
            BLIND( 1, 1, 1 ) = 1;

        end
        
        % Ensure that only the number in the first element is sent to output in the event that the
        % user entered more than one value.
        BLIND = BLIND( 1, 1, 1 );
        
    end
    
end

ROUTE_WEIGHT = struct('EN_FOV', ROUTE_EN_FOV, 'LENGTH', ROUTE_LENGTH, 'BLIND', BLIND);

end

