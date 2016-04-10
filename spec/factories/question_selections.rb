FactoryGirl.define do
  factory :question_selection do
    question_id 1
    quiz_id 1
    # association :question, factory: true
    # association :quiz, factory: true
    display_t_or_f nil
  end
end
