function [pos, time, volt] = voltsetup(filename)

%   This script formats the voltage data from filename.dat (string)
%   Outputs are:
%   pos = n x 1 vector containing the positions, where first position is
%   defined to be at 0
%   time = m x 1 vector containing the times, where the first time is
%   defined to be at 0
%   volt = m x n matrix where volt(i, j) is the voltage of position n at
%   time m

%   E.g.
%   [posI1, timeI1, voltI1] = voltsetup('INTVOLTAGE-150108_gap_1.dat');
%   [posI2, timeI2, voltI2] = voltsetup('INTVOLTAGE-150108_gap_2.dat');
%   [posE1, timeE1, voltE1] = voltsetup('EXTVOLTAGE-150108_gap_1.dat');
%   [posE2, timeE2, voltE2] = voltsetup('EXTVOLTAGE-150108_gap_2.dat');

 data = load(filename);
 pos = data(1, 2:end);
 pos = pos';
 time = data(2:end, 1);
 time = time-time(1);
 volt = data(2:end, 2:end);