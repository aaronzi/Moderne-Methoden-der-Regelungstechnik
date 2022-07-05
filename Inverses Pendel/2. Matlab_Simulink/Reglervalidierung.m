% addpath(genpath('./Reglervalidierung/')); % Befehl muss einmal am Anfang
% ausgeführt werden!
%% Ackermann (linear)
% Phi bei verschiedenen Anfangswinkeln
linear_ackermann_phi();

% xM bei verschiedenen Anfangswinkeln
linear_ackermann_xM();

% u bei verschiedenen Anfangswinkeln
linear_ackermann_u();


%% Vorsteuerung (linear)
% Phi bei verschiedenen Anfangswinkeln
linear_vorsteuerung_phi();

% xM bei verschiedenen Anfangswinkeln
linear_vorsteuerung_xM();

% u bei verschiedenen Anfangswinkeln
linear_vorsteuerung_u();


%% I-Regler (linear)
% Phi bei verschiedenen Anfangswinkeln
linear_i_regler_phi();

% xM bei verschiedenen Anfangswinkeln
linear_i_regler_xM();

% u bei verschiedenen Anfangswinkeln
linear_i_regler_u();


% ---------------------------------------------------------------------- %
% ---------------------------------------------------------------------- %


%% Ackermann (nicht-linear)
% Phi bei verschiedenen Anfangswinkeln
nichtlinear_ackermann_phi();

% xM bei verschiedenen Anfangswinkeln
nichtlinear_ackermann_xM();

% u bei verschiedenen Anfangswinkeln
nichtlinear_ackermann_u();


%% Vorsteuerung (nicht-linear)
% Phi bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_phi();

% xM bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_xM();

% u bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_u();


%% I-Regler (nicht-linear)
% Phi bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_phi();

% xM bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_xM();

% u bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_u();


% ---------------------------------------------------------------------- %
% ---------------------------------------------------------------------- %


%% Vergleich (linear)
% für Phi
linear_vergleich_phi();

% für xM
linear_vergleich_xM();

% für u
linear_vergleich_u();


% ---------------------------------------------------------------------- %
% ---------------------------------------------------------------------- %


%% Vergleich (nicht-linear)
% für Phi
nichtlinear_vergleich_phi();

% für xM
nichtlinear_vergleich_xM();

% für u
nichtlinear_vergleich_u();


% ---------------------------------------------------------------------- %
% ---------------------------------------------------------------------- %


%% einfacher Regler (linear) mit LMI's
% für Phi
% linear_lmi_regler_phi();

% für xM
% linear_lmi_regler_xM();

% für u
% linear_lmi_regler_u();


%% I-Regler (linear) mit LMI's
% für Phi
linear_lmi_i_regler_phi();

% für xM
linear_lmi_i_regler_xM();

% für u
linear_lmi_i_regler_u();