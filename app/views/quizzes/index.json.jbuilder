json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :name, :user_id, :custom, :question_count
  json.url quiz_url(quiz, format: :json)
end
