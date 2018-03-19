function caCodesTable = makeCaTable(settings,n,dopplercode,PRNs)
%Function generates CA codes for all 32 satellites based on the settings
%provided in the structure "settings". The codes are digitized at the
%sampling frequency specified in the settings structure.
%One row in the "caCodesTable" is one C/A code. The row number is the PRN
%number of the C/A code.
%
%caCodesTable = makeCaTable(settings)
%
%   Inputs:
%       settings        - receiver settings
%   Outputs:
%       caCodesTable    - an array of arrays (matrix) containing C/A codes
%                       for all satellite PRN-s

%--------------------------------------------------------------------------
%                           SoftGNSS v3.0
% 
% Copyright (C) Darius Plausinaitis
% Written by Darius Plausinaitis
% Based on Peter Rinder and Nicolaj Bertelsen
%--------------------------------------------------------------------------
%This program is free software; you can redistribute it and/or
%modify it under the terms of the GNU General Public License
%as published by the Free Software Foundation; either version 2
%of the License, or (at your option) any later version.
%
%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with this program; if not, write to the Free Software
%Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
%USA.
%--------------------------------------------------------------------------

%CVS record:
%$Id: makeCaTable.m,v 1.1.2.6 2006/08/14 11:38:22 dpl Exp $

%--- Find number of samples per spreading code ----------------------------
samplesPerCode = round(settings.samplingFreq / ...
                           (settings.codeFreqBasis / settings.codeLength));
len = round(n * samplesPerCode - dopplercode * n/1000 *5);
%--- Prepare the output matrix to speed up function -----------------------

 
%--- Find time constants --------------------------------------------------
ts = 1/settings.samplingFreq;   % Sampling period in sec
tc = 1/(settings.codeFreqBasis + dopplercode);  % C/A chip period in sec
if nargin==3
    PRN=1:37;
end
if nargin==4
    PRN=PRNs;
end
caCodesTable = zeros(length(PRN), len);
%=== For all satellite PRN-s ...
for i=1:length(PRN)
    %--- Generate CA code for given PRN -----------------------------------
    caCode = generaterangcode(PRN(i));
 
    %=== Digitizing =======================================================
    
    %--- Make index array to read C/A code values -------------------------
    % The length of the index array depends on the sampling frequency -
    % number of samples per millisecond (because one C/A code period is one
    % millisecond).
    codeValueIndex = ceil((ts * (1:len)) / tc);
    
    %--- Correct the last index (due to number rounding issues) -----------
    codeValueIndex = mod(codeValueIndex-1,2046)+1;
    codeValueIndex(end) = 2046;
    %--- Make the digitized version of the C/A code -----------------------
    % The "upsampled" code is made by selecting values form the CA code
    % chip array (caCode) for the time instances of each sample.
    caCodesTable(i, :) = caCode(codeValueIndex);
    
end % for PRN = 1:37