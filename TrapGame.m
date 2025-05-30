function [playerStats] = TrapGame(playerName, playerStats)
clc
%set outsome to no winner
winner = 0;

%initializes background
mybackground3 = simpleGameEngine('retro_pack.png', 16, 16, 30, [10 10 100]);
myArray = ones(11);
myArray(6,6) = 221;
myX = 6;
myY = 6;
drawScene(mybackground3, myArray);
title('Trap the Monster. Click to add walls.')
xlabel('Must trap the monster completely. Do not click the monster.');

%actual gameplay
while winner == 0
    [myArray] = PlayerMove(myX, myY, myArray, mybackground3);
    [myArray, winner, myX, myY] = ComputerMove(myX, myY, myArray);
    if (winner == 0)
    winner = checkWinner(myX, myY);
    end
    drawScene(mybackground3, myArray);
end

if (winner == 1)
    title('Player wins!');
    pause(3);
else
    title('Monster wins!');
    playerStats.Health = 0;
    pause(3);
end
end

function [array] = PlayerMove(myX, myY, array, backgroundPic)
    [r,c] = getMouseInput(backgroundPic);
    i=0;
    while ((myX ~= r) && (myY ~= c) && (i==0))
        if (myX ~= r) && (myY ~= c)
            i = 1;
        else
            [r,c] = getMouseInput(mybackground);
        end
    end
    array(r,c) = 44;
end

%Plays the monsters move.
function [array, outcome, newx, newy] = ComputerMove(myX, myY, array)
    if ((array(myX+1, myY) == 44) && (array(myX-1, myY) == 44) && (array(myX, myY-1) == 44) && (array(myX, myY + 1) == 44))
        outcome = 1;
        newx = myX;
        newy = myY;
    elseif (myX == 11) || (myX == 1) || (myY == 11) || (myY == 1)
        newx = myX;
        newy = myY;
        outcome = 2;
    else
        outcome = 0;
        [mL, mR, mU, mD] = checkMove(myX, myY, array);
        r = 1;
        while r ~= 0
        if (mL >= mR) && (mL >= mU) && (mL >= mD) && (array(myX-1, myY) ~= 44)
            newx = myX -1;
            newy = myY;
            r=0;
        elseif (mR >= mU) && (mR >= mD) && (array(myX+1, myY) ~= 44)
            newx = myX +1;
            newy = myY;
            r=0;
        elseif (mU >= mD) && (array(myX, myY + 1) ~= 44)
            newx = myX;
            newy = myY +1;
            r=0;
        elseif (array(myX, myY -1) ~= 44)
            newx = myX;
            newy = myY -1;
            r=0;
        else
            mU = 0;
            mD = 0;
            mR = 0;
            mL = 0;
            
        end
        
        end
        
    end
    if (newx > 1) || (newx < 11) && (newy < 1) && (newy > 11)
        array(newx, newy) = 221;
        array(myX, myY) = 1; 
    else
        newx = myX;
        newy = myY;
        outcome = 2;
    end
    end

    %Checks to see who won the game.
    function outcome = checkWinner(currentX, currentY)
        if (currentX > 12) || (currentX < 0) || (currentY < 0) || (currentY > 12)
            outcome = 2;
        else
            outcome = 0;
        end
    end

    function [moveLeft, moveRight, moveUp, moveDown] = checkMove(x, y, array)
        moveLeft = 0;
        moveRight = 0;
        moveUp = 0;
        moveDown = 0;
     
        canLoop = 1;
        i = x;
        while (canLoop == 1) && (i>1)
            i = i-1;
            if (array(i, y) ~= 44) && (((x+i)~=12))
                moveLeft = moveLeft + 1;
                if (x+i) == 11
                    moveLeft = moveLeft - (moveLeft*2);
                end
            else
             canLoop = 0;
            end
        end
        canLoop = 1;
        i = x;
        while (canLoop == 1) && (i<11)
            i = i+1;
            if (array(i, y) ~= 44) && ((x+i)~=12)
                moveRight = moveRight + 1;
                if (x+i) == 11
                    moveRight = moveRight - moveRight*2;
                end
            else
             canLoop = 0;
            end
        end
        canLoop = 1;
        i = y;
        while (canLoop == 1) && (i>1)
            i = i-1;
            if (array(x, i) ~= 44)
                moveDown = moveDown + 1;
                if (i) == 11
                    moveDown = moveDown - moveDown*2;
                end
            else
             canLoop = 0;
            end
        end
        canLoop = 1;
        i = y;
        while (canLoop == 1) && (i<11)
            i = i+1;
            if (array(x, i) ~= 44) && ((y+i)~=12)
                moveUp = moveUp + 1;
                if (y+i) == 11
                    moveUp = moveUp - moveUp*2;
                end
            else
            canLoop = 0;
            end
        end
    end
