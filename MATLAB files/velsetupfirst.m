script

%   This script formats the 2 parameter velocity data into two
%   vectors with par1 and par2 values and a matrix with (i, j)th
%   element being the conduction velocity resulting from the ith
%   par1 value and jth par2 value.  Use this script only once.
%   Use velsetupnext.m for additional data for the same plot.
%   To use, first load the vel(par1, par2) data from a dat file
%   into the matrix 'data' with the following command:
%   data = load('location/filename.dat').  Next, use the command:
%   velsetupfirst

%   E.g.
%   data = load('VELOCITY-141106_myeL_gap_1.dat');
%   velsetupfirst
%   data = load('VELOCITY-141106_myeL_gap_2.dat');
%   velsetupnext

numofrows = size(data, 1);

i = 1;
while i <= numofrows
    checkpar = data(i, 1);
    checkparind = find(data(i:end, 1) < checkpar);
    checkparind = checkparind+i-1;
    numtomove = size(checkparind, 1);
    if numtomove == 0
        i = i+1;
    end
    if numtomove ~= 0
        datatomove = data(checkparind, :);
        data(checkparind, :) = [];
        data((i+numtomove):(end+numtomove), :) = data(i:end, :);
        data(i:(i+numtomove-1), :) = datatomove;
    end
end
checkpar = data(1, 1);
checkparind = find(data(:, 1) == checkpar);
numtomove = size(checkparind, 1);
datatomove = data(checkparind, :);
datatomove(:, 4) = [1:numtomove]';
i = 2;
while i <= numtomove
    j = i-1;
    while j >= 1
        if datatomove(i, 2) < datatomove(j, 2)
            datatomove([j, i], :) = datatomove([i, j], :);
            i = j;
        end
        j = j-1;
    end
    i = i+1;
end
datatomove = datatomove(:, 4);
changeloop = numofrows/numtomove-1;
for i = 0:changeloop
    oldindexes = [1:numtomove]'+numtomove*i;
    newindexes = datatomove+numtomove*i;
    data(oldindexes, :) = data(newindexes, :);
end

par1 = data(:, 1);
par2 = data(:, 2);

parsize1 = numofrows;
i = 1;
while i < parsize1
    checkpar = par1(i, 1);
    for j = parsize1:(-1):(i+1)
        if par1(j, 1) == checkpar
            par1(j, :) = [];
        end
    end
    parsize1 = size(par1, 1);
    i = i+1;
end

parsize2 = numofrows;
i = 1;
while i < parsize2
    checkpar = par2(i, 1);
    for j = parsize2:(-1):(i+1)
        if par2(j, 1) == checkpar
            par2(j, :) = [];
        end
    end
    parsize2 = size(par2, 1);
    i = i+1;
end

vel = zeros(parsize1, parsize2);
k = 0;
for i = 1:parsize1
    for j = 1:parsize2
        k = k+1;
        vel(i, j) = data(k, 3);
    end
end

clear numofrows i j k checkpar checkparind numtomove datatomove changeloop oldindexes newindexes