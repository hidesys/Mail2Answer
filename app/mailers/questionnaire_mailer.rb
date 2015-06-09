class QuestionnaireMailer < ApplicationMailer
    default from: "noukei-inkai@hotmail.co.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.questionnaire_mailer.question.subject
  #
  def question(member, subject, content)
    @content = content

    mail to: member.email, subject: subject
  end
end
