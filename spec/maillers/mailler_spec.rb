#coding:utf-8
require 'spec_helper'

describe "-Unit- Sending Mail" do

  it "is this mail test is able now" do
    user = FactoryGirl.build(:user)
    report = FactoryGirl.build(:report)
    email = ReportMail.report_submitted(user,report).deliver
  end


  describe "Check Mails Properties" do

    it "is Subject fill in User.name"do
      user = FactoryGirl.build(:user)
      report = FactoryGirl.build(:report)
      email = ReportMail.report_submitted(user,report).deliver

      expect(open_last_email).to have_subject "#{user.name}の日報が提出されました"
    end


  end


end