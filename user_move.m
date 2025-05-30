function [newx, newy] = user_move(currentMove, x, y)

% this may be a redundant variable but I'm leaving it
failsafe = 0;

while failsafe == 0

    %moves the player down
    if (strcmp(currentMove,'w') == 0) && (strcmp(currentMove,'a') == 0) && (strcmp(currentMove,'s') == 0) && (strcmp(currentMove,'d') == 0)
        fprintf('''%s'' is not a valid input, please use ''WASD''.\n',currentMove)
        newx = x;
        newy = y;
        break;
    elseif (strcmp(currentMove,'d') == 1) && (y < 11)
        newy = y + 1;
        newx = x;
        failsafe = 1;
    %moves the player up
    elseif (strcmp(currentMove,'w') == 1) && (x > 1)
        newx = x -1;
        newy = y;
        failsafe = 1;
    %moves the player left
    elseif (strcmp(currentMove,'a') == 1) && (y > 1)
        newy = y -1;
        newx = x;
        failsafe = 1;
    %moves the player right
    elseif (strcmp(currentMove,'s') == 1) && (x < 11)
        newx = x +1;
        newy = y;
        failsafe = 1;
    end


end