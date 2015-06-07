json.array!(@questionnaires) do |questionnaire|
  json.extract! questionnaire, :id, :subject, :content
  json.url questionnaire_url(questionnaire, format: :json)
end
