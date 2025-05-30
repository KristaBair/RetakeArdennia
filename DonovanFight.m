function playerStats = DonovanFight(playerName,playerStats)

% easy reference for icons 
character = 26;
donovan = 57 ;
wallDoor = 518 ;
wallBeam = 587 ;
wallRein = 588 ;
mirror = 257 ;
cabinet = 229 ;
floor = 52 ;
spell = 384 ;
grass = 2 ;
empty = 1 ;
cornerUL = 433 ;
cornerUR = 435 ;
cornerLL = 497 ;
cornerLR = 499 ;
topBord = 434 ;
leftBord = 465 ;
rightBord = 467 ;
bottBord = 498 ;
D1 = 891;
D2 = 892;
D3 = 893;
D4 = 894;
D5 = 895;
D6 = 896;

% creating graphics basics
gen = simpleGameEngine('retro_pack.png',16,16,20,[34,64,49]) ;
backgroundIntro = ones(5);
backgroundIntro(1,:) = topBord;
backgroundIntro(5,:) = bottBord;
backgroundIntro(:,1) = leftBord;
backgroundIntro(:,5) = rightBord;
backgroundIntro(1,1) = cornerUL;
backgroundIntro(1,5) = cornerUR;
backgroundIntro(5,1) = cornerLL;
backgroundIntro(5,5) = cornerLR;
backgroundIntro(3,2) = character;
backgroundIntro(3,4) = donovan;
drawScene(gen, backgroundIntro) ;
title("Skip cutscene? 'y' or 'n'")
xlabel('If your input is not working, click the figure window.')
userInput = getKeyboardInput(gen);


% cutscene dialogue
if userInput == 'n'
title('Donovan: I know who you are...') ;
pause(2.5)
title([playerName ': But do you know why...'])
pause(2.5)
title('Donovan: Of course I know why you are here. I would be a bad general if I didn''t!')
pause(3)
title('Donovan: But you shall never reach the castle, or Dr. Cliff Rat!')
pause(3)
% The mess to setup the fight scene
backgroundFight = [1,1,1,1;1,1,1,1;1,1,1,1;1,1,1,1] ;
backgroundFight(1,1) = wallRein ;
backgroundFight(1,2) = wallDoor ;
backgroundFight(1,3) = wallBeam ;
backgroundFight(1,4) = wallRein ;
backgroundFight(2,1) = grass ;
backgroundFight(2,2) = floor ;
backgroundFight(2,3) = mirror ;
backgroundFight(2,4) = cabinet ;
backgroundFight(3,1) = character ;
backgroundFight(3,2) = empty ;
backgroundFight(3,3) = spell ;
backgroundFight(3,4) = donovan ;
drawScene(gen,backgroundFight) ;
title('Defeat the Dark Wizard Donovan')

elseif userInput == 'y'
% The mess to setup the fight scene
backgroundFight = [1,1,1,1;1,1,1,1;1,1,1,1;1,1,1,1] ;
backgroundFight(1,1) = wallRein ;
backgroundFight(1,2) = wallDoor ;
backgroundFight(1,3) = wallBeam ;
backgroundFight(1,4) = wallRein ;
backgroundFight(2,1) = grass ;
backgroundFight(2,2) = floor ;
backgroundFight(2,3) = mirror ;
backgroundFight(2,4) = cabinet ;
backgroundFight(3,1) = character ;
backgroundFight(3,2) = empty ;
backgroundFight(3,3) = spell ;
backgroundFight(3,4) = donovan ;
drawScene(gen,backgroundFight) ;
title('Defeat the Dark Wizard Donovan')
end

% Donovan's stats
healthDonovan = randi([45,70]) ;
    % Stats match a slightly boosted Scholar)
    StrengthD = 2;
    IntellectD = 7;
    AgilitD = 5;
    

% starting text for the fight
    % will update the defend/flee keys to match other scenarios
        % This is different from the other combats, dw about it
fprintf('The Dark Wizard has %.0f hitpoints.',healthDonovan)
disp(newline)
pause(1.5)

% main loop for the combat
    % may or may not add graphics to adjust sprite positions to simulate
    % the action

    % created for general use in the function
    die = 1:6 ;

    %create control variable to decide path after while loop ends
    i = 0;

while (healthDonovan > 0) && (playerStats.Health > 0)
    backgroundFight(4,:) = 1;
    drawScene(gen,backgroundFight)
    xlabel('Use command window for inputs.')
    choice = input('Press 1 to attack, 2 to defend, 3 to dodge, and 4 to check your health.\n');

% attack    
    if choice == 1

    % player roll/attack
    roll = randi(length(die)) ;
    dieRoll = die(roll) ;

    % player's attack
    damage = dieRoll + playerStats.Strength ;
        switch dieRoll
            case 1
                RP = D1;
            case 2 
                RP = D2;
            case 3
                RP = D3;
            case 4
                RP = D4;
            case 5
                RP = D5;
            case 6
                RP = D6;
        end
    backgroundFight(4,1) = RP;
    drawScene(gen,backgroundFight)
    pause(0.5)
    
    % Chance for Donovan to attack/defend

    chanceRoll = randi(length(die)) ;
    chanceAD = die(chanceRoll) ;

    % if attack is rolled
        if chanceAD >= 4

            healthDonovan = healthDonovan - damage ;
            if healthDonovan <= 0
               i = 1;
               healthDonovan = 0;
               fprintf('The Dark Wizard has %.0f hitpoints remaining',healthDonovan)
               break;
            end
            fprintf('The Dark Wizard has %.0f hitpoints remaining',healthDonovan)
            disp(newline)
            pause(1.5)

            disp('Donovan chose to attack.')
            disp(newline)
            pause(0.5)

            rollD = randi(length(die)) ;
            dieRollD = die(rollD) ;
                switch dieRollD
                    case 1
                        RD = D1;
                    case 2
                        RD = D2;
                    case 3
                        RD = D3;
                    case 4
                        RD = D4;
                    case 5
                        RD = D5;
                    case 6
                        RD = D6;
                end
            backgroundFight(4,4) = RD;
            drawScene(gen,backgroundFight)
            damageD = (dieRollD + IntellectD) - 3 ;
            pause(0.5)

            playerStats.Health = playerStats.Health - damageD ;
            if playerStats.Health <= 0
               i = 2;
               playerStats.Health = 0;
               fprintf('You have %.0f hitpoints remaining.',playerStats.Health)
               break;
            end
            fprintf('You have %.0f hitpoints remaining.',playerStats.Health)
            disp(newline)
            pause(1.5)
        
    % if defend is rolled
        else

            disp('Donovan chose to defend.')
            disp(newline)
            pause(0.5)

            rollDef = randi(length(die)) ;
            defendRoll = die(rollDef) ;
            switch defendRoll
                    case 1
                        RD = D1;
                    case 2
                        RD = D2;
                    case 3
                        RD = D3;
                    case 4
                        RD = D4;
                    case 5
                        RD = D5;
                    case 6
                        RD = D6;
            end
            backgroundFight(4,4) = RD;
            drawScene(gen,backgroundFight)

            defendValue = defendRoll + StrengthD ;

            if damage > defendValue
               
               newdamage = damage - defendValue ;
               healthDonovan = healthDonovan - newdamage ;
                disp('You broke through his defense!')
               
               if healthDonovan <= 0
                  i = 1;
                  healthDonovan = 0;
                  fprintf('The Dark Wizard has %.0f hitpoints remaining',healthDonovan)
                  break;
               end
               fprintf('The Dark Wizard has %.0f hitpoints remaining',healthDonovan)
               disp(newline)
               pause(1.5)

           else
               disp('Your attack was blocked.')
               disp(newline)
               pause(1.5)
            end
        end
