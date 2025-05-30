clc
clear
skipCutscene = input("Skip opening cutscene? 'y' or 'n'", "s");
if strcmp(skipCutscene, 'n')
IntroCutscene()
close
end
[playerName, playerStats] = characterCreation();
fprintf('\nLoading map...\n');
pause(2)
Map_Testing(playerName, playerStats)


