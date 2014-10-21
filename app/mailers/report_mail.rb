# coding: utf-8
class ReportMail < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mail.report_submitted.subject
  #
  def report_submitted(user)
    @greeting = "Hi"
    @user = user
    #TODO: user.email
    #mail(:to => user.email, :subject => "#{user.name}の日報が提出されました")
    mail :to => user.send_adress,
          :subject => "#{user.name}の日報が提出されました"
  end

end
