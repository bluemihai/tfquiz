class Quiz < ApplicationRecord
  belongs_to :user, required: false
  has_many :question_selections
  has_many :questions, through: :question_selections
  has_and_belongs_to_many :tags

  after_create :regenerate_questions
  after_save :add_name_if_blank

  scope :userless, -> { where(user_id: nil) }

  def tag_names
    return 'no tags yet' unless tags.length && tags.length > 0
    tags.map(&:name).join(', ')
  end

  def is_smart_quiz?
    !custom && tags.to_a.length > 0 && question_count && question_count > 0
  end

  def regenerate_questions
    return false unless is_smart_quiz?
    question_pool = Question.by_tags(tags)
    questions.clear << question_pool.first(question_count)
  end

  def randomize_tf
    return false unless question_selections.length > 0
    question_selections.each{ |qs| qs.randomize_display_t_or_f }
  end

  private
  
    def add_name_if_blank
      name_blank = name.to_s.length == 0
      if name_blank && !custom && tags.to_a.length > 0 && question_count
        update(name: "#{question_count}-question quiz on #{tag_names}")
      end
    end

end
