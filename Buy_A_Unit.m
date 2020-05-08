function [Unit, Num_Units, National_Wealth, map_coloured,OccupyMatrix] = Buy_A_Unit (Buy,Ter_Row,Ter_Col,PositionMatrix,map_coloured,Num_Units,National_Wealth, OccupyMatrix, nation)
%Used when purchasing a unit
Unit_name = "Unit" + num2str(Num_Units);        
  switch Buy
      case 'S'
          %Costs 12   
          if National_Wealth < 12 
              fprintf('\nInvalid Ammount\n');
              Num_Units = Num_Units;
              Unit = [];
              National_Wealth = National_Wealth;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          elseif OccupyMatrix(Ter_Row,Ter_Col) == nation
              fprintf('\nInvalid as tile occupied.\n');
              Num_Units = Num_Units;
              Unit = [];
              National_Wealth = National_Wealth;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;  
          else
            Unit = ["Soldier","100", PositionMatrix(Ter_Row,Ter_Col),"3",Unit_name]; 
            Num_Units = Num_Units + 1;
            National_Wealth = National_Wealth - 12;
            if mod(Ter_Row,2)==0
                map_coloured((29 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((23 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(26 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            else
                map_coloured((37 + 16*(Ter_Row - ((Ter_Row/2)+1))),((31 + 16*(Ter_Col - ((Ter_Col/2)+1))):(34 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            end
            fprintf('\nSoldier Purchased in %s.\nNew Balance:%0.3f\n',PositionMatrix(Ter_Row,Ter_Col),National_Wealth)
            OccupyMatrix(Ter_Row,Ter_Col) = nation;
          end
      case 'C'
          %Costs 50
          if National_Wealth < 50
              fprintf('\nInvalid Ammount\n');
              Num_Units = Num_Units;
              Unit = [];
              National_Wealth = National_Wealth;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          elseif OccupyMatrix(Ter_Row,Ter_Col) == nation
              fprintf('\nInvalid as tile occupied.\n');
              Num_Units = Num_Units;
              Unit = [];
              National_Wealth = National_Wealth;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;  
          else
            Unit = ["Cannon","75", PositionMatrix(Ter_Row,Ter_Col),"2",Unit_name]; 
            Num_Units = Num_Units + 1;
            National_Wealth = National_Wealth - 50;
            if mod(Ter_Row,2)==0
                map_coloured((29 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((23 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(26 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            else
                map_coloured((37 + 16*(Ter_Row - ((Ter_Row/2)+1))),((31 + 16*(Ter_Col - ((Ter_Col/2)+1))):(34 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            end
            fprintf('\nCannon Purchased in %s.\nNew Balance:%0.3f\n',PositionMatrix(Ter_Row,Ter_Col),National_Wealth)
            OccupyMatrix(Ter_Row,Ter_Col) = nation;
          end
      case 'T'
          %Costs 100
          if National_Wealth < 100
              fprintf('\nInvalid Ammount\n');
              Num_Units = Num_Units;
              Unit = [];
              National_Wealth = National_Wealth;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;
          elseif OccupyMatrix(Ter_Row,Ter_Col) == nation
              fprintf('\nInvalid as tile occupied.\n');
              Num_Units = Num_Units;
              Unit = [];
              National_Wealth = National_Wealth;
              map_coloured = map_coloured;
              OccupyMatrix = OccupyMatrix;  
          else
            Unit = ["Tank","200", PositionMatrix(Ter_Row,Ter_Col),"2", Unit_name]; 
            Num_Units = Num_Units + 1; 
            National_Wealth = National_Wealth - 100;
            if mod(Ter_Row,2)==0
                map_coloured((29 + 16*(Ter_Row - ((Ter_Row/2)+0.5))),((23 + 16*(Ter_Col - ((Ter_Col/2)+0.5))):(26 + 16*(Ter_Col - ((Ter_Col/2)+0.5)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            else
                map_coloured((37 + 16*(Ter_Row - ((Ter_Row/2)+1))),((31 + 16*(Ter_Col - ((Ter_Col/2)+1))):(34 + 16*(Ter_Col - ((Ter_Col/2)+1)))),:)= [0.06666666667,1,0;0.06666666667,1,0; 0.06666666667,1,0;0.06666666667,1,0];
            end
            fprintf('\nTank Purchasedin %s.\nNew Balance:%0.3f\n',PositionMatrix(Ter_Row,Ter_Col),National_Wealth)
            OccupyMatrix(Ter_Row,Ter_Col) = nation;
          end
  end
end