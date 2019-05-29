function keyvalues = parse_output(filecontents)

regexpr = '(PCA\(3\)|Cov|SVD\(3\))\W*took:\W*(\d*\W?\d*)\W*seconds, for matrix: (\w*).';

matches = regexp(filecontents, regexpr, 'tokens');

keyvalues = cell(numel(matches),3);

for i = 1:numel(matches)
    keyvalues{i,1} = matches{i}{3};
    keyvalues{i,2} = matches{i}{1};
    keyvalues{i,3} = str2double(matches{i}{2});
end

end