function [Ai_buying] = Ai_buy_fun_updated ()
%This is the order the Ai will buy units the whole game (Updated)
Ai_buying = ['S'];
for i = 1:400
   GrabRandomNumber = round(rand()*7+1);
   switch (GrabRandomNumber)
       case {1,2,3,4}
           Ai_buying = [Ai_buying, 'S'];
       case {5,6}
           Ai_buying = [Ai_buying, 'C'];
       case {8,7}
           Ai_buying = [Ai_buying, 'T'];
   end   
end
end