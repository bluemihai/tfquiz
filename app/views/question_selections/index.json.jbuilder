json.array!(@question_selections) do |question_selection|
  json.extract! question_selection, :id, :question_id, :quiz_id, :display_t_or_f
  json.url question_selection_url(question_selection, format: :json)
end
