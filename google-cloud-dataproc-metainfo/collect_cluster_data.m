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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

collected_data = struct();

collected_data.PCA_low_mem_rw136 = [...
    cluster_data.cluster_node1_mem3_75_m.rw136.PCA_3_',...
    cluster_data.cluster_node3_mem3_75_m.rw136.PCA_3_',...
    cluster_data.cluster_node4_mem3_75_m.rw136.PCA_3_'...
    ];

collected_data.PCA_high_mem_rw136 = [...
    cluster_data.cluster_node1_mem6_5_m.rw136.PCA_3_',...
    cluster_data.cluster_node3_mem6_5_m.rw136.PCA_3_',...
    cluster_data.cluster_node4_mem6_5_m.rw136.PCA_3_'...
    ];


collected_data.Cov_low_mem_rw136 = [...
    cluster_data.cluster_node1_mem3_75_m.rw136.Cov',...
    cluster_data.cluster_node3_mem3_75_m.rw136.Cov',...
    cluster_data.cluster_node4_mem3_75_m.rw136.Cov'...
    ];

collected_data.Cov_high_mem_rw136 = [...
    cluster_data.cluster_node1_mem6_5_m.rw136.Cov',...
    cluster_data.cluster_node3_mem6_5_m.rw136.Cov',...
    cluster_data.cluster_node4_mem6_5_m.rw136.Cov'...
    ];


collected_data.SVD_low_mem_rw136 = [...
    cluster_data.cluster_node1_mem3_75_m.rw136.SVD_3_',...
    cluster_data.cluster_node3_mem3_75_m.rw136.SVD_3_',...
    cluster_data.cluster_node4_mem3_75_m.rw136.SVD_3_'...
    ];

collected_data.SVD_high_mem_rw136 = [...
    cluster_data.cluster_node1_mem6_5_m.rw136.SVD_3_',...
    cluster_data.cluster_node3_mem6_5_m.rw136.SVD_3_',...
    cluster_data.cluster_node4_mem6_5_m.rw136.SVD_3_'...
    ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

collected_data.PCA_low_mem_dwt_361 = [...
    cluster_data.cluster_node1_mem3_75_m.dwt_361.PCA_3_',...
    cluster_data.cluster_node3_mem3_75_m.dwt_361.PCA_3_',...
    cluster_data.cluster_node4_mem3_75_m.dwt_361.PCA_3_'...
    ];

collected_data.PCA_high_mem_dwt_361 = [...
    cluster_data.cluster_node1_mem6_5_m.dwt_361.PCA_3_',...
    cluster_data.cluster_node3_mem6_5_m.dwt_361.PCA_3_',...
    cluster_data.cluster_node4_mem6_5_m.dwt_361.PCA_3_'...
    ];


collected_data.Cov_low_mem_dwt_361 = [...
    cluster_data.cluster_node1_mem3_75_m.dwt_361.Cov',...
    cluster_data.cluster_node3_mem3_75_m.dwt_361.Cov',...
    cluster_data.cluster_node4_mem3_75_m.dwt_361.Cov'...
    ];

collected_data.Cov_high_mem_dwt_361 = [...
    cluster_data.cluster_node1_mem6_5_m.dwt_361.Cov',...
    cluster_data.cluster_node3_mem6_5_m.dwt_361.Cov',...
    cluster_data.cluster_node4_mem6_5_m.dwt_361.Cov'...
    ];


collected_data.SVD_low_mem_dwt_361 = [...
    cluster_data.cluster_node1_mem3_75_m.dwt_361.SVD_3_',...
    cluster_data.cluster_node3_mem3_75_m.dwt_361.SVD_3_',...
    cluster_data.cluster_node4_mem3_75_m.dwt_361.SVD_3_'...
    ];

collected_data.SVD_high_mem_dwt_361 = [...
    cluster_data.cluster_node1_mem6_5_m.dwt_361.SVD_3_',...
    cluster_data.cluster_node3_mem6_5_m.dwt_361.SVD_3_',...
    cluster_data.cluster_node4_mem6_5_m.dwt_361.SVD_3_'...
    ];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

datafields = fieldnames(collected_data);
avg_data = collected_data;
latexstrings = '';
for i = 1:numel(datafields)
    avg_data.(datafields{i}) = mean(collected_data.(datafields{i}));
    latexstring = '';
    for j = 1:length(avg_data.(datafields{i}))
        latexstring = [latexstring ' & ' sprintf('%.2f',avg_data.(datafields{i})(j))]; %#ok<AGROW>
    end
    latexstrings = [latexstrings sprintf(['\n\r' datafields{i} ' ' latexstring])]; %#ok<AGROW>
end