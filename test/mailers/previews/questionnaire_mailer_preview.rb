# Preview all emails at http://localhost:3000/rails/mailers/questionnaire_mailer
class QuestionnaireMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/questionnaire_mailer/question
  def question
    QuestionnaireMailer.question
  end

end
