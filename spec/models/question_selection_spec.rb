require 'rails_helper'

RSpec.describe QuestionSelection, :type => :model do

  before (:each) do
    @quiz = FactoryGirl.create(:quiz)
    @question = FactoryGirl.create(:question)
    @qs = FactoryGirl.create(:question_selection, quiz: @quiz, question: @question)
  end

  it 'gets initialized correctly' do
    expect(@qs.persisted?).to be_truthy
    expect(@qs.quiz).to eq @quiz
    expect(@qs.question).to eq @question
  end
  
  it '#randomize_display_to_or_f works' do
    expect(@qs.display_t_or_f).to be_nil
    @qs.randomize_display_t_or_f
    expect(@qs.display_t_or_f).not_to be_nil
  end
end
