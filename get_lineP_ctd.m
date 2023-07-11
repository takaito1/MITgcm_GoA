%% Line P profiles

% By Ito and Timmerman, 2023

% clear up memory, safety first
close all;
clear all;

% month-data selector
MONTH = 6; 

% wait period in seconds for netCDF download
waittime = 3; 

% standard depth for model comparison
zlev = 5:5:500;
Nz = length(zlev);

% read the CSV file
read_LineP_csv;

% get year and month
yr = year(STARTTIMEUTC);
mo = month(STARTTIMEUTC);

% visualize data distribution
figure(1);
subplot(2,2,1);
hist(yr);
title('number of profiles')
xlabel('year')
%---
subplot(2,2,2);
hist(mo);
title('number of profiles')
xlabel('month')

% count the number of profile for the specific month
I = find(mo==MONTH);
subplot(2,2,3);
hist(yr(I));
title(['number of profiles for month=',num2str(MONTH)])
xlabel('month')

% prepare array for results
YR = unique(yr(I));
Nyr = length(unique(yr(I)));
Tobs = zeros(Nz,Nyr);
Sobs = zeros(Nz,Nyr);
% download files, year by year
for k =1:Nyr
    L = find(yr==YR(k));
    mon = mo(L);
    J = find(mon==MONTH);
    disp(['there are ',num2str(length(J)),' profiles in ',num2str(YR(k)),'-',num2str(MONTH)]);
    Ttmp = zeros(Nz,length(J))*NaN;
    Stmp = zeros(Nz,length(J))*NaN;
    for n =1:length(J)
        fn=NETCDF_URL{L(J(n))};
        disp(fn);
        web(fn);
        pause(waittime);
        tmpn = split(fn,'/');
        fn0  = tmpn{5};
        tmpt = ncread(fn0,'sea_water_temperature');
        tmps = ncread(fn0,'sea_water_practical_salinity');
        tmpz = ncread(fn0,'depth');
        eval(['! rm ',fn0]);
        Ttmp(:,n)=interp1(tmpz,tmpt,zlev,'linear',NaN);
        Stmp(:,n)=interp1(tmpz,tmps,zlev,'linear',NaN);
    end
    Tobs(:,k)=nanmean(Ttmp,2);
    Sobs(:,k)=nanmean(Stmp,2);
end

save(['TSobs_P26_MON',num2str(MONTH),'.mat'],'Tobs','Sobs','YR','zlev');
save(['Tobs_P26_MON',num2str(MONTH),'.txt'],'-ASCII','Tobs');
save(['Sobs_P26_MON',num2str(MONTH),'.txt'],'-ASCII','Sobs');
save(['zlev_P26_MON',num2str(MONTH),'.txt'],'-ASCII','zlev');
save(['YR_P26_MON',num2str(MONTH),'.txt'],'-ASCII','YR');

