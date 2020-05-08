function [Movement, Ai_MilitaryMatrix1] = Ai_Logic (NameMatrix, Ai_Player1, Ai_MilitaryMatrix1, TerritoryMatrix, MilitaryMatrix, OccupyMatrix, i, MoneyMatrix )
%The brain of the ai, lord help me
%It checks which tiles it can move it based on its postion and then tiles
%that are occupied cannot be moved to and tiles that are already the ai's
%territory are a low priority. The letter with the highest associated value
%is the one that the ai chooses.
Q = 1;
W = 1;
E = 1;
A = 1;
D = 1;
Z = 1;
X = 1;
C = 1;
S = 0;
row = str2num(Ai_MilitaryMatrix1(i, 5));
col = str2num(Ai_MilitaryMatrix1(i, 6));
corners = 0;
borders = 0;
if true(row == 1 && col == 1)
    Q = NaN;
    W = NaN;
    E = NaN;
    A = NaN;
    Z = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row),(col+2)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
    WhichTile = ['d', 'x', 'c'];
    if TerritoryMatrix((row),(col+2)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row+2),(col)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if OccupyMatrix((row),(col+2)) == Ai_Player1
        tileWorth(1) = NaN;
        D = NaN;
    elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
        D = D + 2;
    end
    if OccupyMatrix((row+2),(col)) == Ai_Player1
        tileWorth(2) = NaN;
        X = NaN;
    elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
        X = X + 2;
    end
    if OccupyMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(3) = NaN;
        C = NaN;
    elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
    end
elseif true(row == 1 && col == 23)
    Q = NaN;
    W = NaN;
    E = NaN;
    D = NaN;
    C = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row),(col-2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col))]; 
    WhichTile = ['a', 'z', 'x'];
    if TerritoryMatrix((row),(col-2)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row+2),(col)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if OccupyMatrix((row),(col-2)) == Ai_Player1
        tileWorth(1) = NaN;
        A = NaN; 
    elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
    end
    if OccupyMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(2) = NaN;
        Z = NaN;
    elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
    end 
    if OccupyMatrix((row+2),(col)) == Ai_Player1
        tileWorth(3) = NaN;
        X = NaN;
    elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
    end
elseif true(row == 29 && col == 1)
    Z = NaN;
    X = NaN;
    C = NaN;
    A = NaN;
    Q = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col+2))]; 
    WhichTile = ['w', 'e', 'd'];
    if TerritoryMatrix((row-2),(col)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row),(col+2)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if OccupyMatrix((row-2),(col)) == Ai_Player1
        tileWorth(1) = NaN;
        W = NaN;
    elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
    end
    if OccupyMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(2) = NaN;
        E = NaN;
    elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
    end
    if OccupyMatrix((row),(col+2)) == Ai_Player1
        tileWorth(3) = NaN;
        D = NaN;
    elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
    end
elseif true(row == 29 && col == 23)
    Z = NaN;
    X = NaN;
    C = NaN;
    D = NaN;
    E = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)), MoneyMatrix((row),(col-2))]; 
    WhichTile = ['q', 'w', 'a'];
    if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row-2),(col)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row),(col-2)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if OccupyMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = NaN;
        Q = NaN;
    elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
    end
    if OccupyMatrix((row-2),(col)) == Ai_Player1
        tileWorth(2) = NaN;
        W = NaN;
    elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
    end
    if OccupyMatrix((row),(col-2)) == Ai_Player1
        tileWorth(3) = NaN;
        A = NaN;
    elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
    end
elseif true(row == 2 && col == 2)
    W = NaN;
    A = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))];
    WhichTile = ['q', 'e', 'd', 'z', 'x', 'c'];
    if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row),(col+2)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(4) = 0;
    end
    if TerritoryMatrix((row+2),(col)) == Ai_Player1
        tileWorth(5) = 0;
    end
    if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = 0;
    end
    if OccupyMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = NaN;
        Q = NaN;
    elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
    end
    if OccupyMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(2) = NaN;
        E = NaN;
    elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
    end
    if OccupyMatrix((row),(col+2)) == Ai_Player1
        tileWorth(3) = NaN;
        D = NaN;
    elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
    end
    if OccupyMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(4) = NaN;
        Z = NaN;
    elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
    end 
    if OccupyMatrix((row+2),(col)) == Ai_Player1
        tileWorth(5) = NaN;
        X = NaN;
    elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
    end
    if OccupyMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = NaN;
        C = NaN;
    elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
    end
