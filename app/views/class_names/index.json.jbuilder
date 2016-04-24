json.array!(@class_names) do |class_name|
  json.extract! class_name, :id, :name, :group, :attributez, :methodz
  json.url class_name_url(class_name, format: :json)
end
