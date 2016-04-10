class Question < ApplicationRecord
  has_many :question_selections
  has_many :quizzes, through: :question_selections

  has_and_belongs_to_many :tags
  
  validates :t, {presence: true}
  validates :f, {presence: true}

  def self.by_tags(given_tags)
    return [] if given_tags.nil?
    raise 'Expecting an array' unless given_tags.is_a? Array
    given_tags.map(&:questions).flatten.uniq
  end

  def tag_names
    return 'No Tags' unless tags && tags.length > 0
    tags.map(&:name).join(', ')
  end

end
