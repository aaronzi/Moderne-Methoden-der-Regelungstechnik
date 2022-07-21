%% VERGLEICH LINEARES UND NICHTLINEARES MODELL - i_L
function linear_nichtlinear_vergleich_i_L()
    warning('off','all')

    % PFAD DER SIMULATION 
    simOut = sim('Vergleich_linear_nichtlinear','StartTime','0','StopTime','0.25','FixedStep','1/1e4');

    % NICHTLINEAR
    vec_i_L_nichtlinear = simOut.y_nichtlinear.i_L.Data;

    % LINEAR
    vec_i_L_linear = simOut.y_linear.Data(:, 2);

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT
    figure
    hold on;
    plot(t_vec, vec_i_L_linear, 'r--', "LineWidth", 1);
    plot(t_vec, vec_i_L_nichtlinear, "b");
    legend("linear", "nichtlinear", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Strom I [A]");
    grid on;
    hold off;

    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./7. Reglervalidierung/1. Vergleich_linear_nichtlinear/', 'linear_nichtlinear_vergleich_i_L.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end