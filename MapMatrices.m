function [ MoneyMatrix, NameMatrix, PositionMatrix, TerritoryMatrix, OccupyMatrix] = MapMatrices(mapData)
%generates the matrices that are used throughout the game
  %Cities
  dictText= fileread('Cities.txt'); % read in character arrays
  dictWords= splitlines(dictText); % split the text array into words
  dictWords= dictWords(1:end-1); % remove the last empty line
%Position Matrix
  AlphaVector = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W"];

PositionMatrix = [];
i = 0;
j = 0;
OddMatrix = [];
EvenMatrix = [];
for r = 3:31
   i = i+1;
   j = 0;
   EvenPositionMatrixRow = [];
   OddPositionMatrixRow = [];
    for c = 3:25
        j = j + 1;
       if mod(r,2) == 1
         if mod(c,2) == 1
             if j <= 22
           OddPositionMatrixRow = [OddPositionMatrixRow, string(i)+AlphaVector(1,j), string()];
             else
              OddPositionMatrixRow = [OddPositionMatrixRow, string(i)+AlphaVector(1,j)];   
             end
         elseif mod(c,2) == 0
           OddPositionMatrixRow = [OddPositionMatrixRow];
         end   
       elseif mod(r,2) == 0
            if mod(c,2) == 0
                if j <= 21
               EvenPositionMatrixRow = [EvenPositionMatrixRow, string() ,string(i)+AlphaVector(1,j)];
                else
                  EvenPositionMatrixRow = [EvenPositionMatrixRow, string(),  string(i)+AlphaVector(1,j), string()];  
                end    
            elseif mod(c,2) == 1
               EvenPositionMatrixRow = [EvenPositionMatrixRow];
            end 
       end 
    end
   OddMatrix = [OddMatrix; OddPositionMatrixRow];
   EvenMatrix = [EvenMatrix; EvenPositionMatrixRow];
end
rowEnd = 15;
for row = 1:rowEnd
   if row <= 14

    PositionMatrix = [PositionMatrix; OddMatrix(row,1:23); EvenMatrix(row,1:23)];
   else
     PositionMatrix = [PositionMatrix; OddMatrix(row,1:23)];  
   end
end
%make sure city names and money only generates when theres a tie
[numberRows, numberCols] = size(PositionMatrix);

for hey = 1:numberRows
       Kay = hey + 2 ;
       for you = 1:numberCols
             Jay = you + 2 ;
            switch (PositionMatrix(hey,you))
                case {""}
                       mapData(Kay,Jay) = NaN;
            end
       end
end
%Money and name matrix for map
  NameMatrix = [];
  MoneyMatrix = [];
  TerritoryMatrix = [];
  OccupyMatrix = [];
  for r = 3:31
    MoneyRow = [];
    NameRow = [];
    TerritoryMatrixRow = [];
    OccupyMatrixRow = [];
    for c = 3:25
       RandNum = rand*0.5;
       RandNum2 = rand*3;
       k = round(rand*39)+1;

       switch (mapData(r,c))
           case 1
           MoneyRow = [MoneyRow RandNum];
           NameRow = [NameRow string()];
           TerritoryMatrixRow = [TerritoryMatrixRow 0];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           case 4
           MoneyRow = [MoneyRow 0];
           NameRow = [NameRow string()];
           TerritoryMatrixRow = [TerritoryMatrixRow NaN];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           case 3
           MoneyRow = [MoneyRow RandNum2];
           NameRow = [NameRow string(dictWords(k,1))];
           TerritoryMatrixRow = [TerritoryMatrixRow 0];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           case 10
           MoneyRow = [MoneyRow 3];
           NameRow = [NameRow "Zoro"];
           TerritoryMatrixRow = [TerritoryMatrixRow 1];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           case 11    
           MoneyRow = [MoneyRow 3];
           NameRow = [NameRow "Nova"];
           TerritoryMatrixRow = [TerritoryMatrixRow 2];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           case 12
           MoneyRow = [MoneyRow 3];
           NameRow = [NameRow "Moaethai"];
           TerritoryMatrixRow = [TerritoryMatrixRow 3];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           case 13
           MoneyRow = [MoneyRow 3];
           NameRow = [NameRow "Bockmanopolis"];
           TerritoryMatrixRow = [TerritoryMatrixRow 4];
           OccupyMatrixRow = [OccupyMatrixRow, 0];
           otherwise
           MoneyRow = [MoneyRow NaN];
           NameRow = [NameRow string()];
           TerritoryMatrixRow = [TerritoryMatrixRow NaN];
           OccupyMatrixRow = [OccupyMatrixRow, NaN];
       end   
    end
    MoneyMatrix = [MoneyMatrix; MoneyRow ];
    NameMatrix = [NameMatrix; NameRow];
    TerritoryMatrix = [TerritoryMatrix; TerritoryMatrixRow];
    OccupyMatrix = [OccupyMatrix; OccupyMatrixRow];
  end
end