%% VERGLEICH LINEARES UND NICHTLINEARES MODELL - v_PV
function linear_nichtlinear_vergleich_v_PV()
    warning('off','all')

    % PFAD DER SIMULATION 
    simOut = sim('Vergleich_linear_nichtlinear','StartTime','0','StopTime','0.15','FixedStep','1/1e4');

    % NICHTLINEAR
    vec_v_PV_nichtlinear = simOut.y_nichtlinear.v_PV.Data;

    % LINEAR
    vec_v_PV_linear = simOut.y_linear.Data(:, 1);

    % ZEITVEKTOR
    t_vec = simOut.tout;

    % PLOT
    figure
    hold on;
    plot(t_vec, vec_v_PV_linear, 'r--', "LineWidth", 1);
    plot(t_vec, vec_v_PV_nichtlinear, "b");
    legend("linear", "nichtlinear", "location", "northeast");
    xlabel("Zeit t [s]");
    ylabel("Spannung U [v]");
    grid on;
    hold off;

    % PDF SPEICHERN
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos-[0 0 0 100])
    filename = fullfile('./7. Reglervalidierung/1. Vergleich_linear_nichtlinear/', 'linear_nichtlinear_vergleich_v_PV.pdf');
    exportgraphics(gcf,filename,'ContentType','vector');
    disp('Successfully created PDF')
end