elseif true(row == 2 && col == 22)
    W = NaN;
    D = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))];
    WhichTile = ['q', 'e', 'a', 'z', 'x', 'c'];
    if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row),(col-2)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(4) = 0;
    end
    if TerritoryMatrix((row+2),(col)) == Ai_Player1
        tileWorth(5) = 0;
    end
    if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = 0;
    end
    if OccupyMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = NaN;
        Q = NaN;
    elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
    end
    if OccupyMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(2) = NaN;
        E = NaN;
    elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
    end
    if OccupyMatrix((row),(col-2)) == Ai_Player1
        tileWorth(3) = NaN;
        A = NaN;
    elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
    end
    if OccupyMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(4) = NaN;
        Z = NaN;
    elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
    end
    if OccupyMatrix((row+2),(col)) == Ai_Player1
        tileWorth(5) = NaN;
        X = NaN;
    elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
    end
    if OccupyMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = NaN;
        C = NaN;
    elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
    end
elseif true(row == 28 && col == 2) 
    X = NaN;
    A = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)), MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+1),(col+1))];
    WhichTile = ['q', 'w', 'e', 'd', 'z', 'c'];
    if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row-2),(col)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if TerritoryMatrix((row),(col+2)) == Ai_Player1
        tileWorth(4) = 0;
    end
    if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(5) = 0;
    end
    if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = 0;
    end
    if OccupyMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = NaN;
        Q = NaN;
    elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
    end
    if OccupyMatrix((row-2),(col)) == Ai_Player1
        tileWorth(2) = NaN;
        W = NaN;
    elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
    end
    if OccupyMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(3) = NaN;
        E = NaN;
    elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
    end
    if OccupyMatrix((row),(col+2)) == Ai_Player1
        tileWorth(4) = NaN;
        D = NaN;
    elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
    end
    if OccupyMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(5) = NaN;
        Z = NaN;
    elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
    end
    if OccupyMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = NaN;
        C = NaN;
    elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
    end
elseif true(row == 28 && col == 22) 
    X = NaN;
    D = NaN;
    corners = 1;
    borders = 1;
    tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)), MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+1),(col+1))];
    WhichTile = ['q', 'w', 'e', 'a', 'z', 'c'];
    if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = 0;
    end
    if TerritoryMatrix((row-2),(col)) == Ai_Player1
        tileWorth(2) = 0;
    end
    if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(3) = 0;
    end
    if TerritoryMatrix((row),(col-2)) == Ai_Player1
        tileWorth(4) = 0;
    end
    if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(5) = 0;
    end
    if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = 0;
    end
    if OccupyMatrix((row-1),(col-1)) == Ai_Player1
        tileWorth(1) = NaN;
        Q = NaN;
    elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
    end
    if OccupyMatrix((row-2),(col)) == Ai_Player1
        tileWorth(2) = NaN;
        W = NaN;
    elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
    end
    if OccupyMatrix((row-1),(col+1)) == Ai_Player1
        tileWorth(3) = NaN;
        E = NaN;
    elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
    end
    if OccupyMatrix((row),(col-2)) == Ai_Player1
        tileWorth(4) = NaN;
        A = NaN;
    elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
    end
    if OccupyMatrix((row+1),(col-1)) == Ai_Player1
        tileWorth(5) = NaN;
        Z = NaN;
    elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
    end
    if OccupyMatrix((row+1),(col+1)) == Ai_Player1
        tileWorth(6) = NaN;
        C = NaN;
    elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
    end
end
if corners == 0
 switch (row)
    case {1}
        W = NaN;
        Q = NaN;
        E = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row),(col-2)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
        WhichTile = ['a', 'd', 'z', 'x', 'c'];
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(1) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(2) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(3) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end 
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(4) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(5) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end 
    case {29}
        X = NaN;
        Z = NaN;
        C = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row),(col+2))]; 
        WhichTile = ['q', 'w', 'e', 'a', 'd'];
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end 
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(5) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end
    case {2}
        W = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
        WhichTile = ['q', 'e', 'a', 'd', 'z', 'x', 'c'];
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(6) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(2) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(3) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end 
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(4) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(5) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end  
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(6) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end  
    case {28}
        X = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+1),(col+1))]; 
        WhichTile = ['q', 'w', 'e', 'a', 'd', 'z', 'c'];
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(6) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end 
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(5) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end 
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(6) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end 
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end  
 end
 switch (col)
    case 1
        A = NaN;
        Q = NaN;
        Z = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
        WhichTile = ['w', 'e', 'd', 'x', 'c'];
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(1) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(2) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(3) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end 
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(4) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(5) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end 
    case 23
        E = NaN;
        D = NaN;
        C = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)), MoneyMatrix((row),(col-2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col))]; 
        WhichTile = ['q', 'w', 'a', 'z', 'x'];
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(3) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end 
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(4) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end 
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(5) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
    case 2
        A = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
        WhichTile = ['q', 'w', 'e', 'd', 'z', 'x', 'c'];
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(6) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end 
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(4) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(5) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end  
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(6) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end 
    case 22
        D = NaN;
        borders = 1;
        tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
        WhichTile = ['q', 'w', 'e', 'a', 'z', 'x', 'c']; 
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(5) = 0;
        end 
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(6) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(5) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end  
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(6) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(7) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end  
 end
