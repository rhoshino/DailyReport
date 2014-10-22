# coding: utf-8
class ReportMail < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mail.report_submitted.subject
  #
  def report_submitted(user,report)
    @greeting = "Hi"
    @user = user
    @report = report
    #TODO: user.email
    #mail(:to => user.email, :subject => "#{user.name}の日報が提出されました")

    mail :to => user.send_address,
          :subject => "#{user.name}の日報が提出されました"
  end

end
