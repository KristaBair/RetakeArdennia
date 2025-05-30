function [playerStats] = healScenario1(playerName, playerStats)
    % Simulate finding a healing item
    healing_item_names = {'Medkit', 'Health Elixir', 'Medicinal Herb'};
    rand_item_index = randi(length(healing_item_names));
    healing_item.name = healing_item_names{rand_item_index};
    healing_item.healing = randi([10, 20]);
    
    disp('As you pass a nearby tree, you notice something lying at it''s base. Upon closer inspection, ');
    disp(['you find a ' healing_item.name ' that can heal for ' num2str(healing_item.healing) ' points!']);

    roll_dice = false;

    %accept only valid input
    while ~roll_dice
        user_input = input('Press "r" to roll the dice for healing: ', 's');
        if strcmpi(user_input, 'r')
            roll_dice = true;
            
            % Dice roll for additional healing
            dice_roll = randi(6); % A simple 6-sided dice roll
            disp(['You rolled a ' num2str(dice_roll) ' on the dice.']);

            % Calculate total healing
            total_healing = healing_item.healing + dice_roll + playerStats.Intelligence;

            % Apply healing to character's health
            playerStats.Health = playerStats.Health + total_healing;

            disp([playerName ' used ' healing_item.name ' and healed for ' num2str(total_healing) ' points.']);
            disp([playerName ' now has ' num2str(playerStats.Health) ' health.']);
            fprintf('\n');
        else
            disp('Invalid input. Please press "r" to roll the dice.');
        end
    end
end  