end
if borders == 0
   tileWorth = [MoneyMatrix((row-1),(col-1)), MoneyMatrix((row-2),(col)),MoneyMatrix((row-1),(col+1)), MoneyMatrix((row),(col-2)), MoneyMatrix((row),(col+2)), MoneyMatrix((row+1),(col-1)), MoneyMatrix((row+2),(col)), MoneyMatrix((row+1),(col+1))]; 
   WhichTile = ['q', 'w', 'e', 'a', 'd', 'z', 'x', 'c']; 
        if TerritoryMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = 0;
        end
        if TerritoryMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = 0;
        end
        if TerritoryMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = 0;
        end 
        if TerritoryMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = 0;
        end
        if TerritoryMatrix((row),(col+2)) == Ai_Player1
         tileWorth(5) = 0;
        end
        if TerritoryMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(6) = 0;
        end 
        if TerritoryMatrix((row+2),(col)) == Ai_Player1
         tileWorth(7) = 0;
        end
        if TerritoryMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(8) = 0;
        end 
        if OccupyMatrix((row-1),(col-1)) == Ai_Player1
         tileWorth(1) = NaN;
         Q = NaN;
        elseif true(OccupyMatrix((row-1),(col-1)) ~= 0 && OccupyMatrix((row-1),(col-1)) ~= Ai_Player1)
          Q = Q + 2;  
        end
        if OccupyMatrix((row-2),(col)) == Ai_Player1
         tileWorth(2) = NaN;
         W = NaN;
        elseif true(OccupyMatrix((row-2),(col)) ~= 0 && OccupyMatrix((row-2),(col)) ~= Ai_Player1)
          W = W + 2;  
        end
        if OccupyMatrix((row-1),(col+1)) == Ai_Player1
         tileWorth(3) = NaN;
         E = NaN;
        elseif true(OccupyMatrix((row-1),(col+1)) ~= 0 && OccupyMatrix((row-1),(col+1)) ~= Ai_Player1)
          E = E + 2;  
        end 
        if OccupyMatrix((row),(col-2)) == Ai_Player1
         tileWorth(4) = NaN;
         A = NaN;
        elseif true(OccupyMatrix((row),(col-2)) ~= 0 && OccupyMatrix((row),(col-2)) ~= Ai_Player1)
          A = A + 2;  
        end 
        if OccupyMatrix((row),(col+2)) == Ai_Player1
         tileWorth(5) = NaN;
         D = NaN;
        elseif true(OccupyMatrix((row),(col+2)) ~= 0 && OccupyMatrix((row),(col+2)) ~= Ai_Player1)
          D = D + 2;  
        end
        if OccupyMatrix((row+1),(col-1)) == Ai_Player1
         tileWorth(6) = NaN;
         Z = NaN;
        elseif true(OccupyMatrix((row+1),(col-1)) ~= 0 && OccupyMatrix((row+1),(col-1)) ~= Ai_Player1)
          Z = Z + 2;  
        end 
        if OccupyMatrix((row+2),(col)) == Ai_Player1
         tileWorth(7) = NaN;
         X = NaN;
        elseif true(OccupyMatrix((row+2),(col)) ~= 0 && OccupyMatrix((row+2),(col)) ~= Ai_Player1)
          X = X + 2;  
        end
        if OccupyMatrix((row+1),(col+1)) == Ai_Player1
         tileWorth(8) = NaN;
         C = NaN;
        elseif true(OccupyMatrix((row+1),(col+1)) ~= 0 && OccupyMatrix((row+1),(col+1)) ~= Ai_Player1)
          C = C + 2;  
        end
end
%Move to the tile with the most money on it
for m = 1:length(tileWorth)
   if tileWorth(m) == max(tileWorth) 
      switch (WhichTile(m))
          case 'a'
              A = A + 1;
          case 'w'
              W = W + 1;
          case 'e'
              E = E + 1;
          case 'q'
              Q = Q + 1;
          case 'd' 
              D = D + 1;
          case 'z'
              Z = Z + 1;
          case 'x'
              X = X + 1;
          case 'c' 
              C = C + 1;
      end
      break
   end
