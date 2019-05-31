script

%   Run this to include additional 2 parameter velocity data.
%   Thus, the data generated from velsetupfirst.m is updated.
%   Run after velsetupfirst.m and follow the same instructions,
%   except use command: velsetupnext instead.
%   velsetupfirst.m should only be used once, but velsetupnext.m
%   can be used as many times as needed after velsetupfirst.m
%   has been used.

%   E.g.
%   data = load('VELOCITY-141106_myeL_gap_1.dat');
%   velsetupfirst
%   data = load('VELOCITY-141106_myeL_gap_1.dat');
%   velsetupnext

numofdata = size(data, 1);

for i = 1:numofdata
    newpar1 = data(i, 1);
    newpar2 = data(i, 2);
    newvel = data(i, 3);
    indnewpar1 = find(par1 == newpar1);
    indnewpar2 = find(par2 == newpar2);
    if size(indnewpar1, 1) == 0
        indnewpar1 = 1;
        for j = 1:parsize1
            if par1(j) < newpar1
                indnewpar1 = indnewpar1+1;
            end
            if par1(j) > newpar1
                j = parsize1;
            end
        end
        parsize1 = parsize1+1;
        par1(parsize1, 1) = [0];
        par1((indnewpar1+1):parsize1, 1) = par1(indnewpar1:(parsize1-1), 1);
        par1(indnewpar1, 1) = newpar1;
        vel(parsize1, :) = zeros(1, parsize2);
        vel((indnewpar1+1):parsize1, :) = vel(indnewpar1:(parsize1-1), :);
        vel(indnewpar1, :) = zeros(1, parsize2);
    end
    if size(indnewpar2, 1) == 0
        indnewpar2 = 1;
        for j = 1:parsize2
            if par2(j) < newpar2
                indnewpar2 = indnewpar2+1;
            end
            if par2(j) > newpar2
                j = parsize2;
            end
        end
        parsize2 = parsize2+1;
        par2(parsize2, 1) = [0];
        par2((indnewpar2+1):parsize2, 1) = par2(indnewpar2:(parsize2-1), 1);
        par2(indnewpar2, 1) = newpar2;
        vel(:, parsize2) = zeros(parsize1, 1);
        vel(:, (indnewpar2+1):parsize2) = vel(:, indnewpar2:(parsize2-1));
        vel(:, indnewpar2) = zeros(parsize1, 1);
    end
    vel(indnewpar1, indnewpar2) = newvel;
end

clear numofdata newpar1 newpar2 newvel indnewpar1 indnewpar2 i j