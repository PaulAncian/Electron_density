function [IPs,RemainingElectrons] = read(filename0,filename1)

fileID0 = fopen(filename0,'r');
fileID1 = fopen(filename1,'r');

IPs                = dlmread(filename0);
RemainingElectrons = dlmread(filename1);

fclose(fileID0);
fclose(fileID1);

end