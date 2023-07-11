%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: /Users/takamitsu3/Downloads/csv_file_download_list.csv
%
% Auto-generated by MATLAB on 10-Jul-2023 17:16:28

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 14);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["CRUISE", "AGENCY", "SCIENTIST", "PLATFORM", "STARTTIMEUTC", "ENDTIMEUTC", "DURATIONDAYS", "STATION", "LAT", "LON", "DATATYPE", "FILENAME", "FILE_URL", "NETCDF_URL"];
opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "datetime", "datetime", "double", "double", "double", "double", "categorical", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["FILENAME", "FILE_URL", "NETCDF_URL"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["CRUISE", "AGENCY", "SCIENTIST", "PLATFORM", "DATATYPE", "FILENAME", "FILE_URL", "NETCDF_URL"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "STARTTIMEUTC", "InputFormat", "yyyy-MM-dd HH:mm:ss");
opts = setvaropts(opts, "ENDTIMEUTC", "InputFormat", "yyyy-MM-dd HH:mm:ss");
opts = setvaropts(opts, "STATION", "TrimNonNumeric", true);
opts = setvaropts(opts, "STATION", "ThousandsSeparator", ",");

% Import the data
tbl = readtable("/Users/takamitsu3/Downloads/csv_file_download_list.csv", opts);

%% Convert to output type
CRUISE = tbl.CRUISE;
AGENCY = tbl.AGENCY;
SCIENTIST = tbl.SCIENTIST;
PLATFORM = tbl.PLATFORM;
STARTTIMEUTC = tbl.STARTTIMEUTC;
ENDTIMEUTC = tbl.ENDTIMEUTC;
DURATIONDAYS = tbl.DURATIONDAYS;
STATION = tbl.STATION;
LAT = tbl.LAT;
LON = tbl.LON;
DATATYPE = tbl.DATATYPE;
FILENAME = tbl.FILENAME;
FILE_URL = tbl.FILE_URL;
NETCDF_URL = tbl.NETCDF_URL;

%% Clear temporary variables
clear opts tbl