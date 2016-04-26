class ClassName < ApplicationRecord
  has_many :primary_class_relationships, 
    class_name: 'ClassRelationship',
    foreign_key: :primary_id, 
    dependent: :destroy
  has_many :secondary_class_relationships,
    class_name: 'ClassRelationship', 
    foreign_key: :secondary_id, 
    dependent: :destroy
  has_many :secondary_rels,
    through: :secondary_class_relationships 
  has_many :primary_rels,
    through: :primary_class_relationships 

  after_save :add_rels

  def other
    @other ||= (ClassName.all - [self]).sample
  end

  private

    def add_rels
      ClassRelationship.add_for_new_id(self.id)
    end  

end
