close all
clear
clc

data=xlsread('TIDES OBSERVATION DATA STATION KOLAKA.xlsx','Data');
dates=datetime(data(:,1),data(:,2),data(:,3),data(:,4),data(:,5),data(:,6),'Timezone','local');
dt = tzoffset(dates);
tanggal=dates-dt; %UTC
tgl=datevec(tanggal);

pasut=data(:,7);
msl=mean(pasut);
pasut1=pasut-msl;

% --------
%format txt yyyy/mm/dd hh:mm:ss.sss tides
fid=fopen('pasut KOLAKA.txt','w');
fprintf(fid,'--------\n');
for i=1:length(tanggal)
    fprintf(fid,'%4d/%02d/%02d %02d:%02d:%02.3f %3.3f\n',tgl(i,1),tgl(i,2),tgl(i,3),tgl(i,4),tgl(i,5),tgl(i,6),pasut1(i)); %
     
end
%fprintf(fid,'selesai.');
fclose(fid);