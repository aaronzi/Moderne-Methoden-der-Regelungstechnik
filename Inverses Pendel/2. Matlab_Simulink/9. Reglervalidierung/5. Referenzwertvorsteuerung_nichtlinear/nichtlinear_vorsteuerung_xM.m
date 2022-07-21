function nichtlinear_vorsteuerung_xM()
    warning('off','all')
    % sP_Acker = [-4 -4 -4 -4];
    for i=1:5
        y_vec = [0.1 0.25 0.5 0.75 0.9];
        assignin('base','y_ref',y_vec(i));
        subplot(5,1,i)
        legendString = strings(6,1);
        for j=1:6
            assignin('base','start_deg',j*4);
            simOut = sim('Zustandsregelung_mit_Vorsteuerung_nichtlinear','StartTime','0','StopTime','2.5','FixedStep','1/1e4');
            mat_x = simOut.x_vec.xM.Data;
            vec_xM = mat_x(:,1);
            t_vec = simOut.tout;
            plot(t_vec,vec_xM)
            hold on
            legendString(j) = sprintf('%.1f°',j*4);
        end
        xlabel('Zeit t [s]','interpreter','latex')
        ylabel('Position $x_M$ [m]','interpreter','latex')
        titleString = sprintf('y_{ref} = %1.2f',y_vec(i));
        title(titleString)
        legend(legendString)
        grid on
        hold off
    end
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos+[0 -500 0 500])
    filename = fullfile('./9. Reglervalidierung/5. Referenzwertvorsteuerung_nichtlinear/', 'nichtlinear_vorsteuerung_xM.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end