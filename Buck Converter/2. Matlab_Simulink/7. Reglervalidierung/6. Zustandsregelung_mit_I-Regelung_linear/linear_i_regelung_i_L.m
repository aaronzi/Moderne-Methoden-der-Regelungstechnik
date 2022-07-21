%% I-REGELUNG LINEAR - i_L
function linear_i_regelung_i_L()
    warning('off','all')

    % PFAD DER SIMULATION 
    simOut = sim('Zustandsregelung_mit_I_Regelung_linear','StartTime','0','StopTime','10','FixedStep','1/1e4');

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
    filename = fullfile('./7. Reglervalidierung/6. Zustandsregelung_mit_I-Regelung_linear/', 'linear_i_regelung_i_L.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end