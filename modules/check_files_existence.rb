require 'json'

module Files
  def check_files_existence
    create_file_if_not_exist('./book/books.json', [])
    create_file_if_not_exist('./book/label.json', [])
  end

  def create_file_if_not_exist(file_name, default_content)
    return if File.exist?(file_name)
    File.write(file_name, JSON.generate(default_content))
  end
end
