

function [playerStats] = trivia_scenario(playerName, playerStats)

% Trivia Random Event
clc 
Player = 26; 
Traveler = 96;

% Create beginning scenario scene
mainMap = simpleGameEngine('retro_pack.png', 16, 16, 20, [34, 64, 49]);
backgroundArray = ones(3);
backgroundArray(2,1) = Traveler;
backgroundArray(2,3) = Player;
drawScene(mainMap, backgroundArray)

i = 0;
while i == 0
title('You seem to have stumbled across a river.')
pause(2.5)
title('Unfortunately, the current is too rough to swim across.')
pause(3) 
title('Traveler: Hi there, do you need something?')
pause(2.5)
title([playerName ': Yes, do you know a way around this river?'])
pause(3)
title("Traveler: I have a boat. Are you willin' to pay?")
pause(2.5)
title([playerName ": I don't have money. Is there any other way?"])
pause(2.5)
title("Traveler: Hmmm, maybe if you're knowledgeable enough")
pause(3)
title("I'll give you passage on my boat.")
pause(2.5)
title('If you answer my three trivia questions, you may pass.')
pause(2.5)
title('To leave at any point type "Q" in Command Window.')
pause(2.5)
title("Ready? Let's go!")
pause(2)
i = 1;
end 

% Create the background/display scene for the text
myBackground = simpleGameEngine('retro_pack.png', 16, 16, 20, [255, 255, 255]);
myArray = ones(1); 
close
drawScene(myBackground, myArray);

% Question One: Answer = Kourtney
i = 0; 
while i == 0 
    title("Who is the oldest Kardashian sister?")
    pause(4)
    title('Go to the Command Window')
Answer1 = 'Kourtney';
userInput = input('\nInput the answer: ', 's');
if strcmpi(Answer1, userInput)
    title('Correct, onto the next question!')
    pause(2)
    i = 1;
elseif strcmpi(userInput, "Q")
    title('Merchant: I hope you find safe passage another way.')
    return; 
else 
    title("Incorrect, I'm feeling generous, try again.")
    pause(3)
end 
end

% Question Two: Answer = 6
i = 0; 
while i == 0
    title("How many season are there in 'Jersey Shore'?")
    pause(4)
    title('Go to the Command Window and input as a number.')
    Answer2 = '6';
    userInput = input('\nInput the answer: ', 's');
if strcmpi(Answer2, userInput)
    title('Correct, onto the last question!')
    pause(2)
    i = 1;
elseif strcmpi(userInput, "Q")
    title('Merchant: I hope you find safe passage another way.')
    return;
else 
    title("Incorrect, I'm feeling generous, try again.")
    pause(3)
end 
end

% Question Three: Answer = Robyn 
i = 0; 
while i == 0
    title("What is Rihanna's real name?")
    pause(4)
    title('Go to the Command Window')
    Answer3 = 'Robyn';
    userInput = input('\nInput the answer: ', 's');
if strcmpi(Answer3, userInput)
    title('Correct, you have gained passage!')
    pause(2)
    i = 1;
elseif strcmpi(userInput, "Q")
    title('Merchant: I hope you find safe passage another way.')
    return;
else 
    title("Incorrect, I'm feeling generous, try again.")
    pause(3)
end 
end
