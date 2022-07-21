%% EINFACHE ZUSTANDSRÜCKFÜHRUNG LINEAR - i_L
function linear_einfache_rueckfuehrung_i_L()
    warning('off','all')

    % PFAD DER SIMULATION 
    simOut = sim('Einfache_Zustandsrueckfuehrung_linear','StartTime','0','StopTime','6','FixedStep','1/1e4');

    % I_L-WERTE
    vec_i_L = simOut.x_vec.Data(:, 2);

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT
    figure
    plot(t_vec, vec_i_L, 'r');
    legend("Strom i_{L}", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Strom I [A]");
    grid on;

    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./7. Reglervalidierung/2. Einfache_Zustandsrueckfuehrung_linear/', 'linear_einfache_rueckfuehrung_i_L.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end