
function [win, playerHealth] = FinalBoss(playerStats, playerName)
    close
    cutScene()
    playerHealth = playerStats.Health;
    playerStrength = playerStats.Strength;
    playerAgility = playerStats.Agility;
    playerSmarts = playerStats.Intelligence;
    unlistedCheck = playerStats.unlisted;

    % unlisted effect
    bossHealth = randi(20) + 80;
    if unlistedCheck == 1
        bossHealth = (bossHealth * 0.5) ;
        disp('Dr. Cliff Rat shrieks at the presence of the etched rat skull!')
        pause(2.5)
        disp('His health was halved!')
        pause(2)
    end

    if playerHealth > 50
        bossStrength = randi(4) + 3;
        bossAgility = randi(3);
    else
        bossStrength = randi(2)+3;
        bossAgility = randi(3);
    end

    time = 0;

    %displays tips based on the characters intelligence
    if playerSmarts >= 6
        fprintf('TIPS: Dr. Cliff Rat gets less agressive with attacking over time.\nWhen you defend, you can regain some health every time,\nbut will still take damage if attacked.\nWhen you dodge, you can regain health if you\ndodge succsessfully. If you are strong, you should always defend.\nIf you are agile you should always dodge.');
    elseif playerSmarts >= 4
        fprintf('TIPS: Dr. Cliff Rat gets less agressive over time.\n Defending is based on strength.\nDodging is based on agility. \nYou can regain health when not attacking.');
    elseif playerSmarts >= 2
        fprintf('TIPS: You can regain health by dodging or defending.');
    end

    fprintf("\n%s's Stats:\nHealth - %i\nStrength - %i\nAgility - %i", playerName, playerHealth, playerStrength, playerAgility);
    fprintf("\n\nDr. Rat Cliff's Stats:\nHealth - %i\nStrength - %i\nAgility - %i", bossHealth, bossStrength, bossAgility);

    %creates the while loop for the fight
    while (playerHealth > 0) && (bossHealth > 0)
        time = time+1;
        displayStats(playerName, playerHealth, bossHealth)
        userInput = input('\nWhat would you like to do?\n1. Attack\n2. Defend\n3. Dodge ');
        [a,b] = diceRoll(playerHealth, bossHealth);
        playerMove = userInput;
        close
        bossMove = randi(5);
        %makes the final boss less agressive over time
        if (bossMove == 4) || (bossMove == 5)
            if (time < 15)
                bossMove = 1;
            else
                bossMove = randi(3);
            end
        else
            bossMove = randi(3);
        end
        %displays the move and new health
        [c, d] = displayMove(playerMove, bossMove, playerHealth, bossHealth, a, b, playerStrength, playerAgility, bossStrength, bossAgility);
        pause(1)
        close
        playerHealth = c;
        bossHealth = d;
    end
    if bossHealth <= 0
        winCutScene(playerStats);
        win = 1;
    else
        win = 0;
    end
      
end

%displays the stats in the command window
function s = displayStats(playerName, playerHealth, bossHealth)

 fprintf("\n%s's Health: %.0f\nDr. Cliff Rat's Health: %.0f", playerName, playerHealth, bossHealth);
end

%shows the opening cutscene
function c = cutScene()
    castle = 611;
    rat = 288;
    character = 26;

    castleBackground = simpleGameEngine('retro_pack.png', 16, 16, 20, [34, 64, 49]);
    myArray = ones(5);
    myArray(1,3) = castle;
    myArray(5,3) = character;
    drawScene(castleBackground, myArray);
    pause(1)
    myArray(2,3) = rat;
    drawScene(castleBackground, myArray);
    pause(.5)
    myArray(2,3) = 1;
    myArray(3,3) = rat;
    drawScene(castleBackground, myArray);
    pause(.5)
    title('Dr. Cliff Rat: Have you come to defeat me at last?')
    pause(3)
    title('Dr. Cliff Rat: Very well...');
    pause(3)
    title('')
    myArray(3,3) = 1;
    myArray(2,3) = rat;
    drawScene(castleBackground, myArray);
    pause(.5)
    myArray(2,3) = 1;
    drawScene(castleBackground, myArray);
    pause(.5)
    myArray(5,3) = 1;
    myArray(4,3) = character;
    drawScene(castleBackground, myArray);
    pause(.5)
    myArray(4,3) = 1;
    myArray(3,3) = character;
    drawScene(castleBackground, myArray);
    pause(.5)
    myArray(3,3) = 1;
    myArray(2,3) = character;
    drawScene(castleBackground, myArray);
    pause(.5)
    myArray(2,3) = 1;
    drawScene(castleBackground, myArray);
    pause(.5)
    title('Go to command window...');
    pause(1)

end

