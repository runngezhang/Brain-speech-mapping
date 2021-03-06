function [y,h] = filter_mp(x,Wn,Ovrlp)
if nargin == 2
    Ovrlp = 1;
    %Ovrlp = 0.0084;
end
a = .3;
b = -.2;%.001;


if length(Wn) == 1
    h  = fdesign.lowpass('Fp,Fst,Ap,Ast', Wn*(1 - Ovrlp*a), Wn *(1 + Ovrlp*b), 1, 60);
else
    
    h  = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', ...
        Wn(1) *(1 - Ovrlp*a), Wn(1)*(1 + Ovrlp*b), min(Wn(2)*(1 - Ovrlp*b),.9),min(Wn(2) *(1 + Ovrlp*a),1) ,60,1,60);
 
% h  = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', ...
 %       Wn(1) - Ovrlp*a, Wn(1) + Ovrlp*b, Wn(2) - Ovrlp*b,Wn(2)  + Ovrlp*a ,60,1,60);

end

Hd = design(h, 'butter');
h = freqz(Hd);
y = filter (Hd, x);