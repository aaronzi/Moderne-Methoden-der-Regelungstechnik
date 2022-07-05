
%--------------------------------------------------------------------------------
% func_criteria_Statefeedback_design_exp_dynamic                5.7.2021
%--------------------------------------------------------------------------------
% Matlab function for solving a LMI design problem for state feedback controller
% design with guaranteed exponental closed loop dynamics
%--------------------------------------------------------------------------------
function [L, LMIsys] = LMI_Berechnung_L(A,C,alpha)


%-------------------------------------------------------------
% 1. Initialize the creation of a system of LMIs
%-------------------------------------------------------------
setlmis([]);


%-------------------------------------------------------------
% 2. Specify LMI variables: X and M
%-------------------------------------------------------------
varType_symBlock        = 1;  % symmetric block diagonal
varType_fullRectangular = 2;  % full rectangular

[n,~]=size(A);
[~,m]=size(C);


P = lmivar(varType_symBlock,[n 1]);         % specify variable P as square symmetric (n,n) matrix 
N = lmivar(varType_fullRectangular,[m n]);  % specify variable N as full rectangular (m,n)
                      

%-------------------------------------------------------------
% 3. Specify all LMI terms lmiterm(TERMID,A',C',FLAG)   L(Z) < R(Z)
%-------------------------------------------------------------
% with TERMID(1) = +n  ->  left-hand side of the n-th L
%      TERMID(1) = -n  ->  right-hand side of the n-th LMI
%-------------------------------------------------------------
%   A'P + PA - NC - C'N' + 2 alpha P < 0
%   P > 0
%-------------------------------------------------------------
lmiterm([1 1 1 P],1,A,'s');
lmiterm([1 1 1 P],2*alpha,1);
lmiterm([1 1 1 N],1,-C,'s');      
lmiterm([-2 1 1 P],1,1);         % P > 0
%------------------------------------------------------------- 


%-------------------------------------------------------------
% 4. Solve LMI problem
%-------------------------------------------------------------

LMIsys = getlmis;                % Declare the whole LMI problem

[tmin,xfeas] = feasp(LMIsys);    % Solve the LMI problem
% disp(tmin);
 
P_sol = dec2mat(LMIsys,xfeas,P);  % Get solution as the numerical value of X
N_sol = dec2mat(LMIsys,xfeas,N);  % Get solution as the numerical value of M

L = N_sol * inv(P_sol);