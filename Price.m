function [UnitPrice] = Price (x)
%How much each unit is worth (For the Ai's brain)
switch x
    case 'S'
        UnitPrice = 12;
    case 'C'
        UnitPrice = 50;
    case 'T'
        UnitPrice = 100;
    otherwise
        fprintf('code error zac!');
end

end