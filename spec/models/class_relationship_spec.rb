require 'rails_helper'

RSpec.describe ClassRelationship, :type => :model do
  before(:each) { ['Dog', 'Cat', 'Animal', 'Person'].each{ |name| ClassName.create!(name: name) }}

  it 'given n ClassName.count, expect to have n*(n-1) relationships' do
    expect(ClassRelationship.count).to eq 12
    ClassName.first.destroy
    expect(ClassRelationship.count).to eq 6    
  end
end
