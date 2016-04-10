json.array!(@questions) do |question|
  json.extract! question, :id, :t, :f, :domain, :public_comments, :private_comments, :active
  json.url question_url(question, format: :json)
end
