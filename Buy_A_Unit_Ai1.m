function [Unit_Ai, Ai_National_Wealth1, map_coloured, OccupyMatrix] = Buy_A_Unit_Ai1 (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Ai_National_Wealth1, OccupyMatrix, Ai_Player1)
%Used when Ai purchasing a unit
Row = Ter_Row;
Col = Ter_Col;
  switch Buy
      case 'S'
          %Costs 12
          if Ai_National_Wealth1 < 12
              Unit_Ai = [];
              Ai_National_Wealth1 = Ai_National_Wealth1;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          elseif OccupyMatrix(Ter_Row,Ter_Col) == Ai_Player1
              Unit_Ai = [];
              Ai_National_Wealth1 = Ai_National_Wealth1;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          else
            Unit_Ai = ["Soldier","100", PositionMatrix(Ter_Row,Ter_Col),"3",Ter_Row,Ter_Col, Ai_Player1]; 
            Ai_National_Wealth1 = Ai_National_Wealth1 - 12;
            if mod(Ter_Row,2)==0
                map_coloured((29 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((23 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(26 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            else
                map_coloured((37 + 16*(Ter_Row - ((Ter_Row/2)+1))),((31 + 16*(Ter_Col - ((Ter_Col/2)+1))):(34 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            end
            OccupyMatrix(Ter_Row,Ter_Col) = Ai_Player1;
          end
      case 'C'
          %Costs 50
          if Ai_National_Wealth1 < 50
              fprintf('\nInvalid Ammount\n');
              Unit_Ai = [];
              Ai_National_Wealth1 = Ai_National_Wealth1;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          elseif OccupyMatrix(Ter_Row,Ter_Col) == Ai_Player1
              Unit_Ai = [];
              Ai_National_Wealth1 = Ai_National_Wealth1;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;    
          else
            Unit_Ai = ["Cannon","75", PositionMatrix(Ter_Row,Ter_Col),"2",Ter_Row,Ter_Col, Ai_Player1]; 
            Ai_National_Wealth1 = Ai_National_Wealth1 - 50;
            if mod(Ter_Row,2)==0
                map_coloured((29 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((23 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(26 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            else
                map_coloured((37 + 16*(Ter_Row - ((Ter_Row/2)+1))),((31 + 16*(Ter_Col - ((Ter_Col/2)+1))):(34 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            end
            OccupyMatrix(Ter_Row,Ter_Col) = Ai_Player1;
          end
      case 'T'
          %Costs 100
          if Ai_National_Wealth1 < 100
              fprintf('\nInvalid Ammount\n');
              Unit_Ai = [];
              Ai_National_Wealth1 = Ai_National_Wealth1;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          elseif OccupyMatrix(Ter_Row,Ter_Col) == Ai_Player1
              Unit_Ai = [];
              Ai_National_Wealth1 = Ai_National_Wealth1;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;    
          else
            Unit_Ai = ["Tank","200", PositionMatrix(Ter_Row,Ter_Col),"2",Ter_Row,Ter_Col, Ai_Player1]; 
            Ai_National_Wealth1 = Ai_National_Wealth1 - 100;
            if mod(Ter_Row,2)==0
                map_coloured((29 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((23 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(26 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            else
                map_coloured((37 + 16*(Ter_Row - ((Ter_Row/2)+1))),((31 + 16*(Ter_Col - ((Ter_Col/2)+1))):(34 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            end
            OccupyMatrix(Ter_Row,Ter_Col) = Ai_Player1;
          end
  end
end