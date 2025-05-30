function [playerStats] = EmilyFight(playerName,playerStats)

clc 
i = 0; 
Player = 26; 
Emily = 320;
cornerUL = 433;
cornerUR = 435;
cornerLL = 497;
cornerLR = 499;
topBord = 434;
leftBord = 465;
rightBord = 467;
bottBord = 498;
lives = 3;

% Create the background/display scene for general encounter
mainMap = simpleGameEngine('retro_pack.png', 16, 16, 20, [34, 64, 49]);
backgroundArray = ones(5);
backgroundArray(1,:) = topBord;
backgroundArray(5,:) = bottBord;
backgroundArray(:,1) = leftBord;
backgroundArray(:,5) = rightBord;
backgroundArray(1,1) = cornerUL;
backgroundArray(1,5) = cornerUR;
backgroundArray(5,1) = cornerLL;
backgroundArray(5,5) = cornerLR;
backgroundArray(3,2) = Emily;
backgroundArray(3,4) = Player;
drawScene(mainMap, backgroundArray)


% Describe the basis of how to play the memorization game and include the
% need for spaces instead of commas

title("Skip cutscene? 'y' or 'n'")
xlabel('If it does not work, please click screen.')
i = getKeyboardInput(mainMap);

while strcmp(i, 'n')
title('Emily: Ah, welcome! You finally made it.')
pause(2.5) 
title('As one of Dr. Cliff Rats most trusted generals,')
pause(3)
title('it is my job to keep you from reaching his castle.')
pause(3)
title('In order to pass, you must beat my memory game.')
pause(3)
title('Now, here are the rules...') 
pause(2)
title('There will be six different word sequences displayed.')
pause(3)
title('The sequences will gain difficulty each level.')
pause(3)
title('If you succeed, you will move to the next level.')
pause(3)
title('If you fail, you will have to repeat the level.')
pause(3) 
title('To win this scenario, all levels must be passed.')
pause(3) 
title('You have three lives each round.')
pause(2)
title('PLEASE KEEP IN MIND')
pause(2)
title('DO NOT space words with commas for your repsonses.')
pause(4)
title('Space using the space bar. Also, this is not case sensitive.')
pause(4)
title(['Do you understand the directions' playerName '?'])
pause(2)
title('Type "yes" to continue. Type "no" to replay.')
pause(3)
title('Go to the Command Window')
userInput = input('\nReply "yes" or "no": ', 's');
if strcmpi(userInput,'no')
else strcmpi(userInput,'yes')
    i = 'y';
end 
end 
close

% Create the background/display scene for the text
myBackground = simpleGameEngine('retro_pack.png', 16, 16, 20, [255, 255, 255]);
myArray = ones(1); 
close
drawScene(myBackground, myArray);

% Sequence 1: (Flower, Tree, Squirrel)
i = 0;
while (i == 0) && (lives > 0)
xlabel(['Lives:' lives])
title('The game will begin in three seconds.')
pause(2.5)
title('3...')
pause(1)
title('2...')
pause(1)
title('1...')
pause(1)
title('GO')
pause(1)
title('Flower')
pause(1.5)
title('Tree')
pause(1.5)
title('Squirrel')
pause(1.5)
title('Go to the Command Window')
Answer1 = 'Flower Tree Squirrel';
userInput = input('\nCopy the sequence of words: ', 's');
if strcmpi(Answer1, userInput)
    title('Correct, onto the next round!')
    pause(2)
    i = 1;
    
else 
    title('Incorrect, try again.')
    lives = lives -1;
end 
end

% Sequence 2: (Hippo, Zebra, Lion, Elephant) 
i = 0;
if lives >= 0
    lives = 3;
end
while (i == 0) && (lives > 0)
xlabel(['Lives: ' lives]);
title('3...')
pause(1)
title('2...')
pause(1)
title('1...')
pause(1)
title('Hippo')
pause(1.5)
title('Zebra')
pause(1.5)
title('Lion')
pause(1.5)
title('Elephant')
pause(1.5)
title('Go to the Command Window')
Answer2 = 'Hippo Zebra Lion Elephant';
userInput = input('\nCopy the sequence of words: ', 's');
if strcmpi(Answer2, userInput)
    title('Correct, onto the last round!')
    pause(2)
    i = 1;
