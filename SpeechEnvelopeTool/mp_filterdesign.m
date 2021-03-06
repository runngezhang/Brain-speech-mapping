 x = rand(1,44100);
 h  = fdesign.lowpass('Fp,Fst,Ap,Ast', .01, .0125, 1, 60);
 Hd = design(h, 'butter');

h  = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', .075, .1, .2, .225,60,1,60);
 Hd = design(h, 'butter');

 y = filter (Hd, x);
 %Hd = design(h, 'butter', 'MatchExactly', 'passband');
 %Hd(2) = design(h, 'butter', 'MatchExactly', 'stopband');
 %fvtool(Hd);
 %axis([.01 .11 -2 0]);
%{
d = fdesign.lowpass;
%set(d,'specification')
set(d,'specification','Fp,Fst,Ap,Ast')
% designmethods(d)
Hd=design(d,'butter');
%}
 
%{
d = fdesign.lowpass; % step 1 - choose the response
% set (d, 'specification')
set(d,'N,Fc');
%{
ans = 

    'Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2'
    'N,F3dB1,F3dB2'
    'N,F3dB1,F3dB2,Ap'
    'N,F3dB1,F3dB2,Ast'
    'N,F3dB1,F3dB2,Ast1,Ap,Ast2'
    'N,F3dB1,F3dB2,BWp'
    'N,F3dB1,F3dB2,BWst'
    'N,Fc1,Fc2'
    'N,Fp1,Fp2,Ap'
    'N,Fp1,Fp2,Ast1,Ap,Ast2'
    'N,Fst1,Fp1,Fp2,Fst2'
    'N,Fst1,Fp1,Fp2,Fst2,Ap'
    'N,Fst1,Fst2,Ast'
    'Nb,Na,Fst1,Fp1,Fp2,Fst2'
%}
d=fdesign.arbmag; 
set(d,'specification')
%{
ans = 

    'N,F,A'
    'N,B,F,A'

The set command can be used to select one of the available specifications as follows:
%}
 d = fdesign.lowpass; % step 1
% step 2: get a list of available specifications
set (d, 'specification') 
%{
ans = 

    'Fp,Fst,Ap,Ast'
    'N,F3dB'
    'N,F3dB,Ap'
    'N,F3dB,Ap,Ast'
    'N,F3dB,Ast'
    'N,F3dB,Fst'
    'N,Fc'
    'N,Fc,Ap,Ast'
    'N,Fp,Ap'
    'N,Fp,Ap,Ast'
    'N,Fp,F3dB'
    'N,Fp,Fst'
    'N,Fp,Fst,Ap'
    'N,Fp,Fst,Ast'
    'N,Fst,Ap,Ast'
    'N,Fst,Ast'
    'Nb,Na,Fp,Fst'
%}
 %step 2: set the required specification
set (d, 'specification', 'N,Fc') 

%If you do not perform this step explicitly, fdesign returns the default specification for the response you chose in Select a Response, and provides default values for all design parameters included in the specification.

%step 2: set the required specification
set (d, 'specification', 'N,Fc') 
designmethods (d) %step3: get available algorithms



set (d, 'specification', 'Fp,Fst,Ap,Ast')
designmethods(d)

set(d,'specification','Fp,Fst,Ap,Ast')
designmethods(d)


Hd=design(d,'butter');


help (d, 'algorithm-name')

% design filter w/o specifying the algorithm
Hd = design(d);

Hd = design(d, 'butter');

%help fdesign/design

Hd = design(d, 'butter', 'filterstructure', 'df2sos')
 
%help dfilt/analysis

%help mfilt/functions

% help farrow/functions


y = filter (FilterObj, x)

%}