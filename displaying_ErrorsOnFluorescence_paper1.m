
figure
idx_Buoy = strcmp(InsituData.Dataset, 'Buoy'); 

subplot(1,3,1)
hold on
axis square
grid on
box on
axis tight
idx_dt = year(InsituData.DateTime) == 2016 & month(InsituData.DateTime) >8 & day(InsituData.DateTime) >10 ;
idx = idx_dt & idx_Buoy;
plot(InsituData.DateTime(idx), smooth(InsituData.BGAPCShallowRFU(idx),11), 'b')
plot(InsituData.DateTime(idx), smooth(InsituData.BGAPCDeepRFU(idx),11), 'c')
ylabel('Relative fluorescence (RFU)')
legend('F^{ PC}', 'F^{ PC}_{deep}', 'FontSize', 12, 'location', 'northwest')


subplot(1,3,2)
hold on
axis square
grid on
box on
idx_dt = year(InsituData.DateTime) == 2016 & month(InsituData.DateTime) == 5 & day(InsituData.DateTime) <31 & day(InsituData.DateTime) > 26
idx = idx_dt & idx_Buoy;
plot(InsituData.DateTime(idx), smooth(InsituData.BGAPCShallowRFU(idx)), 'b')
h3 = plot(InsituData.DateTime(idx), smooth(InsituData.BGAPCDeepRFU(idx)), 'c')
ylabel('Relative fluorescence (RFU)')
legend('F^{ PC}', 'F^{ PC}_{deep}', 'FontSize', 12, 'location', 'northwest')



subplot(1,3,3)
hold on
axis square
grid on
box on
idx_dt = year(InsituData.DateTime) == 2016 & month(InsituData.DateTime) <6 & day(InsituData.DateTime) < 25 & day(InsituData.DateTime) > 18 ;
idx = idx_dt & idx_Buoy;
h1 = plot(InsituData.DateTime(idx), smooth(InsituData.ChlRFUShallow(idx), 11), 'g')
h2 = plot(InsituData.DateTime(idx),smooth(InsituData.BGAPCShallowRFU(idx), 11), 'b')
ylabel('Relative fluorescence (RFU)')
yyaxis right
h4 = plot(InsituData.DateTime(idx), smooth(InsituData.PARAirFlags(idx),11) , 'r')
ylabel('PAR (µmol/s*m^{2})')
legend('F^{ chl}' , 'F^{ PC}', 'PAR_{air}', 'FontSize', 12, 'location', 'northwest')


%legend([h1,h2,h3,h4],'F^{ chl}' , 'F^{ PC}', 'F^{ PC}_{deep}', 'PAR_{air}', 'FontSize', 12)



