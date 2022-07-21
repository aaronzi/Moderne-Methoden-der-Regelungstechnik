%% Vergleich linear und nichtlineares System
% Phi in Grad
vergleich_linear_nichtlinear_phi_grad();

% Phi in Rad
vergleich_linear_nichtlinear_phi_rad();


% ----------------------------------------------------------------------- %


%% Einfache Rückführung (linear)
% Phi bei verschiedenen Anfangswinkeln
einfache_rueckfuehrung_linear_phi();

% xM bei verschiedenen Anfangswinkeln
einfache_rueckfuehrung_linear_xM();

% u bei verschiedenen Anfangswinkeln
einfache_rueckfuehrung_linear_u();


%% Einfache Rückführung (nichtlinear)
% Phi bei verschiedenen Anfangswinkeln
einfache_rueckfuehrung_nichtlinear_phi();

% xM bei verschiedenen Anfangswinkeln
einfache_rueckfuehrung_nichtlinear_xM();

% u bei verschiedenen Anfangswinkeln
einfache_rueckfuehrung_nichtlinear_u();


% ----------------------------------------------------------------------- %


%% Referenzwertvorsteuerung (linear)
% Phi bei verschiedenen Anfangswinkeln
linear_vorsteuerung_phi();

% xM bei verschiedenen Anfangswinkeln
linear_vorsteuerung_xM();

% u bei verschiedenen Anfangswinkeln
linear_vorsteuerung_u();


%% Referenzwertvorsteuerung (nichtlinear)
% Phi bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_phi();

% xM bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_xM();

% u bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_u();


% ----------------------------------------------------------------------- %


%% I-Regler (linear)
% Phi bei verschiedenen Anfangswinkeln
linear_i_regler_phi();

% xM bei verschiedenen Anfangswinkeln
linear_i_regler_xM();

% u bei verschiedenen Anfangswinkeln
linear_i_regler_u();


%% I-Regler (nicht-linear)
% Phi bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_phi();

% xM bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_xM();

% u bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_u();


% ----------------------------------------------------------------------- %


%% Vergleich (linear)
% für Phi
linear_vergleich_phi();

% für xM
linear_vergleich_xM();

% für u
linear_vergleich_u();


%% Vergleich (nicht-linear)
% für Phi
nichtlinear_vergleich_phi();

% für xM
nichtlinear_vergleich_xM();

% für u
nichtlinear_vergleich_u();


% ----------------------------------------------------------------------- %


%% I-Regler (linear) mit LMI's (und Beobachter)
% für Phi
linear_lmi_i_regler_phi();

% für xM
linear_lmi_i_regler_xM();

% für u
linear_lmi_i_regler_u();


%% Rekonstruktion phi_punkt über Beobachter
rekonstruktion_phi_punkt();


% ----------------------------------------------------------------------- %


%% Vergleich y und y_head
% für Phi
vergleich_phi_phi_head();

% für xM
vergleich_xM_xM_head();

% für xM_Punkt
vergleich_xM_punkt_xM_punkt_head();