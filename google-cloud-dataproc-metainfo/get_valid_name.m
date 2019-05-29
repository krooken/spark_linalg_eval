function valid_field_name = get_valid_name(name)

positions = regexp(name, '[^\w]');
valid_field_name = name;
valid_field_name(positions) = '_';

end