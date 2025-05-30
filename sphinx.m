function [playerStats] = sphinx(playerStats, playerName)

 %initiate riddles
 riddle1 = "I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?"; %map
 riddle2 = "What disappears as soon as you say its name?"; %silence
 riddle3 = "Which word in the dictionary is always spelled incorrectly?"; %incorrectly
 riddle4 = "I can only live where there is light, but I die if the light shines on me…What am I?"; %shadow
 riddle5 = "You can see me in water, but I never get wet… What am I?"; %reflection
 riddle6 = "Who is the most handsome Sphinx in the world?";%you
 riddle7 = "Do desert pyramids belong in forest environments?";%yes or no

 %place riddles in an array
 riddles = [riddle1, riddle2, riddle3, riddle4, riddle5, riddle6, riddle7];
 randomIndex = randi([1,length(riddles)]);
 selectedRiddle = riddles(randomIndex); % randomly selected riddle

 %display scene
 character = 26;
 pyramid = 643;
 cat = 255;

 mainMap = simpleGameEngine('retro_pack.png', 16, 16, 20, [34, 64, 49]);
 backgroundArray = ones(3);
 backgroundArray(2,3) = character;
 backgroundArray(2,2) = pyramid;
 drawScene(mainMap, backgroundArray);
 title("Skip the cutscene? 'y' or 'n'")
 xlabel('Click screen if input does not work.')
 showCutScene = getKeyboardInput(mainMap);
 xlabel('')
 title('')

 if strcmp(showCutScene, 'n')
 title('In the distance, you see what can only be an ancient pyramid.');
 pause(3)
 title("You decide to approach despite being alarmed at it's presence.")
 pause(3)
 title('Upon reaching the pyramid, a large door slides open in it''s side.')
 pause(3)
 title('A sphinx steps out, and begins to speak to you.')
 pause(2)

 backgroundArray(2,1) = cat;
 drawScene(mainMap, backgroundArray);

 title(['Sphinx: Welcome ' playerName ', to my domain!'])
 pause(2)
 title('Sphinx: Within these hallowed walls a riddle beckons')
 pause(3)
 title('Sphinx: to those who seek glory and riches untold.')
 pause(3)
 title('Sphinx: Shall you dare to match wits with me? Step forth!') 
 pause(3)
 title('Sphinx: For the riddle awaits an intrepid solver!')
 pause(2.5)
 title('proceed to the command window')
 pause(2)

 end

 %player choice to proceed or not
 %compares player input to correct answers

 loopStart = false;

 while ~loopStart

     yesOrNo = input('\n Would you like to answer the Sphinx''s riddle? (''y'' or ''n'')', 's');
     if strcmpi(yesOrNo, 'y')
         loopStart = true;

         disp('Very well.');
         disp(selectedRiddle);

         answer = lower(input('\nGive me your answer in one word.', 's'));
         fprintf('\n');

         if strcmp(selectedRiddle, riddles(1))
             if strcmpi(answer, 'map')
                 disp('Congratulations I guess. I suppose I''ll lend you some power.');
                 raised = randi([1,4]);
                 playerStats.Strength = playerStats.Strength + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 close
                 break;
             else 
                 disp('You could not have given a more wrong answer. Please grace someone');
                 disp('else with your ignorance.');
                 disp(" ")
                 disp('You walk away dejectedly');
                 close
                 return;
             end
         end

         if strcmp(selectedRiddle, riddles(2))
             if strcmpi(answer, 'silence')
                 disp('Congratulations I guess. I suppose I''ll lend you some power.');
                 raised = randi([1,4]);
                 playerStats.Strength = playerStats.Strength + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 close
                 break;
             else 
                 disp('You could not have given a more wrong answer. Please grace someone');
                 disp('else with your ignorance.');
                 disp(" ")
                 disp('You walk away dejectedly');
                 close
                 return;
             end
         end

         if strcmp(selectedRiddle, riddles(3))
             if strcmpi(answer, 'incorrectly')
                 disp('Congratulations I guess. I suppose I''ll lend you some power.');
                 raised = randi([1,4]);
                 playerStats.Strength = playerStats.Strength + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 break;
             else 
                 disp('You could not have given a more wrong answer. Please grace someone');
                 disp('else with your ignorance.');
                 disp(" ")
                 disp('You walk away dejectedly');
                 close
                 return;
             end
         end

         if strcmp(selectedRiddle, riddles(4))
             if strcmpi(answer, 'shadow')
                 disp('Congratulations I guess. I suppose I''ll lend you some power.');
                 raised = randi([1,4]);
                 playerStats.Strength = playerStats.Strength + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 close
                 break;
             else 
                 disp('You could not have given a more wrong answer. Please grace someone');
                 disp('else with your ignorance.');
                 disp(" ")
                 disp('You walk away dejectedly');
                 close
                 return;
             end
         end

         if strcmp(selectedRiddle, riddles(5))
             if strcmpi(answer, 'reflection')
                 disp('Congratulations I guess. I suppose I''ll lend you some power.');
                 raised = randi([1,4]);
                 playerStats.Strength = playerStats.Strength + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 close
                 break;
             else 
                 disp('You could not have given a more wrong answer. Please grace someone');
                 disp('else with your ignorance.');
                 disp(" ")
                 disp('You walk away dejectedly');
                 close
                 return;
             end
         end

         if strcmp(selectedRiddle, riddles(6))
             if strcmpi(answer, 'you')
                 disp('You...You really think so? You''re not so bad yourself hot stuff');
                 disp('Have this reward on the house')
                 raised = randi([1,5]);
                 playerStats.Agility = playerStats.Agility + raised;
                 fprintf('\nYour Agility was raised by %i!', raised);
                 disp('You also feel completely awkward after being called hot by a giant cat. Congrats!')
                 close
                 break;
             else 
                 disp('Oh thats cool. I totally wasn''t looking for external validation anyways...');
                 disp('With tears in their eyes, the Sphinx slowly slinks away. You''re a jerk.');
                 disp(" ")
                 close
                 return;
             end
         end

         if strcmp(selectedRiddle, riddles(7))
             if strcmpi(answer, 'yes')
                 disp('You are clearly of unparallelled intellect! If the pyramid did not belong, why');
                 disp('would it be here? There was absolutley no lapse in judgment of the Creators!')
                 disp('Take this power and never think about how much this doesn''t make sense ever again!')
                 raised = randi([2,6]);
                 playerStats.Intelligence = playerStats.Intelligence + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 disp('You walk away feeling even more confused than before.')
                 close
                 break;
             elseif strcmpi(answer, 'no')
                 disp('You also question the will of the Creators? I thought I was the only one!.');
                 disp('I can''t make any more sense of this than you can. that''s above my pay grade.' );
                 disp('anyways, take this boon and never question things that make no sense again!')
                 disp(" ")
                 raised = randi([2,6]);
                 playerStats.Strength = playerStats.Strength + raised;
                 fprintf('\nYour strength was raised by %i!', raised);
                 disp('You leave the area wondering if the Sphinx has any actual riddles...or friends.');
                 close
                 break;
             else
                 disp('I asked you a yes or no question and you can''t even do that right');
                 disp('Be gone with you!');
                 close
                 return;
             end
         end
     elseif strcmpi(yesOrNo, 'n')
         disp('You decide that you''re more of a dog person anyways. You continue on your journey');
         close
         return;
     else
         disp('Please type only "y" or "n".');
     end
 end
  % Display the updated player stats
  fprintf('\n');
  disp([playerName ' has the following stats:']);
  disp(['Strength: ' num2str(playerStats.Strength)]);
  disp(['Intelligence: ' num2str(playerStats.Intelligence)]);
  disp(['Agility: ' num2str(playerStats.Agility)]);
  disp(['Health: ' num2str(playerStats.Health)]);
  fprintf('\n');
  pause(3)
  close
end 