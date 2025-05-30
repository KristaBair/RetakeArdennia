function playerStats = UnknownV1(playerStats)

rollNum = 1:20 ;
sel = randi(length(rollNum)) ;

if sel == 1
    disp('You look around and nothing seems right.')
    pause(2)
    disp('You feel as if you are being watched, and that your actions are not your own.')
    pause(5)
elseif (sel > 1) && (sel <= 3)
    rollNum2 = 1:3 ;
    sel2 = randi(length(rollNum2)) ;
    if sel2 == 1 
        playerStats.Intelligence = playerStats.Intelligence - 1 ;
        disp('You feel like you have forgotten some knowledge.')
        pause(2)
    elseif sel2 == 2
        playerStats.Strength = playerStats.Strength - 1 ;
        disp('You feel like your body has weakened.')
        pause(2)
    elseif sel2 == 3
        playerStats.Agility = playerStats.Agility - 1 ;
        disp('You feel like you are slower.')
        pause(2)
    end
elseif (sel > 3) && (sel <= 5)
    playerStats.Health = playerStats.Health - 10 ;
    disp('You feel a pain in your chest.')
    pause(2)
elseif (sel > 5) && (sel < 7)
    disp('You feel unsettled.')
    pause(2)
elseif (sel == 7)
    disp('You feel nothing')
    pause(2)
elseif (sel > 7) && (sel <= 9)
    disp('You feel comfortable.')
    pause(2)
elseif (sel > 9) && (sel <= 11)
    disp('You find an oddly heavy tome titled, "The 32nd System", but decide it is best to leave it be.')
    pause(4)
elseif (sel > 11) && (sel <= 13)
    disp('You see a vision of the path ahead of you: Success, but at what cost?')
    pause(4)
elseif (sel > 13) && (sel <= 15)
    playerStats.Health = playerStats.Health + 25 ;
    disp('You feel rejuvinated.')
    pause(2)
elseif (sel > 15) && (sel <= 17)
    rollNum3 = 1:3 ;
    sel3 = randi(length(rollNum3)) ;
    if sel3 == 1
        playerStats.Intelligence = playerStats.Intelligence + 2 ;
        disp('You feel like you have gained knowledge.')
        pause(2)
    elseif sel3 == 2
        playerStats.Strength = playerStats.Strength + 2 ;
        disp('You feel your body is stronger')
        pause(2)
    elseif sel3 == 3
        playerStats.Agility = playerStats.Agility + 2 ;
        disp('You feel like you are faster.')
        pause(2)
    end
elseif (sel > 17) && (sel <= 18)
    playerStats.Intelligence = playerStats.Intelligence + 1 ;
    playerStats.Strength = playerStats.Strength + 1 ;
    playerStats.Agility = playerStats.Agility + 1 ;
    playerStats.Health = playerStats.Health + 10 ;
    disp('You feel your whole body has improved.')
    pause(3)
elseif sel >= 19
    playerStats.unlisted = playerStats.unlisted + 1 ;
    disp('A small portal appears and drops an item at your feet.')
    pause(2.5)
    disp('You pick up the item, it appears to be a rat skull etched with runes.')
    pause(4)
    
end

end
