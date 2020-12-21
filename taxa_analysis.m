 InsituData.DateTime.TimeZone = '';
figure
i = 0;
for years = setdiff(2014:2018, 2015)
    i = i+1;
%     years = firatyears+i;
idx_year = year(InsituData.DateTime)  == years;
subplot(4,1,i)
% figure
set(gca,'XRuler',matlab.graphics.axis.decorator.DatetimeRuler)
colormap jet
hold on
grid on
title('Time series of phytoplankton cell count based on taxanomy'); xlabel('Time'); ylabel(('k cell per litre'));
hold on
plot(InsituData.DateTime(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.B_cell_WTP)), InsituData.B_cell_WTP(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.B_cell_WTP)),'color','b','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.G_cell_WTP)), InsituData.G_cell_WTP(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.G_cell_WTP)),'color','g','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.D_cell_WTP)), InsituData.D_cell_WTP(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.D_cell_WTP)),'color','m','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.F_cell_WTP)), InsituData.F_cell_WTP(idx_year & 3<month(InsituData.DateTime) & month(InsituData.DateTime)<11 & ~isnan(InsituData.F_cell_WTP)),'color','r','Marker','+','LineWidth',.1)
%plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Total)), InsituData.Total(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Total)),'color','r','Marker','+','LineWidth',.1)
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.BG(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'b','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.G(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'g','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.D(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'y','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.F(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'m','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.Total(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'r','filled')

axis tight
end
lgd =  legend(["BG","G","D","F"], 'FontSize',10,'Location', 'northeast','interpreter','none');


idx_WTP1 = strcmp(InsituData.Dataset,'WTP') & (~isnan(InsituData.Lab_Chla) & ~isnan(InsituData.Total_cell_WTP));
% WTP1 is the WTP which has taxa info

figure
Z = linkage(squareform(pdist(InsituData.Species(idx_WTP1,:)./InsituData.Total(idx_WTP1,:))))
dendrogram(Z)
T = cluster(Z,'maxclust',10)
InsituData.Dominant(idx_WTP1) = T;

% [coincidents, chl_lab ,chl_buoy ,Lab_datatypes] = findingCoincidents(InsituData.DateTime,idx_WTP,idx_WTP,InsituData.Cal_Chla,InsituData.Total,InsituData.Dominant)


%% for calibration data
figure
i = 0;
for years = 2015:2018
    i = i+1;
%     years = firatyears+i;
idx_year = year(InsituData.DateTime)  == years;
% subplot(4,1,i)
% % figure
% set(gca,'XRuler',matlab.graphics.axis.decorator.InsituData.DateTimeRuler)
% colormap jet
% hold on
% grid on
% title('Time series of phytoplankton cell count based on taxanomy'); xlabel('Time'); ylabel(('k cell per litre'));
% hold on
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Cyanobacteria) & isnan(InsituData.SamplingInScum)), InsituData.Cyanobacteria(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Cyanobacteria) & isnan(InsituData.SamplingInScum)),'color','b','Marker','+','LineWidth',.1)
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Chlorophyte) & isnan(InsituData.SamplingInScum)), InsituData.Chlorophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Chlorophyte) & isnan(InsituData.SamplingInScum)),'color','g','Marker','+','LineWidth',.1)
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Diatom) & isnan(InsituData.SamplingInScum)), InsituData.Diatom(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Diatom) & isnan(InsituData.SamplingInScum)),'color','m','Marker','+','LineWidth',.1)
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Dinoflagellate) & isnan(InsituData.SamplingInScum)), InsituData.Dinoflagellate(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Dinoflagellate) & isnan(InsituData.SamplingInScum)),'color','r','Marker','+','LineWidth',.1)
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Euglenophyte) & isnan(InsituData.SamplingInScum)), InsituData.Euglenophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Euglenophyte) & isnan(InsituData.SamplingInScum)),'color','c','Marker','+','LineWidth',.1)
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Chrysophyte) & isnan(InsituData.SamplingInScum)), InsituData.Chrysophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Chrysophyte) & isnan(InsituData.SamplingInScum)),'color','y','Marker','+','LineWidth',.1)
% plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Cryptophyte) & isnan(InsituData.SamplingInScum)), InsituData.Cryptophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Cryptophyte) & isnan(InsituData.SamplingInScum)),'color','k','Marker','+','LineWidth',.1)
% %plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Total)), InsituData.Total(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.Total)),'color','r','Marker','+','LineWidth',.1)

subplot(4,1,i)
% figure
set(gca,'XRuler',matlab.graphics.axis.decorator.InsituData.DateTimeRuler)
colormap jet
hold on
grid on
title('Time series of phytoplankton cell count based on taxanomy'); xlabel('Time'); ylabel(('k cell per litre'));
hold on
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassCyanobacteria) & isnan(InsituData.SamplingInScum)), InsituData.biomassCyanobacteria(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassCyanobacteria) & isnan(InsituData.SamplingInScum)),'color','b','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassChlorophyte) & isnan(InsituData.SamplingInScum)), InsituData.biomassChlorophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassChlorophyte) & isnan(InsituData.SamplingInScum)),'color','g','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassDiatom) & isnan(InsituData.SamplingInScum)), InsituData.biomassDiatom(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassDiatom) & isnan(InsituData.SamplingInScum)),'color','m','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassDinoflagellate) & isnan(InsituData.SamplingInScum)), InsituData.biomassDinoflagellate(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassDinoflagellate) & isnan(InsituData.SamplingInScum)),'color','r','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassEuglenophyte) & isnan(InsituData.SamplingInScum)), InsituData.biomassEuglenophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassEuglenophyte) & isnan(InsituData.SamplingInScum)),'color','c','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassChrysophyte) & isnan(InsituData.SamplingInScum)), InsituData.biomassChrysophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassChrysophyte) & isnan(InsituData.SamplingInScum)),'color','y','Marker','+','LineWidth',.1)
plot(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassCryptophyte) & isnan(InsituData.SamplingInScum)), InsituData.biomassCryptophyte(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10 & ~isnan(InsituData.biomassCryptophyte) & isnan(InsituData.SamplingInScum)),'color','k','Marker','+','LineWidth',.1)

% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.BG(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'b','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.G(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'g','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.D(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'y','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.F(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'m','filled')
% scatter(InsituData.DateTime(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10), InsituData.Total(idx_year & 4<month(InsituData.DateTime) & month(InsituData.DateTime)<10),'r','filled')

axis tight
end
lgd =  legend(["Cyanobacteria","Chlorophyte","Diatom","Dinoflagellate","Euglenophyte","Chrysophyte","Cryptophyte"], 'FontSize',10,'Location', 'northeast','interpreter','none');


idx_Calibration1 = strcmp(InsituData.DataType,'Calibration') & (~isnan(InsituData.Lab_Chla) & ~isnan(InsituData.Total));
% WTP1 is the WTP which has taxa info

% figure
% Z = linkage(squareform(pdist(InsituData.Species(idx_WTP1,:)./InsituData.Total(idx_WTP1,:))))
% dendrogram(Z)
% T = cluster(Z,'maxclust',10)
% InsituData.Dominant(idx_WTP1) = T;

% [coincidents, chl_lab ,chl_buoy ,Lab_datatypes] = findingCoincidents(InsituData.DateTime,idx_WTP,idx_WTP,InsituData.Cal_Chla,InsituData.Total,InsituData.Dominant)

