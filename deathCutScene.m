
function f = deathCutScene()

        character = 26;
        backgroundMap = simpleGameEngine('retro_pack.png', 16, 16, 100, [0 64 0]);
        backgroundMapArray = ones(1);
        backgroundMapArray = 26;

        drawScene(backgroundMap, backgroundMapArray)
        xlabel('Health: 0');
        title('I am sorry player.')
        pause(1.5)
        title('You have given your life for us.')
        pause(2)
        title('But it was not enough.')
        pause(1.5)
        title('Dr. Cliff Rat lives on.')
        pause(1.5)
        title('We await another hero who can save us.')
        pause(2.5)
        backgroundMap = simpleGameEngine('retro_pack.png', 16, 16, 20, [0 0 0]);
        backgroundMapArray = 759;
        close
        drawScene(backgroundMap, backgroundMapArray)
        xlabel('');
        title('GAME OVER');
        pause(3.5)
        close all
        userChoice = input("Would you like to play again? 'y' or 'n'", 's');
        if strcmp(userChoice, 'y')
            BriarDraftRandomScenario()
        else
        end


end