%project draft nine (Final) Zac Smith
%272 x 224 grid, small map; white border around. chunk = 16x16 pixels
%generate a 33x27 matrix firstly at random
mapData =[zeros(1,27)];
numRows=33;
numCols=27;

%generate map spawn points with Matrix loops
for row = 2:numRows
   mapRow = []; 
    for col = 1:numCols
       matrixVal = rand;

       if matrixVal <= 0.4
          matrixVal = 4;
       else
           matrixVal = 1;
       end

       %White border

       if row ==33
           matrixVal=0;
       end
       if col==1
          matrixVal=0; 
       end
       if col == 27
           matrixVal =0;
       end
       mapRow = [mapRow matrixVal];
        
    end
    mapData=[mapData; mapRow];
end
%Spawn location of capitals
mapData(3,3)=10; %Top left (pink)
mapData(3,25)=11; %Top right (purple)
mapData(31,3)=12; %bottom left (yellow)
mapData(31,25)=13; %bottom right (cyan)
%Generate random cities locations
for row = 1:numRows
   for col=1:numCols
      if mapData(row,col)==1
          GenerateRandom = rand;
          if GenerateRandom<0.05
              mapData(row,col)=3;
          end
      end
   end  
end


%Important Data              
[MoneyMatrix, NameMatrix, PositionMatrix, TerritoryMatrix, OccupyMatrix] = MapMatrices(mapData);
              
%Tiles of the map
x=1;
[Border, SideNumbersMatrix, BorderTile] = BodersFunction(x);

GenericTile1=[1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1; 
              1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1;
              1 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1;
              1 1 1 0 0 0 1 1 1 1 0 0 0 1 1 1;
              1 1 0 0 0 1 1 1 1 1 1 0 0 0 1 1;
              0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0;
              0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0;
              0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0];

GenericTile2 =[];
for i=1:8
    pixelRowGen2=[];
   for j=1:16
       pixelValGen2=GenericTile1((9-i),(17-j));
       pixelRowGen2 =[pixelRowGen2 pixelValGen2];
   end
   GenericTile2 = [GenericTile2; pixelRowGen2];
end
GenericTile=[];
GenericTile=[GenericTile1; GenericTile2];
%water
WaterTile = GenericTile;  %Water
WaterTile(4:9:13,7:10) = 0.8;
WaterTile(5:7:12,6:11) = 0.8;
WaterTile(6:5:11,5:12) = 0.8;
WaterTile(7:10,4:13) = 0.8;
%Capitals
PurpleCapTile = GenericTile;  %Purple capital
PurpleCapTile(4:9:13,7:10) = 0.5;
PurpleCapTile(5:7:12,6:11) = 0.5;
PurpleCapTile(6:5:11,5:12) = 0.5;
PurpleCapTile(7:10,4:13) = 0.5;
PurpleCapTile(7:11,7) = 0.4;
PurpleCapTile(6:11,9) = 0.4;
PurpleCapTile(10:11,11) = 0.4;
PurpleCapTile(6:11,5) = 0.6;
PurpleCapTile(5:8,11) = 0.6;
PurpleCapTile(6:11,6:2:10) = 0;
PurpleCapTile(5,8:10) = 0;
PurpleCapTile(6:3:9,7) = 0;
PurpleCapTile(9,9:2:11) = 0;
PurpleCapTile(9:11,12) = 0;

PinkCapTile = GenericTile;  %Pink capital
PinkCapTile(4:9:13,7:10) = 0.5;
PinkCapTile(5:7:12,6:11) = 0.5;
PinkCapTile(6:5:11,5:12) = 0.5;
PinkCapTile(7:10,4:13) = 0.5;
PinkCapTile(10:11,5:11) = 0.4;
PinkCapTile(9,11) = 0.4;
PinkCapTile(9:11,4:2:12) = 0;
PinkCapTile(6:7,7:2:9) = 0;
PinkCapTile(5:3:8,8) = 0;
PinkCapTile(9,5:2:7) = 0;
PinkCapTile(10,9) = 0;
PinkCapTile(8,10:12) = 0;
PinkCapTile(6:7,8) = 0.7;

YellowCapTile = GenericTile;  %Yellow capital
YellowCapTile(4:9:13,7:10) = 0.5;
YellowCapTile(5:7:12,6:11) = 0.5;
YellowCapTile(6:5:11,5:12) = 0.5;
YellowCapTile(7:10,4:13) = 0.5;
YellowCapTile(10,5:7:12) = 0;
YellowCapTile(9,6:5:11) = 0;
YellowCapTile(6:11,7:3:10) = 0;
YellowCapTile(5:3:8,8:9) = 0;
YellowCapTile(9:11,8:9) = 0.4;
YellowCapTile(10:11,6:5:11) = 0.4;
YellowCapTile(11,5:7:12) = 0.4;
YellowCapTile(6:7,8:9) = 0.1;

CyanCapTile = GenericTile;  %Cyan capital
CyanCapTile(4:9:13,7:10) = 0.5;
CyanCapTile(5:7:12,6:11) = 0.5;
CyanCapTile(6:5:11,5:12) = 0.5;
CyanCapTile(7:10,4:13) = 0.5;
CyanCapTile(10:11,7:10) = 0.4;
CyanCapTile(7:8,8:9) = 0.4;
CyanCapTile(10:11,6:5:11) = 0;
CyanCapTile(8:9,5:7:12) = 0;
CyanCapTile(7,6:5:11) = 0;
CyanCapTile(5:9,7:3:10) = 0;
CyanCapTile(5:4:9,8:9) = 0;
CyanCapTile(8:9,6:5:11) = 0.2;
CyanCapTile(6,8:9) = 0.2;

LandTile = GenericTile; %Land
LandTile(4:9:13,7:10) = 0.5;
LandTile(5:7:12,6:11) = 0.5;
LandTile(6:5:11,5:12) = 0.5;
LandTile(7:10,4:13) = 0.5;


GenericCityTile = GenericTile; %Generic cities
GenericCityTile(4:9:13,7:10) = 0.5;
GenericCityTile(5:7:12,6:11) = 0.5;
GenericCityTile(6:5:11,5:12) = 0.5;
GenericCityTile(7:10,4:13) = 0.5;
GenericCityTile(10,4:8:12) = 0;
GenericCityTile(10,5:2:13) = 0;
GenericCityTile(8:10,5:2:11) = 0;
GenericCityTile(6,7:9) = 0;
GenericCityTile(7,7:2:9) = 0;
GenericCityTile(8,6:4:10) = 0;
GenericCityTile(9,12) = 0;
GenericCityTile(9:10,6:2:10) = 0.4;
GenericCityTile(7:8,8) = 0.4;

%Generate black and white map per tile
mapTest = [];
for tileRow = 1:2:numRows
    mapTileRow = [];
    for tileCol = 1:2:numCols
         border =[];
        if mapData(tileRow,tileCol) == 0
            mapTileRow = [mapTileRow BorderTile];
        elseif mapData(tileRow,tileCol) == 1
            mapTileRow = [mapTileRow LandTile];
        elseif mapData(tileRow,tileCol) == 4
            mapTileRow = [mapTileRow WaterTile];
        elseif mapData(tileRow,tileCol) == 10 
            mapTileRow = [mapTileRow PinkCapTile];
        elseif mapData(tileRow,tileCol) == 11 
            mapTileRow = [mapTileRow PurpleCapTile];
        elseif mapData(tileRow,tileCol) == 12 
            mapTileRow = [mapTileRow YellowCapTile];
        elseif mapData(tileRow,tileCol) == 13 
            mapTileRow = [mapTileRow CyanCapTile];
        elseif mapData(tileRow,tileCol) == 3 
            mapTileRow = [mapTileRow GenericCityTile];
        end
    end

    mapTest =[mapTest; mapTileRow];
