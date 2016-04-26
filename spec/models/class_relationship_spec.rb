require 'rails_helper'

RSpec.describe ClassRelationship, :type => :model do
  let!(:names) { ['Dog', 'Cat', 'Animal', 'Person'].map{ |name| ClassName.create!(name: name) }}

  it 'given n ClassName.count, expect to have n*(n-1) relationships' do
    expect(ClassRelationship.count).to eq 12
    b = ClassName.create(name: 'Boy')
    expect(ClassRelationship.count).to eq 20
    expect(b.primary_class_relationships).to eq names
    ClassName.first.destroy
    expect(ClassRelationship.count).to eq 6    
  end
end
