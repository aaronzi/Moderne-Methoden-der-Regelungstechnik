% EINGABEN
% x             symbolischer Spaltenvektor x
% Fa            symbolische Kraft
% xRuhe         Ruhelage als Zeilenvektor
% f1 - f4       Funktionhandle des nichtlinearisierten Zustandsraummodells

% AUSGABEN
% A             linearisierte Matrix A
% B             linearisierte Matrix B

function [A, B, C, D] = Lineares_Zustandsraummodell(x, Fa, xRuhe, f1, f2, f3, f4)

    % Linearisierung
    A = jacobian([f1(x, Fa); f2(x, Fa); f3(x, Fa); f4(x, Fa)], [x(1), x(2), x(3), x(4)]);
    A = double(subs(A, {x(1), x(2), x(3), x(4)}, {xRuhe(1), xRuhe(2), xRuhe(3), xRuhe(4)}));
    B = jacobian([f1(x, Fa); f2(x, Fa); f3(x, Fa); f4(x, Fa)], Fa);
    B = double(subs(B, {x(1), x(2), x(3), x(4)}, {xRuhe(1), xRuhe(2), xRuhe(3), xRuhe(4)}));
    C = [1 0 0 0];
    D = 0;
end