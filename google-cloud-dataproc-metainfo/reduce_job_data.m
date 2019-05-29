function reduced_data = reduce_job_data(folder)

filenames = scan_for_jobs(folder);

data = struct();
for i = 1:numel(filenames)
    
    filecontents = fileread(filenames{i});
    keyvalues = parse_output(filecontents);
    for j = 1:size(keyvalues,1)
        valid_name = get_valid_name(keyvalues{j,1});
        if isfield(data, valid_name)
            data.(valid_name) = [data.(valid_name) keyvalues{j,2}];
        else
            data.(valid_name) = [keyvalues{j,2}];
        end
    end
end

reduced_data = data;

end