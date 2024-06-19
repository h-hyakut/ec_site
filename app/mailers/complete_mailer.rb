class CompleteMailer < ApplicationMailer

  def complete_mail(complete)
    @complete = complete
    mail to: complete.email, subject: "Your order has been successfully completed."
  end
end
