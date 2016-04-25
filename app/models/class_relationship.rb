class ClassRelationship < ApplicationRecord
  belongs_to :primary_class_name, class_name: 'ClassName', foreign_key: :secondary_id
  belongs_to :secondary_class_name, class_name: 'ClassName', foreign_key: :primary_id

  def self.add_for_new_id(class_name_id)
    cn_ids = ClassName.all.map(&:id) - [class_name_id]
    cn_ids.each{ |cn_id| ClassRelationship.create(primary_id: cn_id, secondary_id: cn_id) }
    cn_ids.each{ |cn_id| ClassRelationship.create(secondary_id: cn_id, primary_id: cn_id) }
  end
end
