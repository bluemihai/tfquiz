class Quiz < ApplicationRecord
  belongs_to :user, required: false
  has_many :question_selections, dependent: :destroy
  has_many :questions, through: :question_selections
  has_and_belongs_to_many :tags

  after_create :regenerate_questions
  after_save :add_name_if_blank

  scope :userless, -> { where(user_id: nil) }

  def tag_names
    return 'no tags yet' unless tags.length && tags.length > 0
    tags.map(&:name).sort.join(', ')
  end

  def is_smart_quiz?
    !custom && tags.to_a.length > 0 && question_count && question_count > 0
  end

  def regenerate_questions
    return false unless is_smart_quiz?
    return false unless tags.length > 0
    unused_pool = Question.by_tags(tags) - questions
    if unused_pool.length >= question_count
      questions.clear << unused_pool.first(question_count).shuffle
    else
      how_many_more = question_count - unused_pool.length
      pool = unused_pool += questions.shuffle.first(how_many_more)
      questions.clear << pool.first(question_count)
    end
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
