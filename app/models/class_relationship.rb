class ClassRelationship < ApplicationRecord
  belongs_to :primary_class_name, class_name: 'ClassName', foreign_key: :secondary_id
  belongs_to :secondary_class_name, class_name: 'ClassName', foreign_key: :primary_id

  enum class_rel: [:nothing, :inheritance, :modules, :composition]

  def self.labels_for_select
    keys = ClassRelationship.class_rels.keys.to_a
    keys.map(&:titleize).zip(keys)
  end

  def self.add_for_new_id(class_name_id)
    cn_ids = ClassName.all.map(&:id) - [class_name_id]
    cn_ids.each{ |cn_id| ClassRelationship.create(
      primary_id: cn_id,
      secondary_id: class_name_id
    )}
    cn_ids.each{ |cn_id| ClassRelationship.create(
      primary_id: class_name_id,
      secondary_id: cn_id,
    )}
  end
end
