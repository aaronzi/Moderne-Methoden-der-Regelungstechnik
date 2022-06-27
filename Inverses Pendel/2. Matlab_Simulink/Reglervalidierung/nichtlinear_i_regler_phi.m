function nichtlinear_i_regler_phi()
    warning('off','all')
    % sP_Vorsteuerung = [-4.5 -4.5 -4.5 -4.5];
    for i=1:5
        y_vec = [0.1 0.25 0.5 0.75 0.9];
        assignin('base','y_ref',y_vec(i));
        subplot(5,1,i)
        legendString = strings(6,1);
        for j=1:6
            assignin('base','start_deg',j*4);
            simOut = sim('Zustandsregelung_mit_I_Regelung_nichtlinear','StartTime','0','StopTime','3.5','FixedStep','1/1e4');
            mat_x = simOut.x_vec.Phi.Data;
            vec_phi = mat_x(:,1)*180/pi;
            t_vec = simOut.tout;
            plot(t_vec,vec_phi)
            hold on
            legendString(j) = sprintf('%.1f°',j*4);
        end
        xlabel('Zeit t [s]','interpreter','latex')
        ylabel('Winkel $\varphi$ [$^{\circ}$]','interpreter','latex')
        titleString = sprintf('y_{ref} = %1.2f',y_vec(i));
        title(titleString)
        legend(legendString)
        grid on
        hold off
    end
    pos = get(gcf, 'Position');
    set(gcf, 'Position',pos+[0 -500 0 500])
    filename = fullfile('./Reglervalidierung/', 'nichtlinear_i_regler_phi.pdf');
    exportgraphics(gcf,filename,'ContentType','vector')
    disp('Successfully created PDF')
end