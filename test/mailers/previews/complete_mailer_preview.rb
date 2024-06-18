class CompleteMailerPreview < ActionMailer::Preview

  def complete_mail
    #以下のように変更
    CompleteMailer.complete_mail(Complete.new(title:"テスト",description:"プレビュー テスト",alert_mail_address:'自身のメールアドレス'))
  end
end