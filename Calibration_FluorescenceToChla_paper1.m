df_both = readtable('df_both.csv');

[fitness, n, m] = fit(10.^df_both.Lab_Chla, df_both.BGAPCShallowRFU,'power1','robust', 'Bisquare')

figure
scatter(10.^df_both.Lab_Chla, df_both.BGAPCShallowRFU, 'filled', 'b')
hold on
plot(fitness)

set(gca, 'YScale', 'log');
set(gca, 'XScale', 'log');
box on
grid on
axis tight
axis square
xlabel('chl_{M} (mg/m^{3})', 'FontSize', 12)
ylabel('F^{PC} (RFU)', 'FontSize', 12)

legend('observations', 'fit model', 'location', 'southeast', 'FontSize', 12)

eq = formula(fitness); %Formula of fitted equation
parameters = coeffnames(fitness); %All the parameter names
values = round(coeffvalues(fitness),2); %All the parameter values
for i = 1:numel(parameters)
      param = parameters{i};
      l = length(param);
      loc = regexp(eq, param); %Location of the parameter within the string

      while ~isempty(loc)     
          %Substitute parameter value
          eq = [eq(1:loc-1) num2str(values(i)) eq(loc+l:end)];
          loc = regexp(eq, param);
      end
end

       loc_x = regexp(eq, 'x'); %Location of the 'X' within the string
       eq = [eq(1:loc_x-1) ' [Chla] ' eq(loc_x+1:end)];

       text(0.05, 0.95, ['N = ' num2str(length(df_both.Lab_Chla))],'Units','normalized', 'Interpreter', 'tex', 'FontSize', 12)
text(0.05, 0.9, ['r^{2} = ' num2str(round(n.rsquare,2))],'Units','normalized', 'Interpreter', 'tex', 'FontSize', 12)
   text(0.05, 0.85, ['F = ' eq],'Units','normalized','Interpreter', 'none', 'FontSize', 12)

%     set(gca, 'XTick', [1 10 100], 'xticklabel', {'1' '10' '100'});
%  set(gca, 'YTick', [1 2 3 4 5 6], 'yticklabel', {'1' '2' '3' '4' '5' '6'});
    set(gca, 'XTick', [1 10 100], 'xticklabel', {'1' '10' '100'});
 set(gca, 'YTick', [1 10], 'yticklabel', {'1' '10'});
 
%  xlim([1 250])
% ylim([.5 7])
 xlim([1 300])
ylim([.18 38])
 