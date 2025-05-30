function [playerStats] = RandomTrap1(playerName, playerStats)
    % List of possible traps
    trap_names = {'Weakened Floor', 'Electrified Wire', 'Poisonous Gas'};
    rand_trap_index = randi(length(trap_names));
    trap.name = trap_names{rand_trap_index};

    % Determine whether to lower a stat or not
    lower_stat = false;

    disp('You ran into a trap!')

    % Check agility and dice roll
    user_input = input('Press "r" to roll the dice and avoid the trap: ', 's');
    
    if strcmpi(user_input, 'r')
        % Dice roll for agility check
        dice_roll = randi(6); % A 6-sided dice roll

        % Display the player's dice roll result
        disp(['You rolled a ' num2str(dice_roll)]);

        % Check if the player avoids the trap based on agility
        if (dice_roll + playerStats.Agility) < randi([5, 10])
            lower_stat = true;
            disp('You did not avoid the trap.');
            fprintf('\n');
        else
            disp('You successfully avoid the trap!');
            fprintf('\n');
        end
    else
        disp('Invalid input. Please press "r" to roll the dice and avoid the trap.');
    end

    % If the trap executes, select a random stat to lower
    if lower_stat
        stat_to_lower = randi(4); % 1: Strength, 2: Intelligence, 3: Agility, 4: Health

        % Randomly decrease the selected stat or health
        switch stat_to_lower
            case 1
                lowered_stat_name = 'Strength';
                playerStats.Strength = playerStats.Strength - randi([1, 2]);
            case 2
                lowered_stat_name = 'Intelligence';
                playerStats.Intelligence = playerStats.Intelligence - randi([1, 2]);
            case 3
                lowered_stat_name = 'Agility';
                playerStats.Agility = playerStats.Agility - randi([1, 2]);
            case 4
                lowered_stat_name = 'Health';
                health_loss = randi([10, 20]);
                playerStats.Health = playerStats.Health - health_loss;
        end

    disp([playerName ' encounters a ' trap.name ' and ' lowered_stat_name ' is decreased!']);
   
    % Display the updated player stats
    disp([playerName ' now has the following stats:']);
    disp(['Health: ' num2str(playerStats.Health)]);
    disp(['Strength: ' num2str(playerStats.Strength)]);
    disp(['Intelligence: ' num2str(playerStats.Intelligence)]);
    disp(['Agility: ' num2str(playerStats.Agility)]);
    fprintf('\n');
    end
end