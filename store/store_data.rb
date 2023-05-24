require 'json'

class StoreData
  def save_data(file_name, data)
    json_data = JSON.pretty_generate(data)
    File.write(file_name, json_data)
  end

  def load_data(file_name)
    json_data = File.read(file_name)
    JSON.parse(json_data)
  end
end
