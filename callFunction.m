function f = callFunction(x, y, Scenarios, scenarioInputArgs)
    randomScenario(Scenarios, scenarioInputArgs)
    % Randomly choose a scenario index
    randomIndex = randi(length(Scenarios));
    
    % Get the selected scenario function handle
    selectedScenario = Scenarios{randomIndex};
    
    % Call the selected scenario function with input arguments
    newPlayerStats = feval(selectedScenario, scenarioInputArgs{:});

    if (rem(x,2)~=0)
        %TYPE THE RANDOM FIGHT SCENARIOS HERE
    else
        playerStats = randomScenario(Scenarios, scenarioInputArgs);

    end
end

