df = readtable('df.csv');
df_lab = readtable('df_lab.csv');

filt_sample_depth = df_lab.sampledepth==0.8 |  df_lab.sampledepth==1 | df_lab.sampledepth==1.5 | df_lab.sampledepth==3
years = unique(year(df.Date_Time))
datasets = unique(df_lab.Dataset)
color = {[1,0,0], [.7,0,.7], [0,0,0], [.8,0.4,0]}
for i = 1:length(years)
    subplot(length(years)/2, 2, i)
    hold on
    axis tight
    grid on
    box on
    ylabel('Fluorescence (RFU)')
    xlabel('Date')
     plot(df.Date_Time(year(df.Date_Time)==years(i)), df.ChlorophyllShallow(year(df.Date_Time)==years(i)), 'g')
    if i == 1
       set(gca, 'XTick', datetime({'01-Jul-2014', '01-Aug-2014', '01-Sep-2014'}), 'xticklabel', {'Jul', 'Aug', 'Sep'});
    end
  
end


for i = 1:length(years)
    for j = 1:length(datasets)
    subplot(length(years)/2, 2, i)
            hold on
    scatter(df_lab.Date_Time(filt_sample_depth & year(df_lab.Date_Time)==years(i) &  strcmp(df_lab.Dataset,datasets{j})), df_lab.Lab_Chla(filt_sample_depth & year(df_lab.Date_Time)==years(i) &  strcmp(df_lab.Dataset,datasets{j}) ), [],color{j},'filled')
    end
xlim([min(df.Date_Time(strcmp(df.Dataset,'Buoy') & ~isnan(df.ChlorophyllShallow) & year(df.Date_Time)==years(i))) max(df.Date_Time(strcmp(df.Dataset,'Buoy')  & ~isnan(df.ChlorophyllShallow) & year(df.Date_Time)==years(i)))])  
ylabel('Concentration (mg/m^{3})')    
end

legend({'chl^{FC}_{P}', 'chl_{M} (E)', 'chl_{M} (H)', 'chl_{M} (S)', 'chl_{M} (W)'}, 'FontSize', 12)