%does the dice roll for the player and boss
function [playerRoll, bossRoll] = diceRoll(playerHealth, bossHealth)
    
    playerRoll = randi(6);
    bossRoll = randi(6);
    myCastle = simpleGameEngine("retro_pack.png", 16, 16, 20, [80, 80, 80]);
    floor = ones(6);
    floor(3,1) = 26;
    floor(3, 6) = 288;
    floor(3,2) = 858 + playerRoll;
    floor(3,5) = 858 + bossRoll;
    floor = displayHealth(playerHealth, bossHealth, floor);
    drawScene(myCastle, floor);
    pause(2);
    close

    

end

%displays the move of the player and boss on the graphics
function [playerHealth, bossHealth] = displayMove(playerMove, bossMove, playerHealth, bossHealth, playerRoll, bossRoll, playerStrength, playerAgility, bossStrength, bossAgility)

    rat = 288;
    character = 26;
    sword = 961;
    shield = 840;

    myCastle2 = simpleGameEngine("retro_pack.png", 16, 16, 20, [80, 80, 80]);
    floor2 = ones(6);
    floor2(3,1) = character;
    floor2(3, 6) = rat;

    

    if (playerMove == 1)
        if (bossMove == 1)
            floor2(3,1) = 1;
            floor2(3,2) = character;
            floor2(3,3) = sword;
            floor2(3,6) = 1;
            floor2(3,5) = rat;
            floor2(3,4) = sword;
            playerHealth = playerHealth - (bossStrength + bossRoll);
            bossHealth = bossHealth - (playerStrength + playerRoll);
        elseif (bossMove == 2)
            floor2(3,1) = 1;
            floor2(3,3) = character;
            floor2(3,4) = sword;
            floor2(3,5) = shield;
            floor2(3,6) = rat;
            if bossRoll <= (playerRoll + playerStrength)
            bossHealth = bossHealth + bossRoll - (playerRoll + playerStrength);
            end
        else
            floor2(3,1) = 1;
            floor2(3,4) = character;
            floor2(3,5) = sword;
            floor2(3,6) = 1;
            floor2(2, 6) = rat;
            if (bossAgility + bossRoll) < 6
                bossHealth = bossHealth - (playerStrength + playerRoll);
                floor2(3,6) = rat;
                floor2(2,6) = 1;
            end

        end
    elseif (playerMove == 2)
        playerHealth = playerHealth + randi(5);
       if (bossMove == 1)
        floor2(3,1) = character;
        floor2(3,2) = shield;
        floor2(3,3) = sword;
        floor2(3,4) = rat;
        floor2(3,6) = 1;
        if playerRoll <= (bossStrength + bossRoll)
        playerHealth = playerHealth + playerRoll - (bossStrength + bossRoll);
        end
       elseif (bossMove == 2)
           floor2(3,1) = character;
           floor2(3,2) = shield;
           floor2(3,6) = rat;
           floor2(3,5) = shield;
       else
           floor2(3,1) = character;
           floor2(3,2) = shield;
           floor2(2,6) = rat;
           floor2(3,6) = 1;
       end
    else
        if (bossMove == 1)
            floor2(3,1) = 1;
            floor2(4,1) = character;
            floor2(3,2) = sword;
            floor2(3,3) = rat;
            floor2(3,6) = 1;
            if (playerAgility + playerRoll) < 6
               playerHealth = playerHealth - (bossStrength + bossRoll);
               floor2(3,1) = character;
               floor2(4,1) = 1;
            else
                playerHealth = playerHealth + randi(5);
            end
        elseif (bossMove == 2)
            floor2(3,1) = 1;
            floor2(4,1) = character;
            floor2(3,5) = shield;
            floor2(3,6) = rat;
        else
            floor2(3,1) = 1;
            floor2(4,1) = character;
            floor2(3,6) = 1;
            floor2(2,6) = rat;
        end
    end
       floor2 = displayHealth(playerHealth, bossHealth, floor2);
       drawScene(myCastle2, floor2);
       pause(2)
       
end

%displays the player and boss health
function outArray = displayHealth(playerHealth, bossHealth, array)

    fullHeart = 731;
    halfHeart = 730;
    emptyHeart = 729;

    if (playerHealth >= 60)
        array(2, 1:3) = fullHeart;
    elseif (playerHealth >= 48)
        array(2, 1:2) = fullHeart;
        array(2, 3) = halfHeart;
    elseif (playerHealth >= 36)
        array(2, 1:2) = fullHeart;
        array(2, 3) = emptyHeart;
    elseif (playerHealth >= 24)
        array(2, 1) = fullHeart;
        array(2,2) = halfHeart;
        array(2,3) = emptyHeart;
    elseif (playerHealth >= 12)
        array (2,1) = fullHeart;
        array(2,2:3) = emptyHeart;
    elseif (playerHealth > 0)
        array(2,1) = halfHeart;
        array(2,2:3) = emptyHeart;
    else
        array(2,1:3) = emptyHeart;
    end

    if bossHealth >= 88
        array(4, 2:6) = fullHeart;
    elseif bossHealth >= 77
        array(4, 2) = halfHeart;
        array(4,3:6) = fullHeart;
    elseif bossHealth >= 66
        array(4,2) = emptyHeart;
        array(4,3:6) = fullHeart;
    elseif bossHealth >= 55
        array(4,2) = emptyHeart;
        array(4,3) = halfHeart;
        array(4,4:6) = fullHeart;
    elseif bossHealth >= 44
        array(4,2:3) = emptyHeart;
        array(4,4:6) = fullHeart;
    elseif bossHealth >= 33
        array(4,2:3) = emptyHeart;
        array(4,4) = halfHeart;
        array(4,5:6) = fullHeart;
    elseif bossHealth >= 22
        array(4,2:4) = emptyHeart;
        array(4, 5:6) = fullHeart;
    elseif bossHealth >= 11
        array(4, 2:4) = emptyHeart;
        array(4, 5) = halfHeart;
        array(4,6) = fullHeart;
    elseif bossHealth > 0
        array(4, 2:5) = emptyHeart;
        array(4, 6) = halfHeart;
    else
        array(4, 2:6) = emptyHeart;
    end


    outArray = array;
