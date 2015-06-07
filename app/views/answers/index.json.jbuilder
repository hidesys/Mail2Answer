json.array!(@answers) do |answer|
  json.extract! answer, :id, :url, :reply, :member_id, :questionnaire_id
  json.url answer_url(answer, format: :json)
end