end
mapTest(1:16,1:224)=Border;
mapTest(1:272,1:16)=SideNumbersMatrix;

%Generate tiles between chunks
for k = 0:13
      J = 2*(k) + 4;
     for x = 0:10
         Z = 2*(x) + 4; 
         switch mapData(J,Z)
             case 1
              mapTest((28+16*(k)):9:(37+16*(k)),(31+16*(x)):(34+16*(x)))=0.5; 
              mapTest((29+16*(k)):7:(36+16*(k)),(30+16*(x)):(35+16*(x)))=0.5;
              mapTest((30+16*(k)):5:(35+16*(k)),(29+16*(x)):(36+16*(x)))=0.5;
              mapTest((31+16*(k)):(34+16*(k)),(28+16*(x)):(37+16*(x)))=0.5;
             case 4
              mapTest((28+16*(k)):9:(37+16*(k)),(31+16*(x)):(34+16*(x)))=0.8; 
              mapTest((29+16*(k)):7:(36+16*(k)),(30+16*(x)):(35+16*(x)))=0.8;
              mapTest((30+16*(k)):5:(35+16*(k)),(29+16*(x)):(36+16*(x)))=0.8;
              mapTest((31+16*(k)):(34+16*(k)),(28+16*(x)):(37+16*(x)))=0.8;    
             case 3
              mapTest((28+16*(k)):9:(37+16*(k)),(31+16*(x)):(34+16*(x)))=0.5; 
              mapTest((29+16*(k)):7:(36+16*(k)),(30+16*(x)):(35+16*(x)))=0.5;
              mapTest((30+16*(k)):5:(35+16*(k)),(29+16*(x)):(36+16*(x)))=0.5;
              mapTest((31+16*(k)):(34+16*(k)),(28+16*(x)):(37+16*(x)))=0.5;
              mapTest((34+16*(k)),(28+16*(x)):9:(37+16*(x)))=0;
              mapTest((32+16*(k)):(34+16*(k)),(29+16*(x)):2:(35+16*(x)))=0;
              mapTest((33+16*(k)):(34+16*(k)),(36+16*(x)))=0;
              mapTest((32+16*(k)),(30+16*(x)):4:(34+16*(x)))=0;
              mapTest((31+16*(k)),(31+16*(x)):2:(33+16*(x)))=0;
              mapTest((30+16*(k)),(31+16*(x)):(33+16*(x)))=0;
              mapTest((33+16*(k)):(34+16*(k)),(30+16*(x)):2:(34+16*(x)))=0.4;
              mapTest((31+16*(k)):(32+16*(k)),(32+16*(x)))= 0.4;
         end
     end

end

%Colour map
map_coloured = [];
[mapRowsC, mapColsC] = size(mapTest);
for i = 1:1:mapRowsC
    coloured_row=[];
    for j = 1:1:mapColsC
       switch (mapTest(i,j))
           case 0
              coloured_row = cat(1,coloured_row,[0,0,0]); 
           case 1
              coloured_row = cat(1,coloured_row,[1,1,1]);  
           case 0.5
              coloured_row = cat(1,coloured_row,[0,0.6,0]);  
           case 0.8
              coloured_row = cat(1,coloured_row,[0,0.2980392157,0.6]);  
           case 0.4
              coloured_row = cat(1,coloured_row,[0.7843137255,0.7843137255,0.7843137255]);  
           case 0.6
              coloured_row = cat(1,coloured_row,[0.8,0,0.8]);  
           case 0.7
              coloured_row = cat(1,coloured_row,[0.8,0,0.4]);  
           case 0.1
              coloured_row = cat(1,coloured_row,[1,1,0.2]); 
           case 0.2
              coloured_row = cat(1,coloured_row,[0,1,1]);
       end
    end
    map_coloured = cat(3, map_coloured, coloured_row);
end

