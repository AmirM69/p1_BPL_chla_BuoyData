df_buoy = readtable('df_buoy_ave.csv');

years = unique(year(df_buoy.Var1))



for i = 1:length(years)
    subplot(length(years)/2, 2, i)
    hold on
    axis tight
    grid on
    box on
    ylabel('Fluorescence (RFU)')
    xlabel('Date')
     plot(df_buoy.Var1(year(df_buoy.Var1)==years(i)), df_buoy.ChlRFUShallow(year(df_buoy.Var1)==years(i)), 'g')
    if i == 1
       set(gca, 'XTick', datetime({'01-Jul-2014', '01-Aug-2014', '01-Sep-2014'}), 'xticklabel', {'Jul', 'Aug', 'Sep'});
    end
end


for i = 1:length(years)
    subplot(length(years)/2, 2, i)
    plot(df_buoy.Var1(year(df_buoy.Var1)==years(i)), df_buoy.BGAPCShallowRFU(year(df_buoy.Var1)==years(i)), 'b')
    
end

legend({'F^{chla}', 'F^{PC}'}, 'FontSize', 13)
