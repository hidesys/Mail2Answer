class QuestionnaireMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.questionnaire_mailer.question.subject
  #
  def question
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
