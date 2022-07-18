% EINGABEN
% A             Systemmatrix
% B             Eingangsmatrix  
% C             Ausgangsmatrix  

% AUSGABEN
% A_Tilde       Tildematrix A
% B_Tilde       Tildematrix B

function [A_Tilde, B_Tilde] = Tilde(A, B, C)
    % A_Tilde_Vektor
    A_Tilde = A;
    A_Tilde = horzcat(A_Tilde, zeros(size(A,1),1));
    A_Tilde = vertcat(A_Tilde, [-C 0]);
    
    % B_Tilde_Vektor
    B_Tilde = [B; 0];
end