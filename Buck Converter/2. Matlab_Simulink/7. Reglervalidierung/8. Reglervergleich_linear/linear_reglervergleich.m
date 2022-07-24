%% REGELVERGLEICH LINEAR
function linear_reglervergleich()
    warning('off','all')

    % PFAD DER SIMULATION EINFACHE ZUSTANDSRÜCKFÜHRUNG
    simOut1 = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','10','FixedStep','1/1e4');
    % PFAD DER SIMULATION MIT VORSTEUERUNG
    simOut2 = sim('Zustandsregelung_mit_Vorsteuerung_linear','StartTime','0','StopTime','10','FixedStep','1/1e4');
    % PFAD DER SIMULATION MIT I-REGELUNG
    simOut3 = sim('Zustandsregelung_mit_I_Regelung_linear','StartTime','0','StopTime','10','FixedStep','1/1e4');

    % V_PV-WERTE
    vec_v_PV1 = simOut1.x_vec.Data(:, 1);
    vec_v_PV2 = simOut2.x_vec.Data(:, 1);
    vec_v_PV3 = simOut3.x_vec.Data(:, 1);

    % I_L-WERTE
    vec_i_L1 = simOut1.x_vec.Data(:, 2);
    vec_i_L2 = simOut2.x_vec.Data(:, 2);
    vec_i_L3 = simOut3.x_vec.Data(:, 2);

    % U-Werte
    vec_u1 = simOut1.u.Data;
    vec_u2 = simOut2.u.Data;
    vec_u3 = simOut3.u.Data;

    % ZEITVEKTOR
    t_vec = simOut1.tout;

    % PLOT V_PV
    subplot(3,1,1)
    plot(t_vec, vec_v_PV1, 'Color','#CCFF00');
    hold on
    plot(t_vec, vec_v_PV2, 'Color','#00FF00');
    hold on
    plot(t_vec, vec_v_PV3, '-.', 'Color','#008800');
    hold off
    title("Spannung v_{PV}");
    legend('Einfacher Regler','Vorsteuerung','I-Regler')
    xlabel("Zeit t [s]");
    ylabel("Spannung U [V]");
    grid on;
    
    % PLOT I_L
    subplot(3,1,2)
    plot(t_vec, vec_i_L1, 'Color','#FFCC00');
    hold on
    plot(t_vec, vec_i_L2, 'Color','#FF8800');
    hold on
    plot(t_vec, vec_i_L3, '-.', 'Color','#880000');
    hold off
    title("Strom i_{L}");
    legend('Einfacher Regler','Vorsteuerung','I-Regler')
    xlabel("Zeit t [s]");
    ylabel("Strom I [A]");
    grid on;
    
    % PLOT U
    subplot(3,1,3)
    plot(t_vec, vec_u1, 'Color','#00CCFF');
    hold on
    plot(t_vec, vec_u2, 'Color','#0088FF');
    hold on
    plot(t_vec, vec_u3, '-.', 'Color','#000088');
    hold off
    title("Eingang u");
    legend('Einfacher Regler','Vorsteuerung','I-Regler')
    xlabel("Zeit t [s]");
    ylabel("Amplitude");
    grid on;


    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos+[0 -400 0 400])
    filename = fullfile('./7. Reglervalidierung/8. Reglervergleich_linear/', 'linear_reglervergleich.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end