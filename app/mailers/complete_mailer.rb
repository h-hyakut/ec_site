class CompleteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.complete_mailer.complete_mail.subject
  #
  def complete_mail(complete)
    @complete = complete
    mail to: complete.email, subject: "商品の注文が完了しました！"
  end
end
