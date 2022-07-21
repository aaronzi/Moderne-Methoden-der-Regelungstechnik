%% REFERENZWERTVORSTEUERUNG LINEAR - u
function linear_referenzwertvorsteuerung_u()
    warning('off','all')

    % PFAD DER SIMULATION 
    simOut = sim('Zustandsregelung_mit_Vorsteuerung_linear','StartTime','0','StopTime','6','FixedStep','1/1e4');

    % u-WERTE
    vec_u = simOut.u.Data;

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT
    figure
    plot(t_vec, vec_u, 'r');
    legend("Eingang u", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Amplitude");
    grid on;

    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./7. Reglervalidierung/4. Zustandsregelung_mit_Vorsteuerung_linear/', 'linear_referenzwertvorsteuerung_u.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end