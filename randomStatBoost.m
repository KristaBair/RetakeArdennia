function [playerStats] = randomStatBoost(playerName, playerStats)
    % List of possible good things to boost stats
    good_thing_names = {'Healthy Meal', 'Brain Stimulant', 'Speed Elixir'};
    rand_good_thing_index = randi(length(good_thing_names));
    good_thing.name = good_thing_names{rand_good_thing_index};

    disp('You see a random passerby is giving out gifts. Would you like to take one?')
    
    while true
        user_input = input('Press "y" to take the gift or "n" to leave: ', 's');
        if strcmpi(user_input, 'y')
            % Select a random stat or health to increase
            stat_to_raise = randi(4); % 1: Strength, 2: Intelligence, 3: Agility, 4: Health
            raised_stat_name = '';

            % Randomly increase the selected stat or health
            switch stat_to_raise
                case 1
                    raised_stat_name = 'Strength';
                    playerStats.Strength = playerStats.Strength + randi([1, 3]);
                case 2
                    raised_stat_name = 'Intelligence';
                    playerStats.Intelligence = playerStats.Intelligence + randi([1, 3]);
                case 3
                    raised_stat_name = 'Agility';
                    playerStats.Agility = playerStats.Agility + randi([1, 3]);
                case 4
                    raised_stat_name = 'Health';
                    health_boost = randi([10, 20]);
                    playerStats.Health = playerStats.Health + health_boost;
            end

            disp([playerName ' receives a ' good_thing.name ' and ' raised_stat_name ' is increased!']);
            fprintf('\n');

            % Display the updated player stats
            disp([playerName ' now has the following stats:']);
            disp(['Health: ' num2str(playerStats.Health)]);
            disp(['Strength: ' num2str(playerStats.Strength)]);
            disp(['Intelligence: ' num2str(playerStats.Intelligence)]);
            disp(['Agility: ' num2str(playerStats.Agility)]);
            fprintf('\n');
            
            break; % Exit the loop after receiving the gift
        elseif strcmpi(user_input, 'n')
            disp([playerName ' chooses not to take the gift and continues on.']);
            fprintf('\n');
            break; % Exit the loop without receiving the gift
        else
            disp('Invalid input. Please press "y" to take the gift or "n" to leave.');
        end
    end
end