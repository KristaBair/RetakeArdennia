function m = Map_Testing(playerName,playerStats)

clc

x = 11; %x cord of the player
y = 6; %y cord of the player
%note, x coord and y coord are backwards

%Sprites locations
randomScenario = 820;
sword = 961;
pyramid = 643;
tree = 34;
bush = 6;
rocks = 70;
question = 822;
castle = 611;
medical = 387;
character = 26;
bridge = 167;
stump = 211;
door = 100;
backgroundArray = ones(11);
foregroundArray = ones(11);

%creates paths for the player to walk on

%Sets the values of if these bosses have been visited
taylorEvent = 0;
ottonEvent = 0;
donovanEvent = 0;
emilyEvent = 0;

%creation of map
mainMap = simpleGameEngine('retro_pack.png', 16, 16, 20, [34, 64, 49]);

%Set sprites location
backgroundArray(1, 6) = castle;
backgroundArray(6, 4) = pyramid;
backgroundArray(9, 5) = medical;
foregroundArray(11, 6) = character;
backgroundArray(11, 11) = question;
backgroundArray(6, 7) = bridge;
backgroundArray(5, 9) = stump;
backgroundArray(9,2) = door;

%sets swords to the background for final boss locations
for i = 1:4
k = 1;
while k ==1
    randX = randi(9)+1;
    randY = randi(9)+1;
    if (backgroundArray(randX, randY) == 1) 
        backgroundArray(randX, randY) = sword;
        k = 2;
    end
end
end
%random sprites, random background decor, 4 fight scenes, 8 random events
while i<=10
    randx = randi(11);
    randy = randi(11);
    if (backgroundArray(randx, randy) == 1)
    backgroundArray(randx, randy) = randomScenario;
    i = i+1;
    end
end

i=0;
while i <16
    randx = randi(11,1);
    randy = randi(11,1);
    if (backgroundArray(randx, randy) == 1)
    backgroundArray(randx, randy) = tree;
    end
    randx = randi(11,1);
    randy = randi(11,1);
    i = i+1;
    if (backgroundArray(randx, randy) == 1)
    backgroundArray(randx, randy) = bush;
    i = i+1;
    end
    randx = randi(11,1);
    randy = randi(11,1);
    if (backgroundArray(randx, randy) == 1)
    backgroundArray(randx, randy) = rocks;
    i = i+1;
    end
end


%sets to see if the player has won
checkWin = 0;

%creates a loop that will always continue as long as nobody has won and the
%player has health
while playerStats.Health > 0 && checkWin == 0
    % Display the map and handle player movement
    drawScene(mainMap, backgroundArray, foregroundArray);
    title("Use 'wasd' to move.");
    xlabel('Please click the screen to move.');

    % Get the player's movement input
    currentMove = getKeyboardInput(mainMap);
    [newx, newy] = user_move(currentMove, x, y);

    % Check if the new position is within bounds
if newx >= 1 && newx <= 11 && newy >= 1 && newy <= 11
        % Update the player's position
        foregroundArray(x, y) = 1;
        x = newx;
        y = newy;
        foregroundArray(x, y) = character;
        %this next if statement checks to see if the player has accsessed a
        %spot with a scenario
    if backgroundArray(x, y) == randomScenario
            % Define available scenarios and trigger one randomly
            close
            availableScenarios = {@healScenario1, @combatScenario1, @RandomTrap1, @hiddenTreasure1, @trivia_scenario};
            randomScenarioIndex = randi(length(availableScenarios));
            selectedScenario = availableScenarios{randomScenarioIndex};
            playerStats = feval(selectedScenario, playerName, playerStats);
            close
            drawScene(mainMap, backgroundArray);
    elseif(backgroundArray(x,y) == sword)
        madeChoice = 0;
            while madeChoice == 0
            bossChoice = randi(4);
            %checks to see if the generals have already been fought has been fought
                if (bossChoice == 1) && (taylorEvent == 0)
                close
                playerStats = TaylorFight(playerName,playerStats);
                close all
                taylorEvent = 1;
                madeChoice = 1;
                elseif (bossChoice == 2) && (emilyEvent == 0)
                close
                playerStats = EmilyFight(playerName, playerStats);
                close all
                emilyEvent = 1;
                madeChoice = 1;
                elseif (bossChoice == 3) && (donovanEvent == 0)
                close
                playerStats = DonovanFight(playerName, playerStats);
                close all
                donovanEvent = 1;
                madeChoice = 1;
                elseif (bossChoice == 4) && (ottonEvent == 0)
                close
                playerStats = OttonFight(playerStats);
                close all
                ottonEvent = 1;
                madeChoice = 1;
                end
            end

        drawScene(mainMap, backgroundArray);

     elseif backgroundArray(x, y) == door
            close
            playerStats = Alley_Riddle(playerName, playerStats);
            drawScene(mainMap, backgroundArray)
        elseif backgroundArray(x, y) == stump
            close
            playerStats = TrapGame(playerName, playerStats);
            drawScene(mainMap, backgroundArray)
        elseif backgroundArray(x, y) == bridge
            close
            playerStats = MontPyFinal(playerName, playerStats);
            drawScene(mainMap, backgroundArray)
        
     elseif(backgroundArray(x,y) == castle)
         %checks to see if the player can enter the castle
         if playerStats.Bosses >= 4
             close
            [checkWin, playerStats.Health] = FinalBoss(playerStats, playerName);
         else
             xlabel('You cannot enter yet. There are still generals left.');
             pause(2)
             xlabel('Please click the screen if input is not working.')
         end
     elseif (backgroundArray(x,y) == medical)
            close
           [playerStats] = HealingSpot(playerStats, playerName);
           drawScene(mainMap, backgroundArray)
     elseif (backgroundArray(x,y) == pyramid)
            close
            playerStats = sphinx(playerStats, playerName);
            drawScene(mainMap, backgroundArray);
     elseif (backgroundArray(x,y) == question)
            close
            playerStats = UnknownV1(playerStats);
            pause(1)
            drawScene(mainMap, backgroundArray);
     end
        % Check if the player landed on randomScenario
        if (backgroundArray(x,y) == medical) || (backgroundArray(x,y) == pyramid) || (backgroundArray(x,y) == question) || (backgroundArray(x,y) == randomScenario) || (backgroundArray(x,y) == sword || (backgroundArray(x,y) == stump) || (backgroundArray(x,y) == bridge || (backgroundArray(x,y) == door)))
                backgroundArray(x,y) = 1;  
        end
    drawScene(mainMap, backgroundArray, foregroundArray);
end

end
%checks to see if the player has died, if so, plays the cutscene
if playerStats.Health <= 0
    close
    deathCutScene()
end

end