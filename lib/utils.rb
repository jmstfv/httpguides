# frozen_string_literal: true

def create_canonical_path(full_file_path)
  base_folder = 'content/'
  file_name = full_file_path.split(base_folder).last

  if file_name.match?('index') && file_name.split('/').size == 1
    '/' + file_name.downcase.split('/')[0...-1].join('/')
  elsif file_name.match?('index')
    '/' + file_name.downcase.split('/')[0...-1].join('/') + '/'
  else
    '/' + file_name.downcase.split('.').first
  end
end
