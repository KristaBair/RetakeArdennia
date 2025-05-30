
function [playerStats] = MontPyFinal(playerName,playerStats)
    % This header is needed for all the event functions
    disp(newline)
    disp('You come to a rickety bridge crossing a deep canyon, and a disheveled hermit approaches you.');
    disp(newline)
    % Puts questions into a string array, and call a random position
    % Maybe setting individual strings to variables then
    % placing those in an array would be better?
    QuestionsE = {"What is your name?\n", "What is your favorite color?\n"};
    QuestionsH = {"What is the air velocity of an unladen swallow?\n", "What is the course code of this class?\n", "What is a common electronic hub used for programming projects?\n", "What coding software/language was used for this project?\n", "Which building houses the College of Engineering?\n"};
   
    % Asks 'What is your name?' and gets a variable to compare against the playerName
    name = input(QuestionsE{1}, 's');  % 's' specifies the input as a string
    if ~strcmpi(name, playerName)
        
        disp('You are magically thrown off the bridge and into the canyon.');
        pause(3)
        playerStats.Health = 0 ;
        return 
    end
disp(newline)
    % Asks 'What is your favorite color?'

    color = input(QuestionsE{2}, 's');  % 's' specifies the input as a string
    if isempty(color)
        disp('You are magically thrown off the bridge and into the canyon.');
        pause(3)
        playerStats.Health = 0 ;
        return; 
    end
disp(newline)
    % Sets a variable to a dedicated "hard" question's position
    Q = QuestionsH{randi(length(QuestionsH))};
    % Asks the random question
    response = lower(input(Q, 's'));  % 's' specifies the input as a string
    disp(newline)
    % Q1 if
    if strcmp(Q, QuestionsH{1})
        % Q1 Response Ifs
        if strcmp(response, "an african or european swallow?") || strcmp(response, "african or european swallow?") || strcmp(response, "is it an african or european swallow?")
            disp('Wait, I don''t know that!');
            disp('AAAAGHHHHH!')
            pause(1.5)
            disp('The Hermit was magically thrown off the bridge and into the canyon.')
            playerStats.Intelligence = playerStats.Intelligence + 1;
            pause(3)
            return
        else
            disp('You are magically thrown off the bridge and into the canyon.');
            pause(3)
            playerStats.Health = 0;
            return
        end
    % Q2 If
    elseif strcmp(Q, QuestionsH{2})
        if strcmp(response, "1181") || strcmp(response, "1181.01")
            disp('Right, off you go.')
            pause(2)
            return
        else
            disp('You are magically thrown off the bridge and into the canyon.');
            pause(3)
            playerStats.Health = 0;
            return
        end
    % Q3 If
    elseif strcmp(Q, QuestionsH{3})
        if strcmp(response, "arduino")
            disp('Right, off you go.');
            pause(2)
            return
        else
            disp('You are magically thrown off the bridge and into the canyon.');
            pause(3)
            playerStats.Health = 0;
            return
        end
     elseif strcmp(Q, QuestionsH{4})
        if strcmp(response, "matlab")
            disp('Right, off you go.');
            pause(2)
            return
        else
            disp('You are magically thrown off the bridge and into the canyon.');
            pause(3)
            playerStats.Health = 0;
            return
        end
     elseif strcmp(Q, QuestionsH{5})
        if strcmp(response, "hitchcock") || strcmp(response, "hitchcock hall")
            disp('Right, off you go.');
            pause(2)
            return
        else
            disp('You are magically thrown off the bridge and into the canyon.');
            pause(3)
            playerStats.Health = 0;
            return
        end
    end
    
end