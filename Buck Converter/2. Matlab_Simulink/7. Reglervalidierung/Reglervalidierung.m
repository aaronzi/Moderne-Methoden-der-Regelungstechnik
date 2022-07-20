%% FUNKTIONSAUFRUFE FÜR PLOTS
%% Vergleich lineares und nichtlineares Modell
% PV-Spannungen
linear_nichtlinear_vergleich_v_PV();

% Ströme i_L
linear_nichtlinear_vergleich_i_L();


% ------------------------------------------------------------------------%


%% Einfache Zustandsrückführung
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


%% I-Regler (linear) mit LMI's (und Beobachter)
% für Phi
linear_lmi_i_regler_phi();

% für xM
linear_lmi_i_regler_xM();

% für u
linear_lmi_i_regler_u();

%% Vergleich y und y_head
% für Phi
vergleich_phi_phi_head();

% für xM
vergleich_xM_xM_head();

% für xM_Punkt
vergleich_xM_punkt_xM_punkt_head();

%% Rekonstruktion phi_punkt über Beobachter
rekonstruktion_phi_punkt();