end
%When they get stuck at the top/ bottom
AddUp = 0;
for jeff = 1:length(tileWorth)
    if tileWorth(jeff) >= 0 
      AddUp = AddUp + tileWorth(jeff);  
    end
end
if AddUp == 0 
   switch (Ai_Player1)
       case 1
          if row == 28 || row ==29 
          else   
           if OccupyMatrix((row+2),(col)) == Ai_Player1  
           else
             if true(TerritoryMatrix(29,1) ~= Ai_Player1 && TerritoryMatrix(29,23) ~= Ai_Player1)   
             X = X + 1.1;
             else 
             end
           end
          end
       case 2
          if row == 28 || row ==29 
          else   
           if OccupyMatrix((row+2),(col)) == Ai_Player1  
           else
              if true(TerritoryMatrix(29,1) ~= Ai_Player1 && TerritoryMatrix(29,23) ~= Ai_Player1) 
             X = X + 1.1;
              else
              end
           end
          end
       case 3
           if row == 1 || row ==2 
            if col == 23 || col == 22  
            else
             if OccupyMatrix((row),(col+2)) == Ai_Player1
             else
                   if true(TerritoryMatrix(1,23) ~= Ai_Player1)
                 D = D + 1.1; 
                   else
                   end
             end 
            end
           else 
            if OccupyMatrix((row-2),(col)) == Ai_Player1  
            else
              if true(TerritoryMatrix(1,1) ~= Ai_Player1 && TerritoryMatrix(1,23) ~= Ai_Player1)
             W = W + 1.1;
              else
              end
            end
           end
       case 4
           if row == 1 || row ==2 
             if col == 23 || col == 22  
             else  
              if OccupyMatrix((row),(col+2)) == Ai_Player1
              else
                  if true(TerritoryMatrix(1,23) ~= Ai_Player1)
                 D = D + 1.1; 
                  else
                  end
              end
             end
           else 
            if OccupyMatrix((row-2),(col)) == Ai_Player1  
            else
                if true(TerritoryMatrix(1,1) ~= Ai_Player1 && TerritoryMatrix(1,23) ~= Ai_Player1)
                
             W = W + 1.1;
                else
                end
            end
           end
   end
end
Rand1or2 = round(rand*1)+1;
if TerritoryMatrix(1,1) ~= Ai_Player1
   switch (Rand1or2)
       case 1
           if row == 1 || row == 2 
           else
           W = W + 0.1;
           end
       case 2
           if col == 1 || col == 2 
           else
           A = A + 0.1;
           end
   end
elseif TerritoryMatrix(1,23) ~= Ai_Player1
    switch (Rand1or2)
       case 1
           if row == 1 || row == 2 
           else
           W = W + 0.1;
           end
       case 2
           if col == 23 || col == 22 
           else
           D = D + 0.1;
           end
    end
elseif TerritoryMatrix(29,1) ~= Ai_Player1
    switch (Rand1or2)
       case 1
           if row == 29 || row == 28 
           else
           X = X + 0.1;
           end
       case 2
           if col == 1 || col == 2 
           else
           A = A + 0.1;
           end
    end
elseif TerritoryMatrix(29,23) ~= Ai_Player1
    switch (Rand1or2)
       case 1
           if row == 29 || row == 28 
           else
           X = X + 0.1;
           end
       case 2
           if col == 23 || col == 22 
           else
           D = D + 0.1;
           end
    end
end
chooseAMove = [Q, W, E, A, D, Z, X, C, S];
for k = 1:length(chooseAMove)
    if chooseAMove(k) == max(chooseAMove)
        switch (k)
            case 1
                Movement = 'Q';
                row = row - 1;
                col = col - 1; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 2
                Movement = 'W';
                row = row - 2;
                col = col; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 3 
                Movement = 'E';
                row = row - 1;
                col = col + 1; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 4
                Movement = 'A';
                row = row;
                col = col - 2; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 5
                Movement = 'D';
                row = row ;
                col = col + 2; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 6
                Movement = 'Z';
                row = row + 1;
                col = col - 1; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 7
                Movement = 'X';
                row = row + 2;
                col = col; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 8
                Movement = 'C';
                row = row + 1;
                col = col + 1; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
            case 9
                Movement = 'S';
                row = row;
                col = col; 
                Ai_MilitaryMatrix1(i,5) = num2str(row);
                Ai_MilitaryMatrix1(i,6) = num2str(col);
                
        end
        break
    end
end
end