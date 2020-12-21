df = readtable('pred_values.csv');
df_both = readtable('df_both.csv');


figure
years = unique(year(df_both.Var1))
years(years==2014 | years==2015)= [] ;

for i = 1:length(years)
    subplot(length(years)/2, 2, i)
    hold on
    axis tight
    grid on
    box on
    ylabel('Concentration (mg/m^{3})')
    xlabel('Date')
     plot(df.Var1(year(df.Var1)==years(i)), 10.^df.pred_val_PC(year(df.Var1)==years(i)), 'color','b')
     plot(df.Var1(year(df.Var1)==years(i)), 10.^df.pred_val_ML(year(df.Var1)==years(i)), 'color','r')
     plot(df.Var1(year(df.Var1)==years(i)), 10.^df.pred_val_chl(year(df.Var1)==years(i)), 'color','g')
scatter(df_both.Var1(year(df_both.Var1)==years(i)), 10.^ df_both.Lab_Chla(year(df_both.Var1)==years(i)),15, 'k', 'filled')
%      if i == 1
%        set(gca, 'XTick', datetime({'01-Jul-2014', '01-Aug-2014', '01-Sep-2014'}), 'xticklabel', {'Jul', 'Aug', 'Sep'});
%     end
end

legend({'chl^{PC}_{P}', 'chl^{ML}_{P}',  'chl^{chl}_{P}', 'chl_{M}'}, 'FontSize', 12)