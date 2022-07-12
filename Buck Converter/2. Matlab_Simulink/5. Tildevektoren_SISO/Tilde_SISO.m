% EINGABEN
% A           Systemmatrix
% B           Eingangsmatrix  
% C           Ausgangsmatrix  
% sP          Wunschpolstellen

% AUSGABEN
% k_Tilde     Faktoren k

function [k_Tilde, A_Tilde, B_Tilde] = Tilde_SISO(A, B, C, sP)
    % A_Tilde_Vektor
    A_Tilde = A;
    A_Tilde = horzcat(A_Tilde, zeros(size(A,1),1));
    A_Tilde = vertcat(A_Tilde, [-C 0]);
    
    % B_Tilde_Vektor
    B_Tilde = [B; 0];

    % k_Tilde_Vektor
    k_Tilde = Ackermann(A_Tilde, B_Tilde, sP);
end