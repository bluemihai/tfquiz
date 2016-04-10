class Tag < ApplicationRecord
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :quizzes

  default_scope { order(:name) }

  def name_and_qs
    "#{name} (#{questions.count})"
  end

  def self.all_tag
    Tag.find_or_create_by(name: 'all')
  end
end
