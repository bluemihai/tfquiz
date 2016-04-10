require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let (:tag) { FactoryGirl.create(:tag, name: 'foo') }
  let (:questions) { 10.times.map{ FactoryGirl.create(:question)} }
  it '#name_and_qs works' do
    questions.first(8).each{ |q| q.tags << tag }
    expect(tag.name_and_qs).to eq 'foo (8)'
  end
end
