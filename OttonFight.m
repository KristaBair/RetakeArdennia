function [playerStats] = OttonFight(playerStats)

clc
i = 0;
character = 26;
otton = 219;
cornerUL = 433;
cornerUR = 435;
cornerLL = 497;
cornerLR = 499;
topBord = 434;
leftBord = 465;
rightBord = 467;
bottBord = 498;

% Create the background/display scene for general encounter
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
backgroundArray2(3,2) = otton;
backgroundArray2(3,4) = character;
drawScene(mainMap2, backgroundArray2);
title("Skip cutscene? 'y' or 'n'")
xlabel('Press screen if not working.')
userInput = getKeyboardInput(mainMap2);
title('')
xlabel('')

if strcmpi(userInput, 'n')
    title('you sense a spectral presence looming');
    pause(2.5)
    drawScene(mainMap2, backgroundArray2);
    title('A mischievous ghost materializes before you');
    pause(2.5)
    title('Otton: Welcome, wanderer of the living realm!');
    pause(2.5)
    title('Otton: I am the Ghost General Otton!');
    pause(2)
    title('Otton: you''ve stumbled into my haunt');
    pause(2)
    title('Otton: just in time for a spooktacular showdown!');
    pause(2.5)
    title('Otton: But hold your swords and spells');
    pause(2)
    title("Otton: for I propose a devilishly delightful game.");
    pause(2.5)
    title('Otton: a word scramble of ghostly proportions!')
    pause(2.5)
    title('Otton: I will conjure a jumble of letters')
    pause(2)
    title('Otton: You will have three rounds and three guesses')
    pause(2.5)
    title('Otton: for each word. Win, and I will grant')
    pause(2.5)
    title('Otton: access to the mighty Cliff Rat!')
    pause(2)
    title("And so begins our ghostly gamble!")
    pause(2)
end

%background for text-portion of encounter
myBackground = simpleGameEngine('retro_pack.png', 16, 16, 100, [255, 255, 255]);
myArray = ones(1); 
close
drawScene(myBackground, myArray);

%first scramble scenario
i = 1;
if i == 1
%randomly select a scrambled word
words1 = {'PKOOSY', 'LUOGH', 'THAUN'};
word_selection = words1(randi([1,3]));
Answers1 = {'spooky','ghoul','haunt'};
if strcmpi(word_selection, 'PKOOSY')
    answer1 = Answers1(1);
elseif strcmpi(word_selection, 'LUOGH')
        answer1 = Answers1(2);
elseif strcmpi(word_selection, 'THAUN')
        answer1 = Answers1(3);
end

count = 0;
title('Use the command window to type answers')
pause(2)
title(word_selection)

while i == 1
    if count < 3
        userInput = input('\nUnscramble the ghoulish word: ', 's');
        if strcmpi(answer1, userInput)
            title('Otton: That was easy. Next Round!')
            pause(2)
            i = 2;
        else 
            title('Otton: Not quite. Try Again, mortal!')
            count = count + 1;
        end
    else
        title('Otton: Looks like I win again! Begone with you!')
        pause(2)
        playerStats.Health = 0;
        return;
    end
end
end


%Second scramble scenario
if i == 2
%randomly select a scrambled word
words1 = {'EPMIRAV', 'EYERPC', 'OMHTPAN'};
word_selection = words1(randi([1,3]));
Answers1 = {'vampire','creepy','phantom'};
if strcmpi(word_selection, 'EPMIRAV')
    answer1 = Answers1(1);
elseif strcmpi(word_selection, 'EYERPC')
        answer1 = Answers1(2);
elseif strcmpi(word_selection, 'OMHTPAN')
        answer1 = Answers1(3);
end

count = 0;
title('Use the command window to type answers')
pause(2)
title(word_selection)

while i == 2
    if count < 3
        userInput = input('\nUnscramble the ghastly word: ', 's');
        if strcmpi(answer1, userInput)
            title('Otton: Hmmmm, maybe this is too easy. Next Round!')
            pause(2)
            i = 3;
        else 
            title('Otton: Not quite. Try Again, mortal!')
            count = count + 1;
        end
    else
        title('Otton: Looks like I win again! Begone with you!')
        pause(2)
        playerStats.Health = 0;
        return;
    end
end
end

%Final scramble scenario
if i == 3
%randomly select a scrambled word
words1 = {'RVAEGYRAD', 'WODASH', 'NUDDEA'};
word_selection = words1(randi([1,3]));
Answers1 = {'graveyard','shadow','undead'};
if strcmpi(word_selection, 'RVAEGYRAD')
    answer1 = Answers1(1);
elseif strcmpi(word_selection, 'WODASH')
        answer1 = Answers1(2);
elseif strcmpi(word_selection, 'NUDDEA')
        answer1 = Answers1(3);
end

count = 0;
title('Use the command window to type answers')
pause(2)
title(word_selection)

while i == 3
    if count < 3
        userInput = input('\nUnscramble the spooky word: ', 's');
        if strcmpi(answer1, userInput)
            i = 4;
        else 
            title('Otton: Not quite. Try Again, mortal!')
            count = count + 1;
        end
    else
        title('Otton: Too bad, you were so close. Begone, mortal!')
        pause(2)
        playerStats.Health = 0;
        return;
    end
end
end

if i == 4
    %same graphics as start of event
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
    backgroundArray2(3,2) = otton;
    backgroundArray2(3,4) = character;
    drawScene(mainMap2, backgroundArray2);

    title('Otton: Wow, you actually did it.')
    pause(2)
    title('Otton: This is more surprising than my death was!')
    pause(2.5)
    title('Otton: For your display of courage and intellect')
    pause(2.5)
    title('Otton: I will grant you my boon.')
    pause(2)
    title('Otton: Good luck out there. Don''t end up like me!')
    pause(2.5)
    title('You gained 1 strength and 2 intelligence!')
    pause(3)

    playerStats.Strength = playerStats.Strength + 1;
    playerStats.Intelligence = playerStats.Intelligence + 2;
    playerStats.Bosses = playerStats.Bosses + 1; 
    close

end
end
    