%Shuffle dimensions from width, colour, height to width, height, colour
map_coloured = permute(map_coloured, [3,1,2]);
%imshow(map_coloured)
%All needed before the game starts up, all are used in a variety of ways
%during the game, most names are self explanitory
Ai_buy1 = Ai_buy_fun_updated();
Ai_buy2 = Ai_buy_fun_updated();
Ai_buy3 = Ai_buy_fun_updated();
Ai_Player1 = 0;
Ai_Player2 = 0;
Ai_Player3 = 0;
Num_Units = 1;
National_Wealth = 9;
Ai_Bought1 = 1;
Ai_Bought2 = 1;
Ai_Bought3 = 1;
Ai_National_Wealth1 = 9;
Ai_National_Wealth2 = 9;
Ai_National_Wealth3 = 9;
MilitaryMatrix = [];
Ai_MilitaryMatrix1 = [];
Ai_MilitaryMatrix2 = [];
Ai_MilitaryMatrix3 = [];
nation = 0;
CityVector = [];
MilitaryMatrixX = zeros(100,7);
%Instructions
fprintf('\nHow to play:\n\nThe tile you occupy can be at most surrounded by 8 other tiles\nTo move between tiles you enter:\nNorth-West: Q North: W North-East: E\nWest: A Stay: S East: D\nSouth-West: Z South: X South-East: C\n\nIf you look at your keyboard you will see that these are the\neight keys surrounding S which should make things easier. To attack move towards the enemy unit.\nIt is best played with the matlab UI on one half of your screen and figure 1 (Which\nappears when the first unit is bought) on the other half.\nThere is no way to end the game so to stop simply press Ctrl + C while on the matlab UI.\n\n');
%Opening story
fprintf('\nThis planet is called Zxana,\nSince creation it has existed in a state of anarchic peace.\nThis all changed with the arrival of beings from another world,\nthey corrupted the brain chemistry of the people living in the four corners of the world,\nthrough nano-technological means and now theses peoples leaders seek to controll all of Zxana...\n\n');
fprintf('These four nations are:\n(Zolomites)\nLeader: Zoroaster\nNation-Type: Confederacy\nTo choose type Z \n\n(The Xathu)\nLeader: Xalak\nNation-Type: Despotism\nTo choose type X\n\n(Moathains)\nLeader: Moae\nNation-Type: Technocracy\nTo choose type M\n\n(Pyth)\nLeader: Ssaxu\nNation-Type: Theocracy\nTo choose type P\n\n');
%The game itself, start has to be entered in order for it to run
StartGame = input('Do you wish to start the game?: ', 's');
     switch StartGame
         case {'start', 'Start', 'star', 'Star', 's', 'S', 'START','Yes', 'YES', 'go', 'Go', 'GO', 'yes', 'yep', 'yeah'}
             run = 1;
             fprintf('\n\nWecome to the game, Please pick a nation:\n');
             while run == 1
                 while nation == 0
                 nationChoice = input('Please enter your national identity:', 's');
                 switch nationChoice
                     case {'z', 'Z', 'Zed', 'ZED', 'Zolo', 'Zoro'}
                      msgbox('Zolomites chosen!', 'Nation'); 
                      nation = 1;
                      Ai_Player1 = 2;
                      Ai_Player2 = 3;
                      Ai_Player3 = 4;
                     case {'m', 'M', 'Maeo', 'Mao', 'Thains'}
                       msgbox('Maoethains chosen!', 'Nation'); 
                       nation = 3;
                       Ai_Player1 = 1;
                       Ai_Player2 = 2;
                       Ai_Player3 = 4;
                     case {'x', 'X', 'Xa', 'XA', 'Xath', 'XATH'}
                       msgbox('Xathus chosen!', 'Nation'); 
                       nation = 2;
                       Ai_Player1 = 1;
                       Ai_Player2 = 3;
                       Ai_Player3 = 4;
                      case {'p', 'P', 'Pyth', 'PYTH', 'pyTH', 'PYth', 'PYTh'}
                       msgbox('Pyth chosen!', 'Nation');
                       nation = 4; 
                       Ai_Player1 = 1;
                       Ai_Player2 = 2;
                       Ai_Player3 = 3;
                     otherwise
                         nation = 0;
                 end
                 %Making sure a nation is chosen
                 end
                 gameState = 1;
                 %Turns
                 while gameState == 1 
                 %Unit movement    
                 MoveUnits = 0;
                 while MoveUnits == 0
                      if isempty(MilitaryMatrix)== 1
                        break
                      else
                          for i = 1:size(MilitaryMatrix,1)
                             fprintf('\n\nYou have a %s of health %s in %s that is ready to move.\n\n',MilitaryMatrix(i,1),MilitaryMatrix(i,2),MilitaryMatrix(i,3)); 
                             moves = str2num(MilitaryMatrix(i,4));
                             for j = 1:moves
                                 Movement = input('Input a move:','s');
                                 [TerritoryMatrix, MilitaryMatrix, map_coloured, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1] = Move_or_Battle(Movement, TerritoryMatrix, MilitaryMatrix, i, PositionMatrix, nation, map_coloured, NameMatrix, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1);
                             end
                          end
                          MoveUnits = 1;
                          moves = 0;
                      end
                 end  
                 %Move the ai 1
                 MoveUnitsAI = 0;
                 while MoveUnitsAI == 0
                     if isempty(Ai_MilitaryMatrix1)== 1
                        break
                     else
                         for i = 1:size(Ai_MilitaryMatrix1,1)
                          moves = str2num(Ai_MilitaryMatrix1(i,4));   
                             for j = 1:moves
                                 nationX = nation;
                                 MilitaryMatrixX = MilitaryMatrix;
                                 [Movement, Ai_MilitaryMatrix1] = Ai_Logic (NameMatrix, Ai_Player1, Ai_MilitaryMatrix1, TerritoryMatrix, MilitaryMatrix, OccupyMatrix, i, MoneyMatrix );
                                 nation = Ai_Player1;
                                 MilitaryMatrix = Ai_MilitaryMatrix1;
                                 [TerritoryMatrix, MilitaryMatrix, map_coloured, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1] = Move_or_Battle(Movement, TerritoryMatrix, MilitaryMatrix, i, PositionMatrix, nation, map_coloured, NameMatrix, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1);
                                 nation = nationX; 
                                 Ai_MilitaryMatrix1 = MilitaryMatrix;
                                 MilitaryMatrix = MilitaryMatrixX;
                             end
                         end
                         MoveUnitsAI = 1;
                         moves = 0;
                     end
                 end
                 MoveUnitsAI = 0;
                 % Move ai 2
                 while MoveUnitsAI == 0
                     if isempty(Ai_MilitaryMatrix2)== 1
                        break
                     else
                         for i = 1:size(Ai_MilitaryMatrix2,1)
                          moves = str2num(Ai_MilitaryMatrix2(i,4));   
                             for j = 1:moves
                                 nationX = nation;
                                 MilitaryMatrixX = MilitaryMatrix;
                                 MilitaryMatrixY = Ai_MilitaryMatrix1;
                                 Ai_MilitaryMatrix1 = Ai_MilitaryMatrix2;
                                 Ai_playerX = Ai_Player1;
                                 Ai_Player1 = Ai_Player2;
                                 [Movement, Ai_MilitaryMatrix1] = Ai_Logic (NameMatrix, Ai_Player1, Ai_MilitaryMatrix1, TerritoryMatrix, MilitaryMatrix, OccupyMatrix, i, MoneyMatrix );
                                 Ai_Player1 = Ai_playerX;
                                 Ai_MilitaryMatrix2 = Ai_MilitaryMatrix1;
                                 Ai_MilitaryMatrix1 = MilitaryMatrixY;
                                 nation = Ai_Player2;
                                 MilitaryMatrix = Ai_MilitaryMatrix2;
                                 [TerritoryMatrix, MilitaryMatrix, map_coloured, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1] = Move_or_Battle(Movement, TerritoryMatrix, MilitaryMatrix, i, PositionMatrix, nation, map_coloured, NameMatrix, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1);
                                 nation = nationX; 
                                 Ai_MilitaryMatrix2 = MilitaryMatrix;
                                 MilitaryMatrix = MilitaryMatrixX;
                             end
                         end
                         MoveUnitsAI = 1;
                         moves = 0;
                     end
                 end
                 MoveUnitsAI = 0;
                 % Move ai 3
                 while MoveUnitsAI == 0
                     if isempty(Ai_MilitaryMatrix3)== 1
                        break
                     else
                         for i = 1:size(Ai_MilitaryMatrix3,1)
                          moves = str2num(Ai_MilitaryMatrix3(i,4));   
                             for j = 1:moves
                                 nationX = nation;
                                 MilitaryMatrixX = MilitaryMatrix;
                                 MilitaryMatrixY = Ai_MilitaryMatrix1;
                                 Ai_MilitaryMatrix1 = Ai_MilitaryMatrix3;
                                 Ai_playerX = Ai_Player1;
                                 Ai_Player1 = Ai_Player3;
                                 [Movement, Ai_MilitaryMatrix1] = Ai_Logic (NameMatrix, Ai_Player1, Ai_MilitaryMatrix1, TerritoryMatrix, MilitaryMatrix, OccupyMatrix, i, MoneyMatrix );
                                 Ai_Player1 = Ai_playerX;
                                 Ai_MilitaryMatrix3 = Ai_MilitaryMatrix1;
                                 Ai_MilitaryMatrix1 = MilitaryMatrixY;
                                 nation = Ai_Player3;
                                 MilitaryMatrix = Ai_MilitaryMatrix3;
                                 [TerritoryMatrix, MilitaryMatrix, map_coloured, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1] = Move_or_Battle(Movement, TerritoryMatrix, MilitaryMatrix, i, PositionMatrix, nation, map_coloured, NameMatrix, OccupyMatrix, AllMilitraryUnits, MilitaryMatrixX, Ai_MilitaryMatrix2, Ai_MilitaryMatrix3, Ai_MilitaryMatrix1);
                                 nation = nationX; 
                                 Ai_MilitaryMatrix3 = MilitaryMatrix;
                                 MilitaryMatrix = MilitaryMatrixX;
                             end
                         end
                         MoveUnitsAI = 1;
                         moves = 0;
                     end
                 end
                 MoveUnitsAI = 0;
                 %Generates money each turn
                 for Ter_Row = 1:29
                       for Ter_Col = 1:23
                           switch(TerritoryMatrix(Ter_Row,Ter_Col))
                               case 1
                                   if nation == 1
                                       National_Wealth = National_Wealth + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                                   if Ai_Player1 == 1
                                       Ai_National_Wealth1 = Ai_National_Wealth1 + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                               case 2
                                   if nation == 2
                                       National_Wealth = National_Wealth + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                                   if Ai_Player1 == 2 
                                       Ai_National_Wealth1 = Ai_National_Wealth1 + MoneyMatrix(Ter_Row,Ter_Col);
                                   elseif Ai_Player2 == 2
                                       Ai_National_Wealth2 = Ai_National_Wealth2 + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                               case 3
                                   if nation == 3
                                       National_Wealth = National_Wealth + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                                   if Ai_Player2 == 3
                                       Ai_National_Wealth2 = Ai_National_Wealth2 + MoneyMatrix(Ter_Row,Ter_Col);
                                   elseif Ai_Player3 == 3
                                       Ai_National_Wealth3 = Ai_National_Wealth3 + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                               case 4
                                   if nation == 4
                                       National_Wealth = National_Wealth + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                                   if Ai_Player3 == 4 
                                       Ai_National_Wealth3 = Ai_National_Wealth3 + MoneyMatrix(Ter_Row,Ter_Col);
                                   end
                           end
                       end
                 end
                 %Generates national borders and prompts unit buying
                   for Ter_Row = 1:29
                       for Ter_Col = 1:23
                           switch (TerritoryMatrix(Ter_Row,Ter_Col))
                               %Code to create a border when the tile is
                               %controlled
                               case 1
                                  if mod(Ter_Row, 2)==0
                                     map_coloured((25 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4]; 
                                     map_coloured((40 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4]; 
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(26 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(25 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(35 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(36 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(37 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(38 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(39 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(40 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4];
                                  else
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured((17 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured((32 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(21 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(20 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(19 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(18 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(31 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(17 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(32 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4; 0.8,0,0.4];
                                  end
                                  %Output city if it's player controlled
                                  %and purchase units from it
                                  if nation == 1
                                    if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      CityVector = [NameMatrix(Ter_Row,Ter_Col), PositionMatrix(Ter_Row,Ter_Col),"$"+num2str(MoneyMatrix(Ter_Row,Ter_Col))];  
                                      disp(CityVector);
                                      fprintf('Balance:$%0.3f\nThe city of %s can purchase:\nA tank for $100 (Enter T)\nA cannon for $50 (Enter C)\nA soldier for $12(Enter S)\nTo skip purchase enter SKIP\n',National_Wealth ,NameMatrix(Ter_Row,Ter_Col));
                                      RunningBuy = 0;
                                       while RunningBuy == 0
                                         Buy = input('Enter unit code:','s');
                                           switch Buy
                                               case 'S'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'C'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'T'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case {'SKIP', 'Skip', 'skip', 'sikp' 'SIKP', 'SKI','ski'}
                                                   RunningBuy = 1;
                                               case ''
                                                   fprintf('Invalid Entry!\n');
                                               otherwise   
                                                   fprintf('Invalid Entry!\n');
                                           end
                                       end
                                    end   
                                  end
                                  if Ai_Player1 == 1
                                     if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      [UnitPrice] = Price(Ai_buy1(Ai_Bought1)); 
                                      if (Ai_National_Wealth1 >= UnitPrice) 
                                          switch (OccupyMatrix(Ter_Row,Ter_Col))
                                            case 0 
                                          Buy = Ai_buy1(Ai_Bought1);
                                          [Unit_Ai, Ai_National_Wealth1, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai1 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth1, OccupyMatrix, Ai_Player1);
                                          Ai_MilitaryMatrix1 = [Ai_MilitaryMatrix1; Unit_Ai];
                                          clear('Unit_Ai');
                                          clear('Buy');
                                          Ai_Bought1 = Ai_Bought1 + 1;
                                              otherwise
                                          end
                                      end
                                     end
                                  end
                               case 4
                                  if mod(Ter_Row, 2)==0
                                     map_coloured((25 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1]; 
                                     map_coloured((40 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1]; 
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(26 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(25 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1];
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(35 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(36 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(37 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(38 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(39 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(40 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1];
                                  else
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured((17 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1];
                                     map_coloured((32 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(21 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(20 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(19 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(18 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(31 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(17 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(32 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1; 0,1,1];
                                  end
                                  %Output city if it's player controlled
                                  %and purchase units from it
                                  if nation == 4
                                    if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      CityVector = [NameMatrix(Ter_Row,Ter_Col), PositionMatrix(Ter_Row,Ter_Col),"$"+num2str(MoneyMatrix(Ter_Row,Ter_Col))];  
                                      disp(CityVector);
                                      fprintf('Balance:$%0.3f\nThe city of %s can purchase:\nA tank for $100 (Enter T)\nA cannon for $50 (Enter C)\nA soldier for $12(Enter S)\nTo skip purchase enter SKIP\n',National_Wealth ,NameMatrix(Ter_Row,Ter_Col));
                                      RunningBuy = 0;
                                       while RunningBuy == 0
                                         Buy = input('Enter unit code:','s');
                                           switch Buy
                                               case 'S'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'C'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'T'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case {'SKIP', 'Skip', 'skip', 'sikp' 'SIKP', 'SKI','ski'}
                                                   RunningBuy = 1;
                                               otherwise   
                                                   fprintf('Invalid Entry!\n');
                                           end
                                       end
                                    end   
                                  end
                                  if Ai_Player3 == 4
                                     if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      [UnitPrice] = Price(Ai_buy3(Ai_Bought3)); 
                                      if (Ai_National_Wealth3 >= UnitPrice) 
                                          switch (OccupyMatrix(Ter_Row,Ter_Col))
                                            case 0 
                                          Buy = Ai_buy3(Ai_Bought3);
                                          [Unit_Ai, Ai_National_Wealth3, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai3 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth3, OccupyMatrix, Ai_Player3);
                                          Ai_MilitaryMatrix3 = [Ai_MilitaryMatrix3; Unit_Ai];
                                          clear('Unit_Ai');
                                          clear('Buy');
                                          Ai_Bought3 = Ai_Bought3 + 1;
                                              otherwise
                                          end
                                      end
                                     end
                                  end
                               case 3
                                  if mod(Ter_Row, 2)==0
                                     map_coloured((25 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2]; 
                                     map_coloured((40 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2]; 
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(26 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(25 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2];
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(35 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(36 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(37 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(38 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(39 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(40 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2];
                                  else
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured((17 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2];
                                     map_coloured((32 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(21 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(20 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(19 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(18 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(31 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(17 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(32 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2; 1,1,0.2];
                                  end
                                  %Output city if it's player controlled
                                  %and purchase units from it
                                  if nation == 3
                                    if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      CityVector = [NameMatrix(Ter_Row,Ter_Col), PositionMatrix(Ter_Row,Ter_Col),"$"+num2str(MoneyMatrix(Ter_Row,Ter_Col))];  
                                      disp(CityVector);
                                      fprintf('Balance:$%0.3f\nThe city of %s can purchase:\nA tank for $100 (Enter T)\nA cannon for $50 (Enter C)\nA soldier for $12(Enter S)\nTo skip purchase enter SKIP\n',National_Wealth ,NameMatrix(Ter_Row,Ter_Col));
                                      RunningBuy = 0;
                                       while RunningBuy == 0
                                         Buy = input('Enter unit code:','s');
                                           switch Buy
                                               case 'S'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'C'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'T'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case {'SKIP', 'Skip', 'skip', 'sikp' 'SIKP', 'SKI','ski'}
                                                   RunningBuy = 1;
                                               otherwise   
                                                   fprintf('Invalid Entry!\n');
                                           end
                                       end
                                    end   
                                  end
                                  if Ai_Player2 == 3
                                     if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      [UnitPrice] = Price(Ai_buy2(Ai_Bought2)); 
                                      if (Ai_National_Wealth2 >= UnitPrice)
                                          switch (OccupyMatrix(Ter_Row,Ter_Col))
                                            case 0 
                                          Buy = Ai_buy2(Ai_Bought2);
                                          [Unit_Ai, Ai_National_Wealth2, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai2 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth2, OccupyMatrix, Ai_Player2);
                                          Ai_MilitaryMatrix2 = [Ai_MilitaryMatrix2; Unit_Ai];
                                          Ai_Bought2 = Ai_Bought2 + 1;
                                          clear('Unit_Ai');
                                          clear('Buy');
                                              otherwise
                                          end
                                      end
                                     end
                                  elseif Ai_Player3 == 3
                                     if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      [UnitPrice] = Price(Ai_buy3(Ai_Bought3)); 
                                      if (Ai_National_Wealth3 >= UnitPrice)
                                        switch (OccupyMatrix(Ter_Row,Ter_Col))
                                            case 0   
                                          Buy = Ai_buy3(Ai_Bought3);
                                          [Unit_Ai, Ai_National_Wealth3, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai3 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth3, OccupyMatrix, Ai_Player3);
                                          Ai_MilitaryMatrix3 = [Ai_MilitaryMatrix3; Unit_Ai];
                                          Ai_Bought3 = Ai_Bought3 + 1;
                                          clear('Unit_Ai');
                                          clear('Buy');
                                            otherwise
                                        end
                                      end
                                     end
                                  end
                               case 2
                                  if mod(Ter_Row, 2)==0
                                     map_coloured((25 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8]; 
                                     map_coloured((40 + 16*(Ter_Row - ((Ter_Row/2)+1))),((30 + 16*(Ter_Col - ((Ter_Col/2)+1))):(35 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8]; 
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(26 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(25 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((26 + 16*(Ter_Row - ((Ter_Row/2)+1))):13:(39 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(35 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((27 + 16*(Ter_Row - ((Ter_Row/2)+1))):11:(38 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(36 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((28 + 16*(Ter_Row - ((Ter_Row/2)+1))):9:(37 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(37 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((29 + 16*(Ter_Row - ((Ter_Row/2)+1))):7:(36 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(38 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):5:(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(39 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((30 + 16*(Ter_Row - ((Ter_Row/2)+1))):(35 + 16*(Ter_Row - ((Ter_Row/2)+1)))),(40 + 16*(Ter_Col - ((Ter_Col/2)+1))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8];
                                  else
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((18 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):13:(31 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured((17 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured((32 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((22 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(27 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(21 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(20 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(19 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(18 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((19 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):11:(30 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(28 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((20 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):9:(29 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(29 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((21 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):7:(28 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(30 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):5:(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(31 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(17 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8];
                                     map_coloured(((22 + 16*(Ter_Row - ((Ter_Row/2)+0.5))):(27 + 16*(Ter_Row - ((Ter_Row/2)+0.5)))),(32 + 16*(Ter_Col - ((Ter_Col/2)+0.5))),:)= [0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8; 0.8,0,0.8];
                                  end
                                  %Output city if it's player controlled
                                  %and purchase units from it
                                  if nation == 2
                                    if (NameMatrix(Ter_Row,Ter_Col)) ~= ""
                                      CityVector = [NameMatrix(Ter_Row,Ter_Col), PositionMatrix(Ter_Row,Ter_Col),"$"+num2str(MoneyMatrix(Ter_Row,Ter_Col))];  
                                      disp(CityVector);
                                      fprintf('Balance:$%0.3f\nThe city of %s can purchase:\nA tank for $100 (Enter T)\nA cannon for $50 (Enter C)\nA soldier for $12(Enter S)\nTo skip purchase enter SKIP\n',National_Wealth ,NameMatrix(Ter_Row,Ter_Col));
                                      RunningBuy = 0;
                                       while RunningBuy == 0
                                         Buy = input('Enter unit code:','s');
                                           switch Buy
                                               case 'S'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'C'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case 'T'
                                                   [Unit, Num_Units, National_Wealth, map_coloured, OccupyMatrix] = Buy_A_Unit(Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation);
                                                   RunningBuy = 1;
                                                   MilitaryMatrix = [MilitaryMatrix; Unit];
                                                   clear('Unit')
                                               case {'SKIP', 'Skip', 'skip', 'sikp' 'SIKP', 'SKI','ski'}
                                                   RunningBuy = 1;
                                               otherwise   
                                                   fprintf('Invalid Entry!\n');
                                           end
                                       end
                                    end   
                                  end
                                  if Ai_Player1 == 2
                                     if (NameMatrix(Ter_Row,Ter_Col)) ~= "" 
                                      [UnitPrice] = Price(Ai_buy1(Ai_Bought1)); 
                                      if (Ai_National_Wealth1 >= UnitPrice)
                                          switch (OccupyMatrix(Ter_Row,Ter_Col))
                                            case 0 
                                          Buy = Ai_buy1(Ai_Bought1);
                                          [Unit_Ai, Ai_National_Wealth1, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai1 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth1, OccupyMatrix, Ai_Player1);
                                          Ai_MilitaryMatrix1 = [Ai_MilitaryMatrix1; Unit_Ai];
                                          Ai_Bought1 = Ai_Bought1 + 1;
                                          clear('Unit_Ai');
                                          clear('Buy');
                                              otherwise
                                          end
                                      end
                                     end
                                  elseif Ai_Player2 == 2
                                     if (NameMatrix(Ter_Row,Ter_Col)) ~= "" 
                                      [UnitPrice] = Price(Ai_buy2(Ai_Bought2)); 
                                      if Ai_National_Wealth2 >= UnitPrice
                                        switch (OccupyMatrix(Ter_Row,Ter_Col))
                                            case 0   
                                          Buy = Ai_buy2(Ai_Bought2);
                                          [Unit_Ai, Ai_National_Wealth2, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai2 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth2, OccupyMatrix, Ai_Player2);
                                          Ai_MilitaryMatrix2 = [Ai_MilitaryMatrix2; Unit_Ai];
                                          Ai_Bought2 = Ai_Bought2 + 1;
                                          clear('Unit_Ai');
                                          clear('Buy');
                                            otherwise
                                        end
                                      end
                                     end
                                  end
                           end

                       end
                   end
                    %This cleans up the national borders on the map
                    clear('i')
                    clear('j')
                    %Diagonals
                    for i = 1:29
                      for j = 3:23
                        switch(TerritoryMatrix(i,(j))) 
                          case {0}  
                          case {nation}
                           if TerritoryMatrix(i,(j-2)) == nation
                             if mod(Ter_Row, 2)==0
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34+ 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34 + 16*(i - ((i/2)+1)))),(24 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0]; 
                             elseif mod(Ter_Row, 2)==1
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(16 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                             end        
                           end
                          case {Ai_Player1}
                            if TerritoryMatrix(i,(j-2)) == Ai_Player1
                             if mod(Ter_Row, 2)==0
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34+ 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34 + 16*(i - ((i/2)+1)))),(24 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0]; 
                             elseif mod(Ter_Row, 2)==1
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(16 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                             end        
                            end
                          case {Ai_Player2}
                           if TerritoryMatrix(i,(j-2)) == Ai_Player2
                             if mod(Ter_Row, 2)==0
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34+ 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34 + 16*(i - ((i/2)+1)))),(24 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0]; 
                             elseif mod(Ter_Row, 2)==1
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(16 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                             end        
                           end
                          case {Ai_Player3}
                           if TerritoryMatrix(i,(j-2)) == Ai_Player3
                             if mod(Ter_Row, 2)==0
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34+ 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((31 + 16*(i - ((i/2)+1))):(34 + 16*(i - ((i/2)+1)))),(24 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0;0,0,0;0,0,0]; 
                             elseif mod(Ter_Row, 2)==1
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                                map_coloured(((23 + 16*(i - ((i/2)+0.5))):(26 + 16*(i - ((i/2)+0.5)))),(16 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                             end        
                           end
                          otherwise
                  
                        end
                      end
                    end
                    %north-west
                    for i = 2:29
                     for j = 2:23
                      switch(TerritoryMatrix(i,(j))) 
                        case {0} 
                  
                        case {nation}
                         if TerritoryMatrix((i-1),(j-1)) == nation
                          if mod(Ter_Row, 2)==0
                           map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(32 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured((27 + 16*(i - ((i/2)+1))),((29 + 16*(j - ((j/2)+1))):2:(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((28 + 16*(i - ((i/2)+1))),((28 + 16*(j - ((j/2)+1))):2:(30 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((29 + 16*(i - ((i/2)+1))),((27 + 16*(j - ((j/2)+1))):2:(29 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((30 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):2:(28 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((25 + 16*(i - ((i/2)+1))),((30 + 16*(j - ((j/2)+1))):(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((32 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):(27 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((31 + 16*(i - ((i/2)+1))),(27 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                           map_coloured((26 + 16*(i - ((i/2)+1))),(30 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          elseif mod(Ter_Row, 2)==1
                           map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(24 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured((19 + 16*(i - ((i/2)+0.5))),((21 + 16*(j - ((j/2)+0.5))):2:(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((20 + 16*(i - ((i/2)+0.5))),((20 + 16*(j - ((j/2)+0.5))):2:(22 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((21 + 16*(i - ((i/2)+0.5))),((19 + 16*(j - ((j/2)+0.5))):2:(21 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((22 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):2:(20 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((17 + 16*(i - ((i/2)+0.5))),((22 + 16*(j - ((j/2)+0.5))):(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((24 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):(19 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((23 + 16*(i - ((i/2)+0.5))),(19 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                           map_coloured((18 + 16*(i - ((i/2)+0.5))),(22 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          end
                         end
                        case {Ai_Player1}
                         if TerritoryMatrix((i-1),(j-1)) == Ai_Player1
                          if mod(Ter_Row, 2)==0
                           map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(32 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured((27 + 16*(i - ((i/2)+1))),((29 + 16*(j - ((j/2)+1))):2:(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((28 + 16*(i - ((i/2)+1))),((28 + 16*(j - ((j/2)+1))):2:(30 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((29 + 16*(i - ((i/2)+1))),((27 + 16*(j - ((j/2)+1))):2:(29 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((30 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):2:(28 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((25 + 16*(i - ((i/2)+1))),((30 + 16*(j - ((j/2)+1))):(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((32 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):(27 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((31 + 16*(i - ((i/2)+1))),(27 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                           map_coloured((26 + 16*(i - ((i/2)+1))),(30 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          elseif mod(Ter_Row, 2)==1
                           map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(24 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured((19 + 16*(i - ((i/2)+0.5))),((21 + 16*(j - ((j/2)+0.5))):2:(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((20 + 16*(i - ((i/2)+0.5))),((20 + 16*(j - ((j/2)+0.5))):2:(22 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((21 + 16*(i - ((i/2)+0.5))),((19 + 16*(j - ((j/2)+0.5))):2:(21 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((22 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):2:(20 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((17 + 16*(i - ((i/2)+0.5))),((22 + 16*(j - ((j/2)+0.5))):(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((24 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):(19 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((23 + 16*(i - ((i/2)+0.5))),(19 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                           map_coloured((18 + 16*(i - ((i/2)+0.5))),(22 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          end
                         end
                        case {Ai_Player2}
                         if TerritoryMatrix((i-1),(j-1)) == Ai_Player2
                          if mod(Ter_Row, 2)==0
                           map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(32 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured((27 + 16*(i - ((i/2)+1))),((29 + 16*(j - ((j/2)+1))):2:(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((28 + 16*(i - ((i/2)+1))),((28 + 16*(j - ((j/2)+1))):2:(30 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((29 + 16*(i - ((i/2)+1))),((27 + 16*(j - ((j/2)+1))):2:(29 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((30 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):2:(28 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((25 + 16*(i - ((i/2)+1))),((30 + 16*(j - ((j/2)+1))):(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((32 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):(27 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((31 + 16*(i - ((i/2)+1))),(27 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                           map_coloured((26 + 16*(i - ((i/2)+1))),(30 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          elseif mod(Ter_Row, 2)==1
                           map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(24 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured((19 + 16*(i - ((i/2)+0.5))),((21 + 16*(j - ((j/2)+0.5))):2:(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((20 + 16*(i - ((i/2)+0.5))),((20 + 16*(j - ((j/2)+0.5))):2:(22 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((21 + 16*(i - ((i/2)+0.5))),((19 + 16*(j - ((j/2)+0.5))):2:(21 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((22 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):2:(20 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((17 + 16*(i - ((i/2)+0.5))),((22 + 16*(j - ((j/2)+0.5))):(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((24 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):(19 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((23 + 16*(i - ((i/2)+0.5))),(19 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                           map_coloured((18 + 16*(i - ((i/2)+0.5))),(22 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          end
                         end
                        case {Ai_Player3}
                         if TerritoryMatrix((i-1),(j-1)) == Ai_Player3
                          if mod(Ter_Row, 2)==0
                           map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(32 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(25 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                           map_coloured((27 + 16*(i - ((i/2)+1))),((29 + 16*(j - ((j/2)+1))):2:(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((28 + 16*(i - ((i/2)+1))),((28 + 16*(j - ((j/2)+1))):2:(30 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((29 + 16*(i - ((i/2)+1))),((27 + 16*(j - ((j/2)+1))):2:(29 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((30 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):2:(28 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((25 + 16*(i - ((i/2)+1))),((30 + 16*(j - ((j/2)+1))):(31 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((32 + 16*(i - ((i/2)+1))),((26 + 16*(j - ((j/2)+1))):(27 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                           map_coloured((31 + 16*(i - ((i/2)+1))),(27 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                           map_coloured((26 + 16*(i - ((i/2)+1))),(30 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          elseif mod(Ter_Row, 2)==1
                           map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(24 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(17 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                           map_coloured((19 + 16*(i - ((i/2)+0.5))),((21 + 16*(j - ((j/2)+0.5))):2:(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((20 + 16*(i - ((i/2)+0.5))),((20 + 16*(j - ((j/2)+0.5))):2:(22 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((21 + 16*(i - ((i/2)+0.5))),((19 + 16*(j - ((j/2)+0.5))):2:(21 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((22 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):2:(20 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((17 + 16*(i - ((i/2)+0.5))),((22 + 16*(j - ((j/2)+0.5))):(23 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((24 + 16*(i - ((i/2)+0.5))),((18 + 16*(j - ((j/2)+0.5))):(19 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                           map_coloured((23 + 16*(i - ((i/2)+0.5))),(19 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                           map_coloured((18 + 16*(i - ((i/2)+0.5))),(22 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          end
                         end
                          otherwise
                      end
                     end
                    end
                    %north-east
                    for i = 2:29
                     for j = 1:22 
                      switch(TerritoryMatrix(i,(j))) 
                       case {0} 
                       case {nation}
                        if TerritoryMatrix((i-1),(j+1)) == nation
                         if mod(Ter_Row, 2)==0
                          map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(33 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(40 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured((27 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):2:(36 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((28 + 16*(i - ((i/2)+1))),((35 + 16*(j - ((j/2)+1))):2:(37 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((29 + 16*(i - ((i/2)+1))),((36 + 16*(j - ((j/2)+1))):2:(38 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((30 + 16*(i - ((i/2)+1))),((37 + 16*(j - ((j/2)+1))):2:(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((25 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):(35 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((32 + 16*(i - ((i/2)+1))),((38 + 16*(j - ((j/2)+1))):(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((31 + 16*(i - ((i/2)+1))),(38 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          map_coloured((26 + 16*(i - ((i/2)+1))),(35 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(25 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(32 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured((19 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):2:(28 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((20 + 16*(i - ((i/2)+0.5))),((27 + 16*(j - ((j/2)+0.5))):2:(29 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((21 + 16*(i - ((i/2)+0.5))),((28 + 16*(j - ((j/2)+0.5))):2:(30 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((22 + 16*(i - ((i/2)+0.5))),((29 + 16*(j - ((j/2)+0.5))):2:(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):(27 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+0.5))),((30 + 16*(j - ((j/2)+0.5))):(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((23 + 16*(i - ((i/2)+0.5))),(30 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          map_coloured((18 + 16*(i - ((i/2)+0.5))),(27 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                         end
                        end
                       case {Ai_Player1}
                        if TerritoryMatrix((i-1),(j+1)) == Ai_Player1
                         if mod(Ter_Row, 2)==0
                          map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(33 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(40 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured((27 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):2:(36 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((28 + 16*(i - ((i/2)+1))),((35 + 16*(j - ((j/2)+1))):2:(37 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((29 + 16*(i - ((i/2)+1))),((36 + 16*(j - ((j/2)+1))):2:(38 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((30 + 16*(i - ((i/2)+1))),((37 + 16*(j - ((j/2)+1))):2:(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((25 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):(35 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((32 + 16*(i - ((i/2)+1))),((38 + 16*(j - ((j/2)+1))):(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((31 + 16*(i - ((i/2)+1))),(38 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          map_coloured((26 + 16*(i - ((i/2)+1))),(35 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(25 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(32 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured((19 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):2:(28 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((20 + 16*(i - ((i/2)+0.5))),((27 + 16*(j - ((j/2)+0.5))):2:(29 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((21 + 16*(i - ((i/2)+0.5))),((28 + 16*(j - ((j/2)+0.5))):2:(30 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((22 + 16*(i - ((i/2)+0.5))),((29 + 16*(j - ((j/2)+0.5))):2:(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):(27 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+0.5))),((30 + 16*(j - ((j/2)+0.5))):(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((23 + 16*(i - ((i/2)+0.5))),(30 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          map_coloured((18 + 16*(i - ((i/2)+0.5))),(27 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                         end
                        end
                       case {Ai_Player2}
                        if TerritoryMatrix((i-1),(j+1)) == Ai_Player2
                         if mod(Ter_Row, 2)==0
                          map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(33 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(40 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured((27 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):2:(36 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((28 + 16*(i - ((i/2)+1))),((35 + 16*(j - ((j/2)+1))):2:(37 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((29 + 16*(i - ((i/2)+1))),((36 + 16*(j - ((j/2)+1))):2:(38 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((30 + 16*(i - ((i/2)+1))),((37 + 16*(j - ((j/2)+1))):2:(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((25 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):(35 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((32 + 16*(i - ((i/2)+1))),((38 + 16*(j - ((j/2)+1))):(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((31 + 16*(i - ((i/2)+1))),(38 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          map_coloured((26 + 16*(i - ((i/2)+1))),(35 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(25 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(32 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured((19 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):2:(28 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((20 + 16*(i - ((i/2)+0.5))),((27 + 16*(j - ((j/2)+0.5))):2:(29 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((21 + 16*(i - ((i/2)+0.5))),((28 + 16*(j - ((j/2)+0.5))):2:(30 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((22 + 16*(i - ((i/2)+0.5))),((29 + 16*(j - ((j/2)+0.5))):2:(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):(27 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+0.5))),((30 + 16*(j - ((j/2)+0.5))):(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((23 + 16*(i - ((i/2)+0.5))),(30 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          map_coloured((18 + 16*(i - ((i/2)+0.5))),(27 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                         end
                        end
                       case {Ai_Player3}
                        if TerritoryMatrix((i-1),(j+1)) == Ai_Player3
                         if mod(Ter_Row, 2)==0
                          map_coloured(((26 + 16*(i - ((i/2)+1))):(27 + 16*(i - ((i/2)+1)))),(33 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured(((30 + 16*(i - ((i/2)+1))):(31 + 16*(i - ((i/2)+1)))),(40 + 16*(j - ((j/2)+1))),:)= [0,0,0;0,0,0];
                          map_coloured((27 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):2:(36 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((28 + 16*(i - ((i/2)+1))),((35 + 16*(j - ((j/2)+1))):2:(37 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((29 + 16*(i - ((i/2)+1))),((36 + 16*(j - ((j/2)+1))):2:(38 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((30 + 16*(i - ((i/2)+1))),((37 + 16*(j - ((j/2)+1))):2:(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((25 + 16*(i - ((i/2)+1))),((34 + 16*(j - ((j/2)+1))):(35 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((32 + 16*(i - ((i/2)+1))),((38 + 16*(j - ((j/2)+1))):(39 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0];
                          map_coloured((31 + 16*(i - ((i/2)+1))),(38 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                          map_coloured((26 + 16*(i - ((i/2)+1))),(35 + 16*(j - ((j/2)+1))),:)= [0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured(((18 + 16*(i - ((i/2)+0.5))):(19 + 16*(i - ((i/2)+0.5)))),(25 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured(((22 + 16*(i - ((i/2)+0.5))):(23 + 16*(i - ((i/2)+0.5)))),(32 + 16*(j - ((j/2)+0.5))),:)= [0,0,0;0,0,0];
                          map_coloured((19 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):2:(28 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((20 + 16*(i - ((i/2)+0.5))),((27 + 16*(j - ((j/2)+0.5))):2:(29 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((21 + 16*(i - ((i/2)+0.5))),((28 + 16*(j - ((j/2)+0.5))):2:(30 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((22 + 16*(i - ((i/2)+0.5))),((29 + 16*(j - ((j/2)+0.5))):2:(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((26 + 16*(j - ((j/2)+0.5))):(27 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+0.5))),((30 + 16*(j - ((j/2)+0.5))):(31 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0];
                          map_coloured((23 + 16*(i - ((i/2)+0.5))),(30 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                          map_coloured((18 + 16*(i - ((i/2)+0.5))),(27 + 16*(j - ((j/2)+0.5))),:)= [0,0,0];
                         end
                        end
                       otherwise
                  
                      end
                     end
                    end 
                    %Above / below
                    for i = 3:29
                     for j = 1:23
                      switch(TerritoryMatrix(i,(j))) 
                       case {0}                  
                       case {nation}
                        if TerritoryMatrix((i-2),(j)) == nation
                         if mod(Ter_Row, 2)==0
                          map_coloured((25 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((16 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         end
                        end
                       case {Ai_Player1}
                        if TerritoryMatrix((i-2),(j)) == Ai_Player1
                         if mod(Ter_Row, 2)==0
                          map_coloured((25 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((16 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         end
                        end
                       case {Ai_Player2}
                        if TerritoryMatrix((i-2),(j)) == Ai_Player2
                         if mod(Ter_Row, 2)==0
                          map_coloured((25 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((16 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         end
                        end
                       case {Ai_Player3}
                        if TerritoryMatrix((i-2),(j)) == Ai_Player3
                         if mod(Ter_Row, 2)==0
                          map_coloured((25 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((24 + 16*(i - ((i/2)+1))),((31 + 16*(j - ((j/2)+1))):(34 + 16*(j - ((j/2)+1)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         elseif mod(Ter_Row, 2)==1
                          map_coloured((17 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                          map_coloured((16 + 16*(i - ((i/2)+0.5))),((23 + 16*(j - ((j/2)+0.5))):(26 + 16*(j - ((j/2)+0.5)))),:)= [0,0,0;0,0,0;0,0,0;0,0,0];
                         end
                        end
                       otherwise      
                      end
                     end
                    end
                    %Clean up dead units off of map
                    counter = 0;
                    for jeffery = 1:size(MilitaryMatrix,1)
                        if true(str2num(MilitaryMatrix(jeffery,2)) <= 0)
                            counter = counter + 1;
                        end
                    end
                    for qwe = 1:(size(MilitaryMatrix,1)-counter)
                        if true(str2num(MilitaryMatrix(qwe,2)) <= 0)
                            Remover = strcmp(MilitaryMatrix(qwe,3),PositionMatrix);
                            MilitaryMatrix(qwe,:) = [];
                            for kk = 1:29
                             for ll = 1:23
                              if Remover(kk,ll) ~= 0
                               number = kk;
                               colth = ll;
                               break
                              end
                             end
                            end
                            OccupyMatrix(number,colth) = 0;
                            break;
                        end
                    end
                    clear('qwe');
                    clear('jeffery');
                    counter = 0;
                    for jeffery = 1:size(Ai_MilitaryMatrix1,1)
                        if true(str2num(Ai_MilitaryMatrix1(jeffery,2)) <= 0)
                            counter = counter + 1;
                        end
                    end
                    for qwe = 1:(size(Ai_MilitaryMatrix1,1) - counter)
                        if true(str2num(Ai_MilitaryMatrix1(qwe,2)) <= 0)
                            Remover = strcmp(Ai_MilitaryMatrix1(qwe,3),PositionMatrix);
                            Ai_MilitaryMatrix1(qwe,:) = [];
                            for kk = 1:29
                             for ll = 1:23
                              if Remover(kk,ll) ~= 0
                               number = kk;
                               colth = ll;
                               break
                              end
                             end
                            end
                            OccupyMatrix(number,colth) = 0;
                            break;
                        end
                    end
                    clear('qwe');
                    clear('jeffery');
                    counter = 0;
                    for jeffery = 1:size(Ai_MilitaryMatrix2,1)
                        if true(str2num(Ai_MilitaryMatrix2(jeffery,2)) <= 0)
                            counter = counter + 1;
                        end
                    end
                    for qwe = 1:(size(Ai_MilitaryMatrix2,1) - counter)
                        if true(str2num(Ai_MilitaryMatrix2(qwe,2)) <= 0)
                            Remover = strcmp(Ai_MilitaryMatrix2(qwe,3),PositionMatrix);
                            Ai_MilitaryMatrix2(qwe,:) = [];
                            for kk = 1:29
                             for ll = 1:23
                              if Remover(kk,ll) ~= 0
                               number = kk;
                               colth = ll;
                               break
                              end
                             end
                            end
                            OccupyMatrix(number,colth) = 0;
                            break;
                        end
                    end
                    clear('qwe');
                    clear('jeffery');
                    counter = 0;
                    for jeffery = 1:size(Ai_MilitaryMatrix3,1)
                        if true(str2num(Ai_MilitaryMatrix3(jeffery,2)) <= 0)
                            counter = counter + 1;
                        end
                    end
                    for qwe = 1:(size(Ai_MilitaryMatrix3,1) - counter )
                        if true(str2num(Ai_MilitaryMatrix3(qwe,2)) <= 0)
                            Remover = strcmp(Ai_MilitaryMatrix3(qwe,3),PositionMatrix);
                            Ai_MilitaryMatrix3(qwe,:) = [];
                            for kk = 1:29
                             for ll = 1:23
                              if Remover(kk,ll) ~= 0
                               number = kk;
                               colth = ll;
                               break
                              end
                             end
                            end
                            OccupyMatrix(number,colth) = 0;
                            break;
                        end
                    end
                    clear('qwe');
                    clear('jeffery');
                    counter = 0;
                    %For battelling, easy way to find adjectent units
                    for helpme = 1:size(MilitaryMatrix,1)
                        my_militarymatrix = [MilitaryMatrix(helpme,:), "0", "0"];
                    end
                    if isempty(MilitaryMatrix)
                    AllMilitraryUnits = [Ai_MilitaryMatrix1;Ai_MilitaryMatrix2;Ai_MilitaryMatrix3];
                    else
                    AllMilitraryUnits = [my_militarymatrix;Ai_MilitaryMatrix1;Ai_MilitaryMatrix2;Ai_MilitaryMatrix3];
                    end
                    %To win the game 
                    for win = 1:4
                        if true(TerritoryMatrix(1,1) == win && TerritoryMatrix(1,23) == win && TerritoryMatrix(29,1) == win && TerritoryMatrix(29,23) == win )
                          msgbox('Congradulations Glorius Leader, your world worships you!', 'All Capitals Captured');  
                        end
                    end
                   imshow(map_coloured)
                 break
                 end
             end
         otherwise
       fprintf('Thanks for considering playing!\n');      
     end
