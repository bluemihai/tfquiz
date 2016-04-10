require 'rails_helper'

RSpec.describe Quiz, :type => :model do

  before (:each) do
    @all_tag = Tag.new(name: 'all')
    @tag1 = Tag.new(name: 'one')
    @tag2 = Tag.new(name: 'two')
    @tag3 = Tag.new(name: 'three')
    @tags = [@tag1, @tag2, @tag3, @all_tag]
    @questions = 20.times.map{ FactoryGirl.create(:question)}
    @questions.each{ |q| q.tags << @all_tag }
    @questions.first(5).each { |q| q.tags << @tag1 }
    @questions[3..7].each{ |q| q.tags << @tag2 }
    @questions.last(8).each{ |q| q.tags << @tag3 }
    @user = User.new(name: 'John Doe')
    "@tags.first.class is #{@tags.first.class}"
    @quiz = Quiz.create!(tags: @tags, question_count: 3, custom: false,
      name: '', user: @user)
  end

  context 'initialization' do
    it 'gets initialized correctly' do
      expect(@quiz.tags).to match_array @tags
      expect(@quiz.question_count).to eq 3
      expect(@quiz.custom?).to eq false
      expect(@quiz.user).to eq @user
    end

    it '#add_name_if_blank after_save callback works' do
      expect(@quiz.name).to eq '3-question quiz on all, one, three, two'
      @quiz = Quiz.create!(tags: [@tag1, @tag3], question_count: 10)
      expect(@quiz.name).to eq '10-question quiz on one, three'
    end    
  end

  it 'Quiz#userless scope works' do
    q1 = Quiz.create!(tags: @tags, question_count: 1, custom: false, 
                      name: '', user: @user)
    q2 = Quiz.create!(tags: @tags, question_count: 2, custom: false, name: '')
    q3 = Quiz.create!(tags: @tags, question_count: 3, custom: false, name: '')
    expect(Quiz.userless).to match_array [q2, q3]
  end

  context '#tag names' do
    it 'returns correctly with several tags' do
      expect(@quiz.tag_names).to eq 'all, one, three, two'
    end

    it 'returns no tags yet with no tags' do
      q1 = Quiz.create!(question_count: 5, custom: false)
      expect(q1.tag_names).to eq 'no tags yet'
    end    
  end

  it '#is_smart_quiz? works' do
    expect(@quiz.is_smart_quiz?).to be_truthy
    q1 = Quiz.create!(tags: [], question_count: 1, custom: false)
    expect(q1.is_smart_quiz?).to be_falsey
    q2 = Quiz.create!(tags: @tags, question_count: 0, custom: false)
    expect(q2.is_smart_quiz?).to be_falsey
    q3 = Quiz.create!(tags: @tags, question_count: 3, custom: true)
    expect(q3.is_smart_quiz?).to be_falsey
  end

  context '#regenerate_questions' do
    it 'works with sufficient questions' do
      expect(@quiz.questions.length).to eq 3
      @quiz.regenerate_questions
      saved_question_ids = @quiz.questions.map(&:id)
      @quiz.regenerate_questions
      expect(@quiz.questions.map(&:id)).not_to match saved_question_ids
    end    
  end

  it '#randomize_tf works' do
    @quiz.update(question_count: 7)
    @quiz.regenerate_questions
    old = @quiz.question_selections.map(&:display_t_or_f)
    @quiz.randomize_tf
    expect(@quiz.question_selections.map(&:display_t_or_f)).not_to match old
  end

end
