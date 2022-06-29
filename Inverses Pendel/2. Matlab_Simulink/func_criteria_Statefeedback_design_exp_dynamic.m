
%--------------------------------------------------------------------------------
% func_criteria_Statefeedback_design_exp_dynamic                5.7.2021
%--------------------------------------------------------------------------------
% Matlab function for solving a LMI design problem for state feedback controller
% design with guaranteed exponental closed loop dynamics
%--------------------------------------------------------------------------------
function [K, LMIsys] = func_criteria_Statefeedback_design_exp_dynamic(A,B,alpha)


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
[~,m]=size(B);


X = lmivar(varType_symBlock,[n 1]);         % specify variable X as square symmetric (n,n) matrix 
M = lmivar(varType_fullRectangular,[m n]);  % specify variable M as full rectangular (m,n)
                      

%-------------------------------------------------------------
% 3. Specify all LMI terms lmiterm(TERMID,A,B,FLAG)   L(Z) < R(Z)
%-------------------------------------------------------------
% with TERMID(1) = +n  ->  left-hand side of the n-th L
%      TERMID(1) = -n  ->  right-hand side of the n-th LMI
%-------------------------------------------------------------
%   X A' + A X  - M'B' - BM + 2 alpha X < 0
%   X > 0 
%-------------------------------------------------------------
lmiterm([1 1 1 X],A,1,'s');      
lmiterm([1 1 1 X],2*alpha,1);
lmiterm([1 1 1 M],-B,1,'s');      
lmiterm([-2 1 1 X],1,1);         % X > 0
%------------------------------------------------------------- 


%-------------------------------------------------------------
% 4. Solve LMI problem
%-------------------------------------------------------------

LMIsys = getlmis;                % Declare the whole LMI problem
[tmin,xfeas] = feasp(LMIsys);    % Solve the LMI problem
disp(tmin)
 
X_sol = dec2mat(LMIsys,xfeas,X);  % Get solution as the numerical value of X
M_sol = dec2mat(LMIsys,xfeas,M);  % Get solution as the numerical value of M

K = M_sol * inv(X_sol);




