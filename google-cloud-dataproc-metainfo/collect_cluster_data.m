[folder, ~, ~] = fileparts(mfilename('fullpath'));

folder_data = dir(folder);
cluster_data = struct();

for i = 1:numel(folder_data)
    
    if folder_data(i).isdir && folder_data(i).name(1) ~= '.'
        data = reduce_job_data(fullfile(folder_data(i).folder,folder_data(i).name));
        valid_name = get_valid_name(folder_data(i).name);
        cluster_data.(valid_name) = data;
    end
    
end