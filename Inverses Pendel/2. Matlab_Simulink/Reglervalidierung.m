addpath(genpath('./Reglervalidierung/')); % Befehl muss einmal am Anfang
% ausgeführt werden!
%% Ackermann (linear) Phi bei verschiedenen Anfangswinkeln
linear_ackermann_phi();
%% Ackermann (linear) xM bei verschiedenen Anfangswinkeln
linear_ackermann_xM();
%% Ackermann (linear) u bei verschiedenen Anfangswinkeln
linear_ackermann_u();
%% Vorsteuerung (linear) Phi bei verschiedenen Anfangswinkeln
linear_vorsteuerung_phi();
%% Vorsteuerung (linear) xM bei verschiedenen Anfangswinkeln
linear_vorsteuerung_xM();
%% Vorsteuerung (linear) u bei verschiedenen Anfangswinkeln
linear_vorsteuerung_u();
%% I-Regler (linear) Phi bei verschiedenen Anfangswinkeln
linear_i_regler_phi();
%% I-Regler (linear) xM bei verschiedenen Anfangswinkeln
linear_i_regler_xM();
%% I-Regler (linear) u bei verschiedenen Anfangswinkeln
linear_i_regler_u();
%% Ackermann (nicht-linear) Phi bei verschiedenen Anfangswinkeln
nichtlinear_ackermann_phi();
%% Ackermann (nicht-linear) xM bei verschiedenen Anfangswinkeln
nichtlinear_ackermann_xM();
%% Ackermann (nicht-linear) u bei verschiedenen Anfangswinkeln
nichtlinear_ackermann_u();
%% Vorsteuerung (nicht-linear) Phi bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_phi();
%% Vorsteuerung (nicht-linear) xM bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_xM();
%% Vorsteuerung (nicht-linear) u bei verschiedenen Anfangswinkeln
nichtlinear_vorsteuerung_u();
%% I-Regler (nicht-linear) Phi bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_phi();
%% I-Regler (nicht-linear) xM bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_xM();
%% I-Regler (nicht-linear) u bei verschiedenen Anfangswinkeln
nichtlinear_i_regler_u();

%% Regler (linear) mit LMI's für Phi
linear_lmi_regler_phi();
%% Regler (linear) mit LMI's für xM
linear_lmi_regler_xM();
%% Regler (linear) mit LMI's für u
linear_lmi_regler_u();
%% I-Regler (linear) mit LMI's für Phi
linear_lmi_i_regler_phi();
%% I-Regler (linear) mit LMI's für xM
linear_lmi_i_regler_xM();
%% I-Regler (linear) mit LMI's für u
linear_lmi_i_regler_u();