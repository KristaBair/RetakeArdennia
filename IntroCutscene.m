function o = IntroCutscene()

% sprite reference variables
empty = 1;
cornerUL = 433;
cornerUR = 435;
cornerLL = 497;
cornerLR = 499;
topBord = 434;
leftBord = 465;
rightBord = 467;
bottBord = 498;
% letters
A = 980;
B = 981;
C = 982;
D = 983;
E = 984;
G = 986;
H = 987;
I = 988;
K = 990;
L = 991;
N = 1012;
O = 1013;
P = 1014;
R = 1016;
S = 1017;
T = 1018;
U = 1019;
V = 1020;
W = 1021;
Y = 1023;
period = 959;
exclaim = 820;

% map initialization
    mainMap = simpleGameEngine('retro_pack.png', 16, 16, 10, [34, 64, 49]);
    backgroundArray = ones(10);

% drawing the title screen
    %borders
    backgroundArray(:,1) = leftBord;
    backgroundArray(:,10) = rightBord;
    backgroundArray(1,:) = topBord ;
    backgroundArray(10,:) = bottBord;
    backgroundArray(4,:) = bottBord;
    backgroundArray(4,1) = cornerLL;
    backgroundArray(4,10) = cornerLR;
    backgroundArray(1,1) = cornerUL;
    backgroundArray(1,10) = cornerUR;
    backgroundArray(10,1) = cornerLL;
    backgroundArray(10,10) = cornerLR;
    drawScene(mainMap,backgroundArray)
    pause(1.5)

    % game title
    backgroundArray(2,3) = R;
    backgroundArray(2,4) = E;
    backgroundArray(2,5) = T;
    backgroundArray(2,6) = A;
    backgroundArray(2,7) = K;
    backgroundArray(2,8) = E;
    drawScene(mainMap,backgroundArray)
    pause(1.25)

    backgroundArray(3,2) = A;
    backgroundArray(3,3) = R;
    backgroundArray(3,4) = D;
    backgroundArray(3,5) = E;
    backgroundArray(3,6) = N;
    backgroundArray(3,7) = N;
    backgroundArray(3,8) = I;
    backgroundArray(3,9) = A;
    drawScene(mainMap,backgroundArray)
    pause(2)

    % credits
    backgroundArray(5,5) = B;
    backgroundArray(5,6) = Y;
    drawScene(mainMap,backgroundArray)
    pause(1.25)
    % Briar's Name
    backgroundArray(6,2) = B;
    backgroundArray(6,3) = R;
    backgroundArray(6,4) = I;
    backgroundArray(6,5) = A;
    backgroundArray(6,6) = R;
    backgroundArray(6,7) = period;
    backgroundArray(6,8) = A;
    drawScene(mainMap,backgroundArray)
    pause(1)
    % Krista's name
    backgroundArray(7,2) = K;
    backgroundArray(7,3) = R;
    backgroundArray(7,4) = I;
    backgroundArray(7,5) = S;
    backgroundArray(7,6) = T;
    backgroundArray(7,7) = A;
    backgroundArray(7,8) = period;
    backgroundArray(7,9) = B;
    drawScene(mainMap,backgroundArray)
    pause(1)
    % Rory's Name
    backgroundArray(8,2) = R;
    backgroundArray(8,3) = O;
    backgroundArray(8,4) = R;
    backgroundArray(8,5) = Y;
    backgroundArray(8,6) = period;
    backgroundArray(8,7) = D;
    drawScene(mainMap,backgroundArray)
    pause(1)
    % Lauren's name
    backgroundArray(9,2) = L;
    backgroundArray(9,3) = A;
    backgroundArray(9,4) = U;
    backgroundArray(9,5) = R;
    backgroundArray(9,6) = E;
    backgroundArray(9,7) = N;
    backgroundArray(9,8) = period;
    backgroundArray(9,9) = K;
    drawScene(mainMap,backgroundArray)
    pause(2.5)

    % clearing the credits
    backgroundArray(5,2:9) = empty;
    drawScene(mainMap,backgroundArray)
    pause(0.5)
    backgroundArray(6,2:9) = empty;
    drawScene(mainMap,backgroundArray)
    pause(0.5)
    backgroundArray(7,2:9) = empty;
    drawScene(mainMap,backgroundArray)
    pause(0.5)
    backgroundArray(8,2:9) = empty;
    drawScene(mainMap,backgroundArray)
    pause(0.5)
    backgroundArray(9,2:9) = empty;
    drawScene(mainMap,backgroundArray)
    pause(1.5)
    
    % start screen
    backgroundArray(6,3) = P;
    backgroundArray(6,4) = R;
    backgroundArray(6,5) = E;
    backgroundArray(6,6) = S;
    backgroundArray(6,7) = S;
    drawScene(mainMap,backgroundArray)
    pause(1.25)

    backgroundArray(7,2) = S;
    backgroundArray(7,3) = P;
    backgroundArray(7,4) = A;
    backgroundArray(7,5) = C;
    backgroundArray(7,6) = E;
    backgroundArray(7,7) = B;
    backgroundArray(7,8) = A;
    backgroundArray(7,9) = R;
    drawScene(mainMap,backgroundArray)
    pause(1.25)

    backgroundArray(8,2) = T;
    backgroundArray(8,3) = O;

    backgroundArray(8,5) = S;
    backgroundArray(8,6) = T;
    backgroundArray(8,7) = A;
    backgroundArray(8,8) = R;
    backgroundArray(8,9) = T;
    drawScene(mainMap,backgroundArray)
    pause(0.25)
    xlabel('If your input is not working, click the figure window.')
    start = getKeyboardInput(mainMap);
    i = 0;

