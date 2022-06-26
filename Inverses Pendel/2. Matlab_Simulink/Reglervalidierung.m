addpath(genpath('./Reglervalidierung/'));
%% Ackermann (linear) Phi bei verschiedenen Anfangswinkeln
linear_ackermann_phi();
%% Ackermann (linear) xM bei verschiedenen Anfangswinkeln
linear_ackermann_xM();
%% Ackermann (linear) u bei verschiedenen Anfangswinkeln
linear_ackermann_u();
%% Vorsteuerung (linear) Phi bei verschiedenen Anfangswinkeln
linear_vorsteuerung_phi();
%% Vorsteuerung xM bei verschiedenen Anfangswinkeln
linear_vorsteuerung_xM();
%% Vorsteuerung u bei verschiedenen Anfangswinkeln
linear_vorsteuerung_u();
%% I-Regler Phi bei verschiedenen Anfangswinkeln
linear_i_regler_phi();
%% I-Regler xM bei verschiedenen Anfangswinkeln
linear_i_regler_xM();
%% I-Regler u bei verschiedenen Anfangswinkeln
linear_i_regler_u();
%% Ackermann Phi bei verschiedenen Anfangswinkeln
% sP_Acker = [-4 -4 -4 -4];
for i=1:10
    start_deg = i*2.7;
    simOut = sim('Zustandsregelung_mit_Ackermann_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    mat_x = simOut.x_vec.Phi.Data;
    vec_phi = mat_x(:,1)*180/pi;
    t_vec = simOut.tout;
    plot(t_vec,vec_phi)
    hold on
end
hold off
%% Ackermann xM bei verschiedenen Anfangswinkeln
% sP_Acker = [-4 -4 -4 -4];
for i=1:10
    start_deg = i*2.7;
    simOut = sim('Zustandsregelung_mit_Ackermann_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    mat_x = simOut.x_vec.xM.Data;
    vec_xM = mat_x(:,1);
    t_vec = simOut.tout;
    plot(t_vec,vec_xM)
    hold on
end
hold off
%% Ackermann u bei verschiedenen Anfangswinkeln
% sP_Acker = [-4 -4 -4 -4];
for i=1:10
    start_deg = i*2.7;
    simOut = sim('Zustandsregelung_mit_Ackermann_nichtlinear','StartTime','0','StopTime','4','FixedStep','1/1e4');
    u = simOut.u.Data;
    t_vec = simOut.tout;
    plot(t_vec,u)
    hold on
end
hold off
%% Vorsteuerung Phi bei verschiedenen Anfangswinkeln
% sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
for i=1:5
    y_vec = [0.1 0.25 0.5 0.75 0.9];
    y_ref = y_vec(i);
    subplot(5,1,i)
    for j=1:6
        start_deg = j*4;
        simOut = sim('Zustandsregelung_mit_Vorsteuerung_nichtlinear','StartTime','0','StopTime','2.5','FixedStep','1/1e4');
        mat_x = simOut.x_vec.Phi.Data;
        vec_phi = mat_x(:,1)*180/pi;
        t_vec = simOut.tout;
        plot(t_vec,vec_phi)
        hold on
    end
end
hold off
%% Vorsteuerung xM bei verschiedenen Anfangswinkeln
% sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
for i=1:5
    y_vec = [0.1 0.25 0.5 0.75 0.9];
    y_ref = y_vec(i);
    subplot(5,1,i)
    for j=1:6
        start_deg = j*4;
        simOut = sim('Zustandsregelung_mit_Vorsteuerung_nichtlinear','StartTime','0','StopTime','2.5','FixedStep','1/1e4');
        mat_x = simOut.x_vec.xM.Data;
        vec_xM = mat_x(:,1);
        t_vec = simOut.tout;
        plot(t_vec,vec_xM)
        hold on
    end
end
hold off
%% Vorsteuerung u bei verschiedenen Anfangswinkeln
% sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
for i=1:5
    y_vec = [0.1 0.25 0.5 0.75 0.9];
    y_ref = y_vec(i);
    subplot(5,1,i)
    for j=1:6
        start_deg = j*4;
        simOut = sim('Zustandsregelung_mit_Vorsteuerung_nichtlinear','StartTime','0','StopTime','2.5','FixedStep','1/1e4');
        u = simOut.u.Data;
        t_vec = simOut.tout;
        plot(t_vec,u)
        hold on
    end
end
hold off
%% I-Regler Phi bei verschiedenen Anfangswinkeln
% sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
for i=1:5
    y_vec = [0.1 0.25 0.5 0.75 0.9];
    y_ref = y_vec(i);
    subplot(5,1,i)
    for j=1:6
        start_deg = j*4;
        simOut = sim('Zustandsregelung_mit_I_Regelung_nichtlinear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
        mat_x = simOut.x_vec.Phi.Data;
        vec_phi = mat_x(:,1)*180/pi;
        t_vec = simOut.tout;
        plot(t_vec,vec_phi)
        hold on
    end
end
hold off
%% I-Regler xM bei verschiedenen Anfangswinkeln
% sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
for i=1:5
    y_vec = [0.1 0.25 0.5 0.75 0.9];
    y_ref = y_vec(i);
    subplot(5,1,i)
    for j=1:6
        start_deg = j*4;
        simOut = sim('Zustandsregelung_mit_I_Regelung_nichtlinear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
        mat_x = simOut.x_vec.xM.Data;
        vec_xM = mat_x(:,1);
        t_vec = simOut.tout;
        plot(t_vec,vec_xM)
        hold on
    end
end
hold off
%% I-Regler u bei verschiedenen Anfangswinkeln
% sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
for i=1:5
    y_vec = [0.1 0.25 0.5 0.75 0.9];
    y_ref = y_vec(i);
    subplot(5,1,i)
    for j=1:6
        start_deg = j*4;
        simOut = sim('Zustandsregelung_mit_I_Regelung_nichtlinear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
        u = simOut.u.Data;
        t_vec = simOut.tout;
        plot(t_vec,u)
        hold on
    end
end
hold off