%df_buoy_ave = readtable('df_buoy_ave.csv');
pars = {df_buoy_ave.ChlRFUShallow ; log10(df_buoy_ave.ChlRFUShallow) ; df_buoy_ave.BGAPCShallowRFU ; log10(df_buoy_ave.BGAPCShallowRFU) ; 10.^df_both.Lab_Chla; df_both.Lab_Chla}
parnames = {'F^{ chl}';'log F^{ chl}';'F^{ PC}';'log F^{ PC}';'chl_{M}';'log chl_{M}'};

Xlabel = {'fluorescence (RFU)' ; 'log RFU' ; 'fluorescence (RFU)'; 'log RFU' ; 'concentration (mg/m3)'; 'log mg/m3' }
map = brewermap(2,'Set1');
figure


for i = 1:6
    
    if rem(i,2) ~= 0
        ax1 = subplot(1 , 3 , ceil(i/2) )
        hold on
        box on
        grid on
        axis square
        
        histogram(pars{i},'facecolor',map(1,:),'facealpha',.5,'edgecolor',map(1,:))
        set(gca,'xcolor',map(1,:))
        xlabel(Xlabel{i})
        ylabel('counts')
        legend(parnames{i},'Location','northwest', 'FontSize', 12)
        
    else
        ax1_pos = ax1.Position; % position of first axes
        ax2 = axes('Position',ax1_pos,...
            'XAxisLocation','top',...
            'Color','none');
        hold on
        box on
        grid on
        axis square
        subplot( 1 , 3 , ceil(i/2) ,ax2  )
        histogram(pars{i},'facecolor',map(2,:),'facealpha',.5,'edgecolor',map(2,:))
        set(gca,'ytick',[])
        set(gca,'xcolor',map(2,:))
        xlabel(Xlabel{i})
        legend(parnames{i},'Location','northeast', 'FontSize', 12)
    end
    
    
    
end
