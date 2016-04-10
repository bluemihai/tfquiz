class Topic < ApplicationRecord
  has_many :questions

  def name_and_qs
    "#{name} (#{questions.count})"
  end
end
