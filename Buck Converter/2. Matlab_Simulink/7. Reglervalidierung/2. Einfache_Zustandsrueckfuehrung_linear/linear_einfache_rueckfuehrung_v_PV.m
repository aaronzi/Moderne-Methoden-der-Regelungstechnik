%% EINFACHE ZUSTANDSRÜCKFÜHRUNG LINEAR - v_PV
function linear_einfache_rueckfuehrung_v_PV()
    warning('off','all')

    % PFAD DER SIMULATION 
    simOut = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','6','FixedStep','1/1e4');

    % V_PV-WERTE
    vec_v_PV = simOut.x_vec.Data(:, 1);

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT
    figure
    plot(t_vec, vec_v_PV, 'r');
    legend("Spannung v_{PV}", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Spannung U [V]");
    grid on;

    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./7. Reglervalidierung/2. Einfache_Zustandsrueckfuehrung_linear/', 'linear_einfache_rueckfuehrung_v_PV.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end