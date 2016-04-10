require 'rails_helper'

RSpec.describe Question, :type => :model do
  let (:tag1) { Tag.new(name: 'one') }
  let (:tag2) { Tag.new(name: 'two') }
  let (:tag3) { Tag.new(name: 'three') }
  let (:tags) { [tag1, tag2, tag3] }
  let (:questions) { 20.times.map{ FactoryGirl.create(:question)} }

  it 'Question#by_tags scope covers edge cases' do
    expect(Question.by_tags(nil)).to eq []
  end

  it 'Question#by_tags scope works' do
    questions.first(5).each { |q| q.tags << tag1 }
    questions[3..7].each{ |q| q.tags << tag2 }
    questions.last(8).each { |q| q.tags << tag3 }
    
    expect(Question.by_tags([tag1]).length).to eq 5
    expect(Question.by_tags([tag1,tag2]).length).to eq 8
    expect(Question.by_tags([tag1,tag2,tag3]).length).to eq 16
  end
end
