function reduced_data = reduce_job_data(folder)

filenames = scan_for_jobs(folder);

data = struct();
for i = 1:numel(filenames)
    
    filecontents = fileread(filenames{i});
    keyvalues = parse_output(filecontents);
    for j = 1:size(keyvalues,1)
        data = add_to_struct(data, keyvalues(j, 1:2), keyvalues{j,3});
    end
end

reduced_data = data;

end

function s = add_to_struct(s, fields, data)

if numel(fields) > 0
    
    valid_name = get_valid_name(fields{1});
    if isfield(s, valid_name)
        s.(valid_name) = add_to_struct(s.(valid_name), fields(2:end), data);
    else
        s.(valid_name) = add_to_struct(struct(), fields(2:end), data);
    end
    
else
    
    if isstruct(s)
        s = data;
    else
        s = [s data];
    end
    
end

end