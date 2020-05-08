function [Border, SideNumbersMatrix, BorderTile] = BodersFunction(x)
%This creates the letters / numbers along the borders of the map and is
%only a function to save space
x=2;
BorderTile=ones(16,16);
BorderTile1=ones(16,16);

BorderTile2 = ones(16,16);
BorderTile2(8:11,7) = zeros;
BorderTile2(8:11,9) = zeros;
BorderTile2(7,8) = zeros;
BorderTile2(9,8) = zeros;
BorderTile2(7:11,15) = zeros;
BorderTile2(7:2:11,16) = zeros;

BorderTile3 = ones(16,16);
BorderTile3(8,1) = zeros;
BorderTile3(10,1) = zeros;
BorderTile3(8:10,7) = zeros;
BorderTile3(7:4:11,8) = zeros;
BorderTile3(7:4:11,9) = zeros;
BorderTile3(7:11,15) = zeros;
BorderTile3(7:4:11,16) = zeros;

BorderTile4 = ones(16,16);
BorderTile4(8:10,1) = zeros;
BorderTile4(7:11,7) = zeros;
BorderTile4(7:2:11,8:9) = zeros;
BorderTile4(7:11,15) = zeros;
BorderTile4(7:2:9,16) = zeros;

BorderTile5 = ones(16,16);
BorderTile5(7:2:9,1) = zeros;
BorderTile5(8:10,7) = zeros;
BorderTile5(7:2:11,8) = zeros;
BorderTile5(7,9) = zeros;
BorderTile5(9:11,9) = zeros;
BorderTile5(7:11,15) = zeros;
BorderTile5(9,16) = zeros;

BorderTile6 = ones(16,16);
BorderTile6(7:11,1) = zeros;
BorderTile6(7:4:11,7) = zeros;
BorderTile6(7:4:11,9) = zeros;
BorderTile6(7:11,8) = zeros;
BorderTile6(10,15) = zeros;
BorderTile6(11,16) = zeros;

BorderTile7 = ones(16,16);
BorderTile7(7:10,1) = zeros;
BorderTile7(7:11,7)= zeros;
BorderTile7(9,8)= zeros;
BorderTile7(7:8,9)= zeros;
BorderTile7(10:11,9)= zeros;
BorderTile7(7:11,15)= zeros;
BorderTile7(11,16)= zeros;

BorderTile8 = ones(16,16);
BorderTile8(11,1) = zeros;
BorderTile8(7:11,7:2:9) = zeros;
BorderTile8(8,8) = zeros;
BorderTile8(7:11,15) = zeros;
BorderTile8(8:10,16) = zeros;

BorderTile9 = ones(16,16);
BorderTile9(7:11,1) = zeros;
BorderTile9(8:10,7:2:9) = zeros;
BorderTile9(7:4:11,8) = zeros;
BorderTile9(7:11,15) = zeros;
BorderTile9(7:2:9,16) = zeros;

BorderTile10 = ones(16,16);
BorderTile10(8,1) = zeros;
BorderTile10(8:10,7) = zeros;
BorderTile10(7:3:10,8) = zeros;
BorderTile10(11,8) = zeros;
BorderTile10(8:11,9) = zeros;
BorderTile10(7:11,15) = zeros;
BorderTile10(7:2:9,16) = zeros;


BorderTile11 = ones(16,16);
BorderTile11(8:9,1) = zeros;
BorderTile11(10:11,1) = zeros;
BorderTile11(8:3:11,7) = zeros;
BorderTile11(7:2:11,8) = zeros;
BorderTile11(7:3:10,9) = zeros;
BorderTile11(7,15) = zeros;
BorderTile11(7:11,16) = zeros;


BorderTile12 = ones(16,16);
BorderTile12(7,1) = zeros;
BorderTile12(7:10,7) = zeros;
BorderTile12(11,8) = zeros;
BorderTile12(7:11,9) = zeros;
BorderTile12(7:10,15) = zeros;
BorderTile12(10:11,16) = zeros;

BorderTile13 = ones(16,16);
BorderTile13(7:9,1) = zeros;
BorderTile13(7:11,7:2:9) = zeros;
BorderTile13(9:10,8) = zeros;
Border=[BorderTile1 BorderTile2 BorderTile3 BorderTile4 BorderTile5 BorderTile6 BorderTile7 BorderTile8 BorderTile9 BorderTile10 BorderTile11 BorderTile12 BorderTile13 BorderTile1 ];

NumTile1 = ones(16,16);
NumTile1(7:11,9) = zeros;
NumTile1(11,8:2:10) = zeros;   %One
NumTile1(8,8) = zeros;
NumTile1(15,8:9) = zeros;
NumTile1(16,10) = zeros;

