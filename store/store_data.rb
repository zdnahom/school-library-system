require 'json'

class StoreData
  def save_data(file_name, data)
    File.write(file_name, data.to_json)
  end

  def load_data(file_name)
    json_data = File.read(file_name)
    JSON.parse(json_data)
  end
end
