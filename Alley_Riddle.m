
function [playerStats] = Alley_Riddle(playerName, playerStats)
    %this is the opening cutscene
    alleyDoor = simpleGameEngine('retro_pack.png', 16, 16, 100);
    alleyArray = 294;
    drawScene(alleyDoor, alleyArray);
    title('After walking down the dark alley way you see a long door in the distance...');
    pause(5)
    title('You decide to sit and wait for the man behind you to approach before approaching...');
    pause(5)
    title('You watch the following exchange happen...');
    pause(3)
    title('Moving to text based interaction...');
    pause(1)
    close
    [answer, phrase] = handGesture();
    fprintf('The man walks up to the door and knocks. The door creaks open and a figure from inside holds %s.\nThe man outside the door responds with "%s".\nThe door then swings open and the man is let inside.', phrase, answer);
    endLoop = 0;
    wonPrize = 0;
    %creates a while loop while the user makes a choice
    while endLoop == 0;
        %gets user input
        userInput = input("\nWould you like to: \n1. Knock on the door? \n2. Wait for another person to enter the door? \n3. Leave the alley.");
        if userInput == 3
            endLoop = 1;
        elseif userInput == 2
            [answer, phrase] = handGesture();
            fprintf('The man walks up to the door and knocks. The door creaks open and a figure from inside holds %s.\nThe man outside the door responds with "%s".\nThe door then swings open and the man is let inside.', phrase, answer);
        elseif (userInput ==1)
            fprintf('\nYou walk up to the door and knock and a man answers.\n')
            [answer, phrase] = handGesture();
            display(['The man holds ' phrase '.'])
            userInput = input('\nWhat do you say back? (Please answer with a single number, ex. 1) ');
            winNum = strcmp(answer, userInput);
            if winNum == 0
                drawScene(alleyDoor, alleyArray);
                title('"Come on inside, kid."');
                pause(3);
                wonPrize = 1;
                endLoop = 1;
                randomStat = randi(3);
                if randomStat == 1
                    playerStats.Health = playerStats.Health + 10;
                    fprintf('\nLevel Up!\nYour health has been increased by 5.');
                elseif randomStat == 2
                    playerStats.Strength = playerStats.Strength + 2;
                    fprintf('\nLevel Up!\nYour strength has been increased by 2;');
                else
                    playerStats.Agility = playerStats.Agility + 2;
                    fprintf('\nLevel Up!\nYour agility has been increased by 2.');
                end
            else
                drawScene(alleyDoor, alleyArray);
                title('"Get lost, kid."');
                pause(3);
                endLoop = 1;
            end
        else
            fprintf('That is not an option.');
        end
    end
end

function [answer, phrase] = handGesture()
%this displays the random hand gesture
handNum = randi([0,5], 1);
    if (handNum == 0)
        phrase = 'out just his clenched fist';
        answer = '4';
    elseif (handNum == 1)
        findNum = randi([1,5]);
        answer = '3';
        if findNum == 1
            phrase = 'up only his thumb';
        elseif findNum == 2
            phrase = 'up only his pointer finger';
        elseif findNum == 3
            phrase = 'up only his middle finger';
        elseif findNum == 4
            phrase = 'up only his ring finger';
        else
            phrase = 'up only his pinky';
        end
    elseif (handNum == 2)
        findNum = randi([1,5]);
        answer = '3';
        if findNum == 1
            phrase = 'up his thumb and pointer finger';
        elseif findNum == 2
            phrase = 'up his pinky and ring finger';
        elseif findNum == 3
            phrase = 'up his pinky and middle finger';
        elseif findNum == 4
            phrase = 'up his pointer finger and ring finger';
        else
            phrase = 'up his thumb and pinky';
        end
    elseif (handNum == 3)
        findNum = randi([1,5]);
        answer = '5';
        if findNum == 1
            phrase = 'up his thumb, pinky, and pointer finger';
        elseif findNum == 2
            phrase = 'up his point, middle, and ring finger';
        elseif findNum == 3
            phrase = 'up his ring, pointer, and pinky finger';
        elseif findNum == 4
            phrase = 'up his thumb, ring, and pointer finger';
        else
            phrase = 'up only his thumb, pinky, and middle finger';
        end

    elseif (handNum == 4)
        findNum = randi([1,3]);
        answer = '4';
        if findNum == 1
            phrase = 'up only his thumb, pointer, middle, and ring finger';
        elseif findNum == 2
            phrase = 'up only his pointer, middle, ring, and pinky finger';
        else
            phrase = 'up only his thumb, middle, ring, and pinky finger';
        end
    else
        answer = '4';
        phrase = 'his outstretched hand';
    end
end