NumTile2 = ones(16,16);
NumTile2(1,9) = zeros;
NumTile2(2,8) = zeros;
NumTile2(3,8:10) = zeros;
NumTile2(7:4:11,8) = zeros;    %three
NumTile2(7:2:11,9) = zeros;
NumTile2(8:2:10,10) = zeros;
NumTile2(15:16,8:2:10) = zeros;

NumTile3 = ones(16,16);
NumTile3(1,8:10) = zeros;
NumTile3(2:3,10) = zeros;
NumTile3(7:2:11,8:9) = zeros;    %five
NumTile3(8,8) = zeros;
NumTile3(7:3:10,10) = zeros;
NumTile3(16,8) = zeros;
NumTile3(15,9:10) = zeros;

NumTile4 = ones(16,16);
NumTile4(1:2:3,8:10) = zeros;
NumTile4(2,8:2:10) = zeros;
NumTile4(7,8:10) = zeros;
NumTile4(8,10) = zeros;
NumTile4(9,9) = zeros;             %Seven
NumTile4(10:11,8) = zeros;
NumTile4(15,8:10) = zeros;
NumTile4(16,8:2:10) = zeros;

NumTile5 = ones(16,16);
NumTile5(1:2:3,8:10) = zeros;
NumTile5(2,8:2:10) = zeros;
NumTile5(7:2:9,8:10) = zeros;
NumTile5(8,8:2:10) = zeros;
NumTile5(10,10) = zeros;           %Nine
NumTile5(11,8:9) = zeros;      
NumTile5(15,5) = zeros;
NumTile5(16,4:5) = zeros;
NumTile5(15,9:10) = zeros;
NumTile5(16,8:2:10) = zeros;


NumTile6 = ones(16,16);
NumTile6(1:3,5) = zeros; 
NumTile6(3,4:2:6) = zeros;
NumTile6(7:11,9) = zeros;
NumTile6(11,8:2:10) = zeros; 
NumTile6(1:2,8:2:10) = zeros;
NumTile6(3,8:9) = zeros;         %eleven
NumTile6(8,8) = zeros;
NumTile6(7:11,5) = zeros;
NumTile6(11,4:2:6) = zeros;   
NumTile6(8,4) = zeros;
NumTile6(15,5) = zeros;
NumTile6(16,4:5) = zeros;
NumTile6(15,8:9) = zeros;
NumTile6(16,10) = zeros;

NumTile7 = ones(16,16);
NumTile7(1:3,5) = zeros; 
NumTile7(3,4:2:6) = zeros;
NumTile7(1,9) = zeros; 
NumTile7(2,8) = zeros; 
NumTile7(3,8:10) = zeros; 
NumTile7(7:11,5) = zeros;
NumTile7(11,4:2:6) = zeros;    %thirteen
NumTile7(8,4) = zeros;
NumTile7(7:4:11,8) = zeros;    
NumTile7(7:2:11,9) = zeros;
NumTile7(8:2:10,10) = zeros;
NumTile7(15,5) = zeros;
NumTile7(16,4:5) = zeros;
NumTile7(15:16,8:2:10) = zeros;

NumTile8 = ones(16,16);
NumTile8(1:3,5) = zeros; 
NumTile8(3,4:2:6) = zeros;
NumTile8(1,8:10) = zeros;
NumTile8(2:3,10) = zeros;
NumTile8(7:2:11,8:9) = zeros;    
NumTile8(8,8) = zeros;            %fifteen
NumTile8(7:3:10,10) = zeros;
NumTile8(16,8) = zeros;
NumTile8(15,9:10) = zeros;
NumTile8(7:11,5) = zeros;
NumTile8(11,4:2:6) = zeros;   
NumTile8(8,4) = zeros;
NumTile8(15,5) = zeros;
NumTile8(16,4:5) = zeros;

NumTile9 = ones(16,16);
NumTile9(1:3,5) = zeros; 
NumTile9(3,4:2:6) = zeros;
NumTile9(1:2:3,8:10) = zeros;
NumTile9(2,8:2:10) = zeros;
NumTile9(7,8:10) = zeros;
NumTile9(8,10) = zeros;             %Seventeen
NumTile9(9,9) = zeros;             
NumTile9(10:11,8) = zeros;
NumTile9(15,8:10) = zeros;
NumTile9(16,8:2:10) = zeros;
NumTile9(7:11,5) = zeros;
NumTile9(11,4:2:6) = zeros;   
NumTile9(8,4) = zeros;
NumTile9(15,5) = zeros;
NumTile9(16,4:5) = zeros;

