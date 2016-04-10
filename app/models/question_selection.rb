class QuestionSelection < ApplicationRecord
  belongs_to :quiz
  belongs_to :question

  def self.randomized
    QuestionSelection.all.each(&:randomize)
  end

  def randomize_display_t_or_f
    update(display_t_or_f: [true, false].sample)
  end

  def t
    question.t
  end

  def f
    question.f
  end

  def present_random
    display_t_or_f ? t : f
  end

  def answer_key
    display_t_or_f ? "True! False version: #{f}" : "False! #{t}"
  end

end