while i == 0
    
    if start == 'space'

    newArray = ones(8);
    newArray(1,:) = topBord;
    newArray(8,:) = bottBord;
    newArray(3,2:7) = bottBord;
    newArray(:,1) = leftBord;
    newArray(:,8) = rightBord;
    newArray(1,1) = cornerUL;
    newArray(1,8) = cornerUR;
    newArray(8,1) = cornerLL;
    newArray(3,1) = cornerLL;
    newArray(3,8) = cornerLR;
    newArray(8,8) = cornerLR;
    
    % Basic game/story intro
    newArray(2,2) = H;
    newArray(2,3) = E;
    newArray(2,4) = L;
    newArray(2,5) = L;
    newArray(2,6) = O;
    newArray(2,7) = exclaim;
    drawScene(mainMap,newArray)
    pause(2)
    title('Welcome to Retake Ardennia!',FontSize=14,FontWeight='normal')
    pause(2)
    title("Would you like to view the tutorial? 'y' or 'n'",FontSize=14,FontWeight='normal')
    xlabel('If your input is not working, click the figure window.')
    tutorial = getKeyboardInput (mainMap);

        n = 0;
        while n == 0
        if tutorial == 'y'
        newArray (6,4) = 28; % a player model
        newArray (6,5) = 699; % arrow
        drawScene(mainMap,newArray)
        title('You, an intrepid adventurer, have been called upon by Ardennia''s people.',FontSize=14,FontWeight='normal')
        xlabel('')
        pause(3.5)
        newArray(6,2:7) = 1;
        % boss ids 320EM 57DON 219OT 319TAY 288RAT
        newArray(5,4) = 288;
        newArray(5,5) = 611;
        newArray(6,3) = 319;
        newArray(6,4) = 57;
        newArray(6,5) = 219;
        newArray(6,6) = 320;
        drawScene(mainMap,newArray)
        title('Your quest is to rid Ardennia of Dr. Cliff Rat and his four generals.',FontSize=14,FontWeight='normal')
        pause(4)
        title('And in your travels there are many things that you can come across...',FontSize=14,FontWeight='normal')
        pause(3.5)
        % introducing the many map markers and what they mean
        title('')
        newArray(2,2:7) = 1;
        newArray(5,2:7) = 1;
        newArray(6,2:7) = 1;
        newArray(2,2) = E;
        newArray(2,3) = V;
        newArray(2,4) = E;
        newArray(2,5) = N;
        newArray(2,6) = T;
        newArray(2,7) = S;
        drawScene(mainMap,newArray)
        pause(2)
    
        title('Those things are shown as markers on the map.',FontSize=14,FontWeight='normal')
        pause(3)

        newArray(5,4) = 961; %boss sword
        newArray(5,5) = 611; %castle
        drawScene(mainMap,newArray)
        title('Some are dedicated to your main quest, such as the swords and the castle.',FontSize=14,FontWeight='normal')
        pause(3.5)

        newArray(6,3) = 6; %bush
        newArray(6,4) = 34; %tree
        newArray(6,5) = 70; %rocks
        newArray(6,6) = 52; %extra stuff to balance the look
        drawScene(mainMap,newArray)
        title('Some are simply decorative and can be walked over.',FontSize=14,FontWeight='normal')
        pause(3)

        newArray(7,3) = 387; %medical
        newArray(7,4) = 643; %pyramid
        newArray(7,5) = 820; %exclaimation
        newArray(7,6) = 822; %question
        drawScene(mainMap,newArray)
        title('Others, are either marked or unmarked events with the latter being random.',FontSize=14,FontWeight='normal')
        pause(4)
        title('Both types of events can improve your stats, better preparing you for your quest.',FontSize=14,FontWeight='normal')
        pause(3.5)
        % overview of how controls are handled
        title('')
        newArray(2,2:7) = 1;
        newArray(5,2:7) = 1;
        newArray(6,2:7) = 1;
        newArray(7,2:7) = 1;
        newArray(2,3) = T;
        newArray(2,4) = I;
        newArray(2,5) = P;
        newArray(2,6) = S;
        drawScene(mainMap,newArray)
        pause(2)
    
        title('This game uses various controls depending on the situation.',FontSize=14,FontWeight='normal')
        pause(3)

        newArray(5,3) = W;
        newArray(5,4) = A;
        newArray(5,5) = S;
        newArray(5,6) = D;
        drawScene(mainMap,newArray)
        title('''WASD'' will be used to move around the map, and in the occasional event.',FontSize=14,FontWeight='normal')
        pause(4)

        newArray(6,4) = 509; %blank mouse
        newArray(6,5) = 510; %left click
        drawScene(mainMap,newArray)
        title('Some events require mouse input, and the mouse may be needed to reopen a figure.',FontSize=14,FontWeight='normal')
        pause(4)

        newArray(7,3) = 823; %question box
        newArray(7,4) = A;
        newArray(7,5) = N;
        newArray(7,6) = S;
        drawScene(mainMap,newArray)
        title('But most will use keyboard input in the command window for number or text responses.',FontSize=14,FontWeight='normal')
        pause(4)
        % wishing them luck on their quest
        title('')
        newArray(2,2:7) = 1;
        newArray(3,2:7) = 1;
        newArray(5,2:7) = 1;
        newArray(6,2:7) = 1;
        newArray(7,2:7) = 1;
        newArray(4,2:7) = bottBord;
        newArray(3,1) = leftBord;
        newArray(3,8) = rightBord;
        newArray(4,1) = cornerLL;
        newArray(4,8) = cornerLR;
        newArray(2,3) = G;
        newArray(2,4) = O;
        newArray(2,5) = O;
        newArray(2,6) = D;
        newArray(3,3) = L;
        newArray(3,4) = U;
        newArray(3,5) = C;
        newArray(3,6) = K;
        drawScene(mainMap,newArray)
        pause(2)

        title('The rest you can learn through your time in Ardennia, enjoy!',FontSize=14,FontWeight='normal')
        pause(3)
        title('Loading the character creator...',FontSize=14,FontWeight='normal')
        pause(3)
        n = 1;
        close all
        elseif tutorial == 'n'
        title('Ah, you must be familiar with Ardennia or very confident in yourself! Regardless of which, do enjoy!')
        pause(4)
        title('Loading the character creator...',FontSize=14,FontWeight='normal')
        pause(3)
        n = 1;
        close all
        else
            fprintf('%s is not a proper input.',tutorial)
        end
        
        end %while n
    i = 1;
    else
        fprintf('%s is not a proper input.',start)
    end

end %while i
end %function