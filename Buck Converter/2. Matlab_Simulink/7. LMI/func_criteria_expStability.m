%--------------------------------------------------------------------------------
% func_criteria_expStability                                   14.6.2020
%--------------------------------------------------------------------------------
% Matlab function for solving a LMI for exponential stability of closed
% loop state feedback controlled systems
%--------------------------------------------------------------------------------
function Psol = func_criteria_expStability(A,alpha)

%-------------------------------------------------------------
% 1. Beginning of a LMI program
%-------------------------------------------------------------
setlmis([]);


%-------------------------------------------------------------
% 2. Define all LMI variables
%-------------------------------------------------------------
varType = 1;   % symmetric block diagonal
[n,~]=size(A);
P = lmivar(varType,[n 1]);  % specify variable P as square symmetric (n,n) matrix 
                      
   
%-------------------------------------------------------------
% 3. Define all LMI terms lmiterm(TERMID,A,B,FLAG)   L(Z) < R(Z)
%-------------------------------------------------------------
% with TERMID(1) = +n  ->  left-hand side of the n-th L
%      TERMID(1) = -n  ->  right-hand side of the n-th LMI
%lmiterm([-1 1 1 P],-1,1);         % LMI constraint -P < 0 <=> P > 0
%%lmiterm([ 1 1 1 P], 1,1);        % LMI constraint P > 0

%lmiterm([1 1 1 P],A',1,'s');      % A'P + PA  < 0 
%lmiterm([1 1 2 0],1);            % 0
%lmiterm([1 2 2 P],-1,1);         % P > 0

lmiterm([1 1 1 P],1,A,'s');      % A'P + PA  + 2 alpha P < 0 
lmiterm([1 1 1 P],2*alpha,1)
lmiterm([-2 1 1 P],1,1);         % P > 0
%------------------------------------------------------------- 


%-------------------------------------------------------------
% 4. Solve LMI problem
%-------------------------------------------------------------

LMISYS = getlmis;                % Declare the whole LMI problem
[tmin,xfeas] = feasp(LMISYS);    % Solve the LMI problem
disp(tmin)

Psol = dec2mat(LMISYS,xfeas,P);  % Get the numerical value of P


%lmiinfo(LMISYS)





