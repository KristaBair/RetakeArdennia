clc
clear
IntroCutscene()
close
[playerName,playerStats] = characterCreation();
fprintf('\nLoading map...\n');
pause(2)
Map_Testing(playerName,playerStats)
