function playerStats = TaylorFight(playerName,playerStats)

clc
    
    i = 2;

    %sets the variables and sprites
    character = 26;
    taylor = 319;
    wall = 888;
    dog = 256;
    cornerUL = 433;
    cornerUR = 435;
    cornerLL = 497;
    cornerLR = 499;
    topBord = 434;
    leftBord = 465;
    rightBord = 467;
    bottBord = 498;

    %creates the map
    mainMap2 = simpleGameEngine('retro_pack.png', 16, 16, 20, [34, 64, 49]);
    backgroundArray2 = ones(5);
    backgroundArray2(1,:) = topBord;
    backgroundArray2(5,:) = bottBord;
    backgroundArray2(:,1) = leftBord;
    backgroundArray2(:,5) = rightBord;
    backgroundArray2(1,1) = cornerUL;
    backgroundArray2(1,5) = cornerUR;
    backgroundArray2(5,1) = cornerLL;
    backgroundArray2(5,5) = cornerLR;
    backgroundArray2(3,2) = taylor;
    backgroundArray2(3,4) = character;
    drawScene(mainMap2, backgroundArray2);

    title("Skip cutscene? 'y' or 'n'");
    xlabel('Click screen if input not working.');
    userInput = getKeyboardInput(mainMap2);
    if strcmp(userInput, 'y')
        i = 1;
    end

    %The main cutscene to introduce the game
    if i == 2
    title('Taylor: Who are you?');
    pause(2.5)
    drawScene(mainMap2, backgroundArray2);
    title('Taylor: What are you doing in my house?');
    pause(3)
    title([playerName ': Uh... I am here to defeat you?']);
    pause(2.5)
    title('Taylor: Come on man...');
    pause(2)
    title('Taylor: Its my day off.');
    pause(2)
    title([playerName ': I can just go...']);
    pause(2.5)
    title('Taylor: No, no, its fine.');
    pause(2)
    title("Taylor: You're here now.");
    pause(2)
    title([playerName ': Uh... so do we fight now?'])
    pause(2.5)
    title('Taylor: No, who do you think I am?')
    pause(2)
    title('Taylor: I am going to release my dogs.')
    pause(2.5)
    title('Taylor: Hopefully you can escape before...')
    pause(2.5)
    title([playerName ': ...before?'])
    pause(2)
    title("Taylor: Well... you'll see.")
    pause(3)
    close
    end

    %creates the walls for the maze
    backgroundArray2 = ones(11);
    backgroundArray2(1,:) = wall;
    backgroundArray2(11,:) = wall;
    backgroundArray2(:,1) = wall;
    backgroundArray2(:,11) = wall;
    backgroundArray2(1, 10) = 1;

    backgroundArray2(3, 7:1:9) = wall;
    backgroundArray2(5:1:7, 10) = wall;
    backgroundArray2(5, 6:1:8) = wall;
    backgroundArray2(6:1:7, 8) = wall;
    backgroundArray2(9, 6:1:9) = wall;
    backgroundArray2(3,5) = wall;
    backgroundArray2(3:1:5, 4) = wall;
    backgroundArray2(6,3) = wall;
    backgroundArray2(7, 5:1:7) = wall;
    backgroundArray2(9,5) = wall;
    backgroundArray2(8:1:9, 3) = wall;
    backgroundArray2(3:1:4, 2) = wall;
    backgroundArray2(3,7) = wall;

    backgroundArray2(4,8) = dog;
    backgroundArray2(2,2) = dog;
    backgroundArray2(10,2) = character;
    drawScene(mainMap2, backgroundArray2);
    title('Use WASD to escape.');
    
    %sets the dog's and the player's coordinates
    pX = 10;
    pY = 2;
    d1X =4;
    d1Y =8;
    d2X =2;
    d2Y = 2;

    %creates the loop for the game
    gameOver = 0;
    while (gameOver == 0)

        %makes the player and the dogs move based on player input
        userInput = getKeyboardInput(mainMap2);
        [nY, nX] = playerMove(userInput, pX, pY, backgroundArray2);
        backgroundArray2(pX, pY) = 1;
        backgroundArray2(nX, nY) = character;
        pY = nY;
        pX = nX;
        drawScene(mainMap2, backgroundArray2);
        [nY, nX] = dogMove(d1X, d1Y, backgroundArray2, pX, pY);
        if (nX == 1)
            nX = nX -1;
        end
        backgroundArray2(d1X, d1Y) = 1;
        backgroundArray2(nX, nY) = dog;
        drawScene(mainMap2, backgroundArray2);
        d1X = nX;
        d1Y = nY;
        [nY1, nX1] = dogMove(d2X, d2Y, backgroundArray2, pX, pY);
        if (nX1 == 1)
          nX1 = nX1 + 1;
        end
        backgroundArray2(d2X, d2Y) = 1;
        backgroundArray2(nX1, nY1) = dog;
        drawScene(mainMap2, backgroundArray2);
        d2X = nX1;
        d2Y = nY1;

        gameOver = checkWin(pX, pY, d1X, d1Y, d2X, d2Y);

    end
    %displays end of game results
    if gameOver == 1
        playerStats.Health = 0;
    elseif gameOver == 2
        title('You have escaped!')
        pause(1.5)
        playerStats.Bosses = playerStats.Bosses + 1;
        randomStat = randi(4);
        if randomStat == 1
            title('Strength +2')
            playerStats.Strength = playerStats.Strength + 2;
            pause(3)
        elseif randomStat == 2
            title('Intelligence +2')
            playerStats.Intelligence = playerStats.Intelligence + 2;
            pause(3)
        elseif randomStat == 3
            title('Agility +2')
            playerStats.Agility = playerStats.Agility + 2;
            pause(3)
        else
            title('Health +5')
            playerStats.Health = playerStats.Health + 5;
            pause(3)
        end
    end

end

%takes player input and moves the player
function [nY, nX] = playerMove(userInput, pX, pY, array)
    if (strcmp(userInput, 'w') && (array(pX-1, pY)==1))
        nY = pY;
        nX = pX -1;
    elseif (strcmp(userInput, 'd') && (array(pX, pY+1)==1))
        nY = pY+1;
        nX = pX;
    elseif (strcmp(userInput, 'a') && (array(pX, pY-1)==1))
        nY = pY-1;
        nX = pX;
    elseif (strcmp(userInput, 's') && (array(pX+1, pY)==1))
        nY = pY;
        nX = pX +1;
    else
        nY = pY;
        nX = pX;
        
    end
end

%takes player input and moves the dogs towards the player
function [nY, nX] = dogMove(pX, pY, array, oX, oY)
    turn = 0;
    while turn < 5
    if ((array(pX-1, pY)==1) || array(pX-1, pY) == 26) && ((oX < pX) || (oX == 0))
        nY = pY;
        nX = pX -1;
        turn = 5;
    elseif ((array(pX, pY+1)==1) || array(pX, pY+1) == 26)  && ((oY > pY) || (oY == 0))
        nY = pY+1;
        nX = pX;
        turn = 5;
    elseif ((array(pX, pY-1)==1) || array(pX, pY-1) == 26) && ((oY < pY) || (oY == 0))
        nY = pY-1;
        nX = pX;
        turn = 5;
    elseif ((array(pX+1, pY)==1)|| array(pX+1, pY) == 26) && ((oX > pX) || (oX == 0))
        nY = pY;
        nX = pX +1;
        turn = 5;
    else
        nY = pY;
        nX = pX;
        oY = 0;
        oX = 0;
        turn = turn+4;
        
    end
    end
end

%checks to see who won the game
function c = checkWin(pX, pY, d1X, d1Y, d2X, d2Y)
    if (pX == 1) && (pY == 10)
        c = 2;
    elseif (pX == d1X) && (pY == d1Y)
        c = 1;
    elseif (pX == d2X) && (pY == d2Y)
        c = 1;
    else
        c=0;

    end    

end