NumTile10 = ones(16,16);
NumTile10(1:3,5) = zeros; 
NumTile10(3,4:2:6) = zeros;
NumTile10(1:2:3,8:10) = zeros;
NumTile10(2,8:2:10) = zeros;
NumTile10(7:11,5) = zeros;
NumTile10(11,4:2:6) = zeros;   
NumTile10(8,4) = zeros;
NumTile10(7:2:9,8:10) = zeros;
NumTile10(8,8:2:10) = zeros;
NumTile10(10,10) = zeros;           
NumTile10(11,8:9) = zeros;
NumTile10(15,9:10) = zeros;
NumTile10(16,8:2:10) = zeros;
NumTile10(15,4:5) = zeros;
NumTile10(16,6) = zeros;

NumTile11 = ones(16,16);
NumTile11(1,5) = zeros;
NumTile11(2,4) = zeros;
NumTile11(3,4:6) = zeros;
NumTile11(1:2,8:2:10) = zeros;
NumTile11(3,8:9) = zeros;
NumTile11(7:3:10,4) = zeros;
NumTile11(7:2:9,5) = zeros;         %Two
NumTile11(8,6) = zeros;
NumTile11(11,4:6) = zeros;
NumTile11(7:11,9) = zeros;
NumTile11(11,8:2:10) = zeros;   
NumTile11(8,8) = zeros;
NumTile11(15,4:5) = zeros;
NumTile11(16,6) = zeros;
NumTile11(15,8:9) = zeros;
NumTile11(16,10) = zeros;

NumTile12 = ones(16,16);
NumTile12(1,5) = zeros;
NumTile12(2,4) = zeros;
NumTile12(3,4:6) = zeros;
NumTile12(1,9) = zeros; 
NumTile12(2,8) = zeros;
NumTile12(3,8:10) = zeros;
NumTile12(7:3:10,4) = zeros;
NumTile12(7:2:9,5) = zeros;         
NumTile12(8,6) = zeros;
NumTile12(11,4:6) = zeros;
NumTile12(7:4:11,8) = zeros;    
NumTile12(7:2:11,9) = zeros;
NumTile12(8:2:10,10) = zeros;
NumTile12(15,4:5) = zeros;
NumTile12(16,6) = zeros;
NumTile12(15:16,8:2:10) = zeros;

NumTile13 = ones(16,16);
NumTile13(1,5) = zeros;
NumTile13(2,4) = zeros;
NumTile13(3,4:6) = zeros;
NumTile13(1,8:10) = zeros;
NumTile13(2:3,10) = zeros;
NumTile13(7:3:10,4) = zeros;
NumTile13(7:2:9,5) = zeros;         
NumTile13(8,6) = zeros;
NumTile13(11,4:6) = zeros;
NumTile13(7:2:11,8:9) = zeros;    
NumTile13(8,8) = zeros;
NumTile13(7:3:10,10) = zeros;
NumTile13(15,4:5) = zeros;
NumTile13(16,6) = zeros;
NumTile13(16,8) = zeros;
NumTile13(15,9:10) = zeros;

NumTile14 = ones(16,16);
NumTile14(1,5) = zeros;
NumTile14(2,4) = zeros;
NumTile14(3,4:6) = zeros;
NumTile14(1:2:3,8:10) = zeros;
NumTile14(2,8:2:10) = zeros;
NumTile14(7,8:10) = zeros;
NumTile14(8,10) = zeros;
NumTile14(9,9) = zeros;            
NumTile14(10:11,8) = zeros;
NumTile14(15,8:10) = zeros;
NumTile14(16,8:2:10) = zeros;
NumTile14(7:3:10,4) = zeros;
NumTile14(7:2:9,5) = zeros;         
NumTile14(8,6) = zeros;
NumTile14(11,4:6) = zeros;
NumTile14(15,4:5) = zeros;
NumTile14(16,6) = zeros;

NumTile15 = ones(16,16);
NumTile15(1,5) = zeros;
NumTile15(2,4) = zeros;
NumTile15(3,4:6) = zeros;
NumTile15(1:2:3,8:10) = zeros;
NumTile15(2,8:2:10) = zeros;
NumTile15(7:2:9,8:10) = zeros;
NumTile15(8,8:2:10) = zeros;
NumTile15(10,10) = zeros;           
NumTile15(11,8:9) = zeros;      
NumTile15(7:3:10,4) = zeros;
NumTile15(7:2:9,5) = zeros;         
NumTile15(8,6) = zeros;
NumTile15(11,4:6) = zeros;

SideNumbersMatrix = [BorderTile1; NumTile1; NumTile2; NumTile3; NumTile4; NumTile5; NumTile6; NumTile7; NumTile8; NumTile9; NumTile10; NumTile11; NumTile12; NumTile13; NumTile14; NumTile15; BorderTile1];
end