% defend 
    elseif choice == 2

        % player roll
        roll = randi(length(die)) ;
        defenseRoll = die(roll) ;

        switch defenseRoll
            case 1
                RP = D1;
            case 2 
                RP = D2;
            case 3
                RP = D3;
            case 4
                RP = D4;
            case 5
                RP = D5;
            case 6
                RP = D6;
        end
        backgroundFight(4,1) = RP;
        drawScene(gen,backgroundFight)

        defenseValue = defenseRoll + playerStats.Strength ;
        pause(1)
        
        % donovan roll for attack
        rollD = randi(length(die)) ;
        dieRollD = die(rollD) ;
        switch dieRollD
                    case 1
                        RD = D1;
                    case 2
                        RD = D2;
                    case 3
                        RD = D3;
                    case 4
                        RD = D4;
                    case 5
                        RD = D5;
                    case 6
                        RD = D6;
        end
        backgroundFight(4,4) = RD;
        drawScene(gen,backgroundFight)

        damageD = (dieRollD + IntellectD) -3 ;
        pause(1)

        % checking pass/fail
        if defenseValue > damageD
            fprintf('You succesfully defended from %.0f damage.',damageD)
            disp(newline)
            pause(1.5)
        else
            playerStats.Health = playerStats.Health - damageD ;
            if playerStats.Health <= 0
               i = 2;
               playerStats.Health = 0;
               fprintf('You failed to defend, you have %.0f hitpoints remaining.',playerStats.Health)
            end
            fprintf('You failed to defend, you have %.0f hitpoints remaining.',playerStats.Health)
            disp(newline)
            pause(1.5)
        end
% flee 
    elseif choice == 3

        % player roll
        roll = randi(length(die)) ;
        dodgeRoll = die(roll) ;

        switch dodgeRoll
            case 1
                RP = D1;
            case 2 
                RP = D2;
            case 3
                RP = D3;
            case 4
                RP = D4;
            case 5
                RP = D5;
            case 6
                RP = D6;
        end
        backgroundFight(4,1) = RP;
        drawScene(gen,backgroundFight)

        dodgeValue = dodgeRoll + playerStats.Agility ; 
        pause(1)

        % donovan roll
        rollD = randi(length(die)) ;
        dieRollD = die(rollD) ;

        switch dieRollD
                    case 1
                        RD = D1;
                    case 2
                        RD = D2;
                    case 3
                        RD = D3;
                    case 4
                        RD = D4;
                    case 5
                        RD = D5;
                    case 6
                        RD = D6;
        end
        backgroundFight(4,4) = RD;
        drawScene(gen,backgroundFight)

        dodgeCounter = dieRollD + AgilitD ;
        pause(1)

        % checking pass/fail
        if dodgeValue > dodgeCounter
           disp('You successfully avoided an attack!')
           disp(newline)
           pause(1.5)
           if (dodgeValue-dodgeCounter) >= 3
              playerStats.Health = playerStats.Health + 10;
           end
        else 
           damageD = (dieRollD + IntellectD) - 3 ;
           playerStats.Heath = playerStats.Health - damageD ;
           if playerStats.Health <= 0
              i = 2;
              playerStats.Health = 0;
              fprintf('You failed to dodge and were attacked, you have %.0f hitpoints remaining.',playerStats.Health)
              break;
           else
              fprintf('You failed to dodge and were attacked, you have %.0f hitpoints remaining.',playerStats.Health)
           end
           disp(newline)
           pause(1.5)
        end
% health check
    elseif choice == 4
        fprintf('You have %.0f hitpoints remaining, and Donovan has %.0f hitpoints remaining.',playerStats.Health,healthDonovan)
        disp(newline)
% return to loop if given a null input
    else
        fprintf('%s is not a proper input.', choice)
        disp(newline)
        pause(0.5)
    end
end

% extra conditional to determine which output broke the loop
% and to adjust the scene/text accordingly
if i == 2
    backgroundFight(3,1) = empty ;
    drawScene(gen,backgroundFight)
    title('You have died...')
    pause(3.5)
    close
elseif i == 1
    playerStats.Bosses = playerStats.Bosses + 1 ;
    playerStats.Strength = playerStats.Strength + 3 ;
    playerStats.Health = playerStats.Health + 25 ;
    backgroundFight(3,4) = empty ;
    drawScene(gen,backgroundFight)
    title('You have defeated the Dark Wizard Donovan!')
    pause(3.5)
    title('Strength was raised by 3 and Health by 25.')
    pause(3.5)
    close
end


end




