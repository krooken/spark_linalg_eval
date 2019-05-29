function filenames = scan_for_jobs(folder)

files_data = dir([folder '\**\driveroutput.000000000']);

filenames = cell(numel(files_data),1);
for i = 1:numel(files_data)
    filenames{i} = fullfile(files_data(i).folder,files_data(i).name);
end

end