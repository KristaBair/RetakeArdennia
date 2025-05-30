function [playerStats] = HealingSpot(playerStats, playerName)

disp('You enter the ancient grounds of healing! A place where the band-aids');
disp('are ancient, the herbs are wise, and the leeches...well lets just say')
disp('they are enthusiatic.')

roll_dice = false;

%prevent invalid input
    while ~roll_dice
        user_input = input('Press "r" to roll the dice for healing: ', 's');
        if strcmpi(user_input, 'r')
            roll_dice = true;
            
            % Dice roll for additional healing
            dice_roll = randi(6); % A simple 6-sided dice roll
            disp(['You rolled a ' num2str(dice_roll) ' on the dice.']);

            % Calculate total healing
            total_healing = 20 + dice_roll + playerStats.Intelligence;

            % Apply healing to character's health
            playerStats.Health = playerStats.Health + total_healing;

            disp([playerName ' healed for ' num2str(total_healing) ' points.']);
            disp([playerName ' now has ' num2str(playerStats.Health) ' health.']);
            fprintf('\n');
        else
            disp('Invalid input. Please press "r" to roll the dice.');
        end
    end
end  