end
      
%displays the winning cutscene
function o = winCutScene(playerStats)

    character = 26;
    rat = 288;
    castle = 611;
    unlistedCheck = playerStats.unlisted; %attempt at getting it to work
    
    backgroundArray = ones(5);
    background = simpleGameEngine('retro_pack.png', 16, 16, 20, [34 64 49]);
    backgroundArray(1,3) = castle;
    backgroundArray(3,1) = character;
    backgroundArray(3,5) = rat;

    drawScene(background, backgroundArray);
    title('Dr. Cliff Rat: Congratulations...');
    pause(2)
    title('Dr. Cliff Rat: You have defeated me.');
    pause(2.5)
    title('Dr. Cliff Rat: Well, you can take my castle...');
    pause(2.5)
    title('Dr. Cliff Rat: and my generals...');
    pause(2)
    title('Dr. Cliff Rat: and my people.');
    pause(2)
    title("Dr. Cliff Rat: And they'll love you at first...");
    pause(2.5)
    title('Dr. Cliff Rat: They always do.');
    pause(2)
    title("Dr. Cliff Rat: But then they'll get bored...");
    pause(2)
    title('Dr. Cliff Rat: And seek out someone else.');
    pause(2)
    title('Dr. Cliff Rat: Your time will come as well...');
    pause(2)
    title('Dr. Cliff Rat: It always does...');
    pause(4);
    backgroundArray(3,5) = 1;
    backgroundArray(3,4) = rat;
    drawScene(background, backgroundArray);
    pause(1);
    backgroundArray(3,4) = 1;
    backgroundArray(3,3) = rat;
    drawScene(background, backgroundArray);
    pause(1)
    backgroundArray(3,3) = 1;
    backgroundArray(4,3) = rat;
    drawScene(background, backgroundArray);
    pause(1)
    backgroundArray(4,3) = 1;
    backgroundArray(5,3) = rat;
    drawScene(background, backgroundArray);
    pause(1)
    backgroundArray(5,3) = 1;
    drawScene(background, backgroundArray);
    pause(1)
    backgroundArray(3,1) = 1;
    backgroundArray(3,2) = character;
    drawScene(background, backgroundArray);
    pause(1)
    backgroundArray(3,2) = 1;
    backgroundArray(3,3) = character;
    drawScene(background, backgroundArray);
    pause(1)

    % adding this extra cutscene as a payoff to the unlisted stat
    if unlistedCheck == 1
    portal = 384 ;
    ratSkull = 481 ;
    specArray = ones(3) ;
    specArrayTop = ones(3) ;
    backArray = simpleGameEngine('retro_pack.png', 16, 16, 20, [34 64 49]);
    specArray(1,1) = 2 ; 
    specArray(2,2) = portal ;
    specArray(2,3) = 70 ;
    specArray(3,2) = 7 ;
    drawScene(backArray,specArray)
    title('A portal appears before you...')
    pause(2)
    title('Knowing what to do, you toss the etched skull in.')
    pause(3)
    specArrayTop(2,2) = ratSkull ;
    drawScene(backArray,specArray,specArrayTop)
    pause(1.5)
    specArray(2,2) = 380 ;
    specArrayTop(2,2) = 1 ;
    drawScene(backArray,specArray,specArrayTop)
    pause(2)
    specArray(2,2) = 1 ;
    drawScene(backArray,specArray)
    pause(3)
    end


    backgroundArray = character;
    drawScene(background, backgroundArray);
    title("Player, you've won!");
    pause(2)
    title('You have saved us!');
    pause(2)
    title("Congratulations! You've won the game!")
    pause(1)
    background = simpleGameEngine('retro_pack.png', 16, 16, 20, [0 0 0]);
    backgroundArray = 653;
    drawScene(background, backgroundArray);
    title("Congratulations! You've won the game!");

    userChoice = input("Would you like to play again? 'y' or 'n'", 's');
    if strcmp(userChoice, 'y')
        close
        close all
        StartOfGame()
    else
        close 
        close all
    end


end
