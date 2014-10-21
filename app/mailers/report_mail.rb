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

    #宛先作成
    str_to = Array.new
    user.send_address.each_line do |line|
      #一度配列にバラして、改行などいらないものを取る
      str_to.push line.strip
    end
    str_to = str_to.join(",")#そのあと、文字列に再びk都合して、カンマ区切り
    debugger
    mail :to => str_to,
          :subject => "#{user.name}の日報が提出されました"
  end

end
