% Create a function to choose a random scenario with arguments passed in
function newPlayerStats = randomScenario(Scenarios, scenarioInputArgs)
    % Randomly choose a scenario index
    randomIndex = randi(length(Scenarios));
    
    % Get the selected scenario function handle
    selectedScenario = Scenarios{randomIndex};
    
    % Call the selected scenario function with input arguments
    newPlayerStats = feval(selectedScenario, scenarioInputArgs{:});
end

