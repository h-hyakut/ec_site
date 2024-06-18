class CompleteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.complete_mailer.complete_mail.subject
  #
  def complete_mail
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
