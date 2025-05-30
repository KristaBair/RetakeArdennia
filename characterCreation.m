function [playerName, playerStats] = characterCreation()

    % Ask for the player's name
    playerName = input('\nEnter your character''s name: ', 's');
    fprintf('\n');

    % List of background options
    backgrounds = {
        '1. Merchant  Raises Health a lot and Intelligence and Agility a little',
        '2. Warrior   Raises Strength a lot and Agility and Health a little, lowers Intelligence',
        '3. Scholar   Raises Intelligence a lot and Agility a little, lowers Health and Strength',
        '4. Hunter    Raises Agility a lot and Intelligence a little, lowers Strength and Health',
        '5. Explorer  Raises Health, Strength, Intelligence, and Agility a little'
    };

    % Display background options
    disp('Choose your background:');
    for i = 1:numel(backgrounds)
        disp(backgrounds{i});
    end
    
   %only accepts valid input
   validChoice = false;
   while ~validChoice

    % Ask the player to select a background
    background_choice = str2double(input('Enter the number of your chosen background: ', 's'));
    fprintf('\n');
    if isnumeric(background_choice) && (background_choice >= 1 && background_choice <= 5)
        validChoice = true;
    else
        disp('Invalid input. Please enter 1, 2, 3, 4, or 5 for your choice.');
        fprintf('\n');
    end
   end
    

    % Initialize player's stats based on the selected background
    playerStats = struct('Strength', 3, 'Intelligence', 3, 'Agility', 3, 'Health', 50, 'Bosses', 0, 'unlisted', 0);

    switch background_choice
        case 1
            disp('You chose the Merchant background. Intelligence, Agility, and Health raised.');
            playerStats.Intelligence = playerStats.Intelligence + 2;
            playerStats.Agility = playerStats.Agility + 1;
            playerStats.Strength = playerStats.Strength;
            playerStats.Health = playerStats.Health + 10;
        case 2
            disp('You chose the Warrior background. Strength, Agility, and Health are raised, Intelligence is lowered.');
            playerStats.Intelligence = playerStats.Intelligence -2;
            playerStats.Agility = playerStats.Agility + 1;
            playerStats.Strength = playerStats.Strength + 3;
            playerStats.Health = playerStats.Health + 10;
        case 3
            disp('You chose the Scholar background. Intelligence and Agility are raised, Strength and Health are lowered.');
            playerStats.Intelligence = playerStats.Intelligence + 3;
            playerStats.Agility = playerStats.Agility + 1;
            playerStats.Strength = playerStats.Strength - 2;
            playerStats.Health = playerStats.Health - 20;
        case 4
            disp('You chose the Hunter background. Agility and Intelligence are raised, Strength is lowered.');
            playerStats.Intelligence = playerStats.Intelligence + 1;
            playerStats.Agility = playerStats.Agility + 2;
            playerStats.Strength = playerStats.Strength -1;
            playerStats.Health = playerStats.Health - 10;
        case 5
            disp('You chose the Explorer background. Health, Strength, Intelligence, and Agility are raised.');
            playerStats.Intelligence = playerStats.Intelligence + 1;
            playerStats.Agility = playerStats.Agility + 1;
            playerStats.Strength = playerStats.Strength + 1;
            playerStats.Health = playerStats.Health + 10;
        otherwise
            disp('Invalid choice. Please select a valid background.');
            characterCreation(); % Start character creation again
            return;
    end

    % Display the player's selected background and initial stats
    disp(['The following are your stats, ' playerName  ':']);
    disp(['Strength: ' num2str(playerStats.Strength)]);
    disp(['Intelligence: ' num2str(playerStats.Intelligence)]);
    disp(['Agility: ' num2str(playerStats.Agility)]);
    disp(['Health: ' num2str(playerStats.Health)]);
    fprintf('\n');
    pause(1);
end