else 
    title('Incorrect, try again.')
    pause(2)
end 
end
% Sequence 3: (Snake, Snow, Nest, Seatbelt, Sand) 
i = 0;
while i == 0
title('3...')
pause(1)
title('2...')
pause(1)
title('1...')
pause(1)
title('Snake')
pause(1.5)
title('Snow')
pause(1.5)
title('Nest')
pause(1.5)
title('Seatbelt')
pause(1.5)
title('Sand')
pause(1.5)
title('Go to the Command Window')
Answer3 = 'Snake Snow Nest Seatbelt Sand';
userInput = input('\nCopy the sequence of words: ', 's');
if strcmpi(Answer3, userInput)
    title('Correct, you have won!')
    pause(2)
    i = 1;
else 
    title('Incorrect, try again.')
    pause(2)
end 
end

% Sequence 4: (Fridge, Frog, Fountain, Finger, Fig, Ferret)
i = 1;
while i == 0
title('3...')
pause(1)
title('2...')
pause(1)
title('1...')
pause(1)
title('Fridge')
pause(1)
title('Frog')
pause(1)
title('Fountain')
pause(1)
title('Finger')
pause(1)
title('Fig')
pause(1)
title('Ferret')
pause(1)
title('Go to the Command Window')
Answer4 = 'Fridge Frog Fountain Finger Fig Ferret';
userInput = input('\nCopy the sequence of words: ', 's');
if strcmpi(Answer4, userInput)
    title('Correct, onto the next round!')
    pause(2)
    i = 1;
else 
    title('Incorrect, try again.')
    pause(2)
end 
end

% Sequence 5: (Kangaroo, Doctor, Dolphin, Baseball, Shoe, Stork, Staple)
i = 1;
while i == 0
title('3...')
pause(1)
title('2...')
pause(1)
title('1...')
pause(1)
title('Kangaroo')
pause(1)
title('Doctor')
pause(1)
title('Dolphin')
pause(1)
title('Baseball')
pause(1)
title('Shoe')
pause(1)
title('Stork')
pause(1)
title('Staple')
pause(1)
title('Go to the Command Window')
Answer5 = 'Kangaroo Doctor Dolphin Baseball Shoe Stork Staple';
userInput = input('\nCopy the sequence of words: ', 's');
if strcmpi(Answer5, userInput)
    title('Correct, onto the last round!')
    pause(2)
    i = 1;
else 
    title('Incorrect, try again.')
    pause(2)
end 
end

% Sequence 6: (Carp, Scale, Winter, Strawberry, Window, Elevator, Horse, Helicopter)
i = 1;
while i == 0
title('3...')
pause(1)
title('2...')
pause(1)
title('1...')
pause(1)
title('Carp')
pause(1)
title('Scale')
pause(1)
title('Winter')
pause(1)
title('Strawberry')
pause(1)
title('Window')
pause(1)
title('Elevator')
pause(1)
title('Horse')
pause(1)
title('Helicopter')
pause(1)
title('Go to the Command Window')
Answer6 = 'Carp Scale Winter Strawberry Window Elevator Horse Helicopter';
userInput = input('\nCopy the sequence of words: ', 's');
if strcmpi(Answer6, userInput)
    title('Congrats, you won!')
    pause(2)
    i = 1;
else 
    title('Incorrect, try again.')
    pause(2)
end 
end

% Ending Scene with Stats reward
if lives > 0
    title('Now that you have completed this event, you get a reward!')
    pause(2.5)
    title('Your agility is boosted +3.')
    pause(1)
    playerStats.Agility = playerStats.Agility + 3;
    playerStats.Bosses = playerStats.Bosses + 1 ;
    close
else
    playerStats.Health = 0;
    close
end
end 