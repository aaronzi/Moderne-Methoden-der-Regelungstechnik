%% EINFACHE ZUSTANDSRÜCKFÜHRUNG LINEAR
function linear_einfache_rueckfuehrung()
    warning('off','all')

    % PFAD DER SIMULATION V_PV
    simOut = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','10','FixedStep','1/1e4');

    % V_PV-WERTE
    vec_v_PV = simOut.x_vec.Data(:, 1);

    % I_L-WERTE
    vec_i_L = simOut.x_vec.Data(:, 2);

    % U-Werte
    vec_u = simOut.u.Data;

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT V_PV
    subplot(3,1,1)
    plot(t_vec, vec_v_PV, 'g');
    legend("Spannung v_{PV}", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Spannung U [V]");
    grid on;
    
    % PLOT I_L
    subplot(3,1,2)
    plot(t_vec, vec_i_L, 'r');
    legend("Strom i_{L}", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Strom I [A]");
    grid on;
    
    % PLOT U
    subplot(3,1,3)
    plot(t_vec, vec_u, 'b');
    legend("Eingang u", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Amplitude");
    grid on;

    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos+[0 -400 0 400])
    filename = fullfile('./7. Reglervalidierung/2. Einfache_Zustandsrueckfuehrung_linear/', 'linear_einfache_rueckfuehrung.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end