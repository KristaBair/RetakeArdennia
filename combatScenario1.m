function [playerStats, playerCombat] = combatScenario1(playerName, playerStats)
    % Simulate a random creature encounter
    creature_names = {'Bandit', 'Giant Rat', 'Oversized Spider', 'Grey Wolf'};
    rand_creature_index = randi(length(creature_names));
    creature.name = creature_names{rand_creature_index};
    creature.health = randi([20, 50]);
    creature.strength = randi([3, 7]);
    creature.agility = randi([3, 8]);

    disp(['You encounter a ' creature.name ' with ' num2str(creature.health) ' health!']);

    while playerStats.Health > 0 && creature.health > 0
    fprintf('\n')
        % Player's choice. Only valid input are used. 
        validChoice = false;
        while ~validChoice
            disp('Your choices: 1 - Attack, 2 - Defend, 3 - Dodge, 4 - Check Health');
            try
                player_choice = str2double(input('What will you do? ', 's'));
                if isnumeric(player_choice) && (player_choice >= 1 && player_choice <= 4)
                    validChoice = true;
                else
                    disp('Invalid input. Please enter 1, 2, 3, or 4 for your choice.');
                    fprintf('\n');
                end
            catch
                disp('Invalid input. Please enter 1, 2, 3, or 4 for your choice.');
                fprintf('\n');
            end
        end

        % checks player health 
        if player_choice == 4
            disp([playerName ' has ' num2str(playerStats.Health) ' health.']);
            continue; % Allow the player to check health without taking a turn
        end

        % Creature's choice
        creature_choice = randi(3); % 1 - Attack, 2 - Defend, 3 - Dodge

        % Dice roll for creature damage
        creature_dice_roll = randi(6); % Creature's dice roll

        % Dice roll for damage
        player_dice_roll = randi(6); % A 6-sided dice roll
        disp(['You rolled a ' num2str(player_dice_roll)]);  % Display the player's dice roll result

         % Initialize damage variables
        player_damage = 0;
        creature_damage = 0;

        % Calculate damage based on choices
        if player_choice == 1
            player_damage = playerStats.Strength + player_dice_roll;
        end

        if creature_choice == 1
            creature_damage = creature.strength + creature_dice_roll;
        end

        % Apply defense
        if player_choice == 2
            creature_damage = creature.strength + creature_dice_roll - playerStats.Strength;
            if (creature.strength + creature_dice_roll - playerStats.Strength < 0)
                creature_damage = 0; %prevents negative number
            end
            player_damage = 0;
        end

        if creature_choice == 2
            player_damage = playerStats.Strength + player_dice_roll - creature.strength;
            if (playerStats.Strength + player_dice_roll - creature.strength < 0)
                player_damage = 0; %prevents negative number
            end
            if (player_choice == 3 || player_choice == 2) %prevents player from doing damage if they dodged or defended
                player_damage = 0;
            end
            creature_damage = 0;
        end

        % Apply dodge
        if player_choice == 3
            if playerStats.Agility + player_dice_roll > creature.strength + creature_dice_roll
                creature_damage = 0;
                player_damage = 0;
            end
        end

        if creature_choice == 3
            if creature.agility + creature_dice_roll > playerStats.Strength + player_dice_roll
                player_damage = 0;
                creature_damage = 0;
            end
        end
       
        % Display results
        disp(['You chose to ' getActionName(player_choice)]);
        % display if dodge was successful or not for player
        if (player_choice == 3 && creature_choice ~= 2 && creature_choice ~= 3)
            if playerStats.Agility + player_dice_roll > creature.strength + creature_dice_roll
                disp('You dodged the attack!');
            else
                disp('You could not dodge the attack!');
            end
        end

        disp(['The ' creature.name ' chose to ' getActionName(creature_choice)]);
        % Display if dodge was successful for enemy
        if (creature_choice == 3 && player_choice ~= 2 && player_choice ~= 3)
            if creature.agility + creature_dice_roll > playerStats.Strength + player_dice_roll
                disp(['The ' creature.name ' dodged your attack!']);                
            else
                disp(['The ' creature.name ' did not dodge the attack!']);
            end
            if (player_choice == 2) % Will not give dodge message if not attacked 
                continue;
            end
        end

        disp(['You dealt ' num2str(player_damage) ' damage to the ' creature.name ' and received ' num2str(creature_damage) ' damage.']);

        % Update creature's and player's health
        creature.health = creature.health - player_damage;
        playerStats.Health = playerStats.Health - creature_damage;
    end

    if creature.health <= 0
        disp([creature.name ' has been defeated!']);
        disp('You leveled up!');
        disp('Your Strength has grown by 1!');
        playerStats.Strength = playerStats.Strength + 1;
        fprintf('\n');
        playerCombat = true;
    elseif playerStats.Health <= 0
        disp('Game Over! Your character has died.');
        fprintf('\n');
        playerCombat = false;
    end

    function action = getActionName(choice)
        actions = {'Attack', 'Defend', 'Dodge'};
        action = actions{choice};
    end
end
   
  

     
   