json.array!(@class_relationships) do |class_relationship|
  json.extract! class_relationship, :id, :primary_id, :secondary_id, :class_rel, :object_rel
  json.url class_relationship_url(class_relationship, format: :json)
end
