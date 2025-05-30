function [playerStats] = hiddenTreasure1(playerName, playerStats)
    % List of possible hidden treasures
    treasure_names = {'Ancient Relic', 'Enchanted Amulet', 'Mystical Gauntlet'};
    rand_treasure_index = randi(length(treasure_names));
    treasure.name = treasure_names{rand_treasure_index};

    disp('You enter a strange area and can sense a source of power nearby');
    disp('If your intelligence is high enough, you may be able to gather some power.');

    roll_dice = false;

    while ~roll_dice
        user_input = input('Press "r" to roll the dice for a perception check: ', 's');
        if strcmpi(user_input, 'r')
            roll_dice = true;
   
            % Calculate the threshold for the dice roll plus intelligence check
            threshold = randi([6, 10]);
   
            % Perform the dice roll
            dice_roll = randi(6); % A 6-sided dice roll
            disp(['You rolled a ' num2str(dice_roll) ' and your intelligence is ' num2str(playerStats.Intelligence) '.']);
   
            % Check if the player can obtain the treasure
            if (dice_roll + playerStats.Intelligence) > threshold
                % Treasure boosts strength by a random amount
                strength_boost = randi([1, 4]);
                playerStats.Strength = playerStats.Strength + strength_boost;
       
                disp([playerName ' discovers a ' treasure.name ' hidden treasure!']);
                disp(['Your strength is increased by ' num2str(strength_boost) ' points.']);
                fprintf('\n');
            else
                disp([playerName ' finds nothing of value here.']);
                fprintf('\n');
            end
   
            % Display the updated player stats
            disp([playerName ' now has the following stats:']);
            disp(['Strength: ' num2str(playerStats.Strength)]);
            disp(['Intelligence: ' num2str(playerStats.Intelligence)]);
            disp(['Agility: ' num2str(playerStats.Agility)]);
            disp(['Health: ' num2str(playerStats.Health)]);
            fprintf('\n');
        else
            disp('Invalid input. Please press "r" to roll the dice.');
        end
    end
end