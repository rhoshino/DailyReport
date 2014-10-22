#coding:utf-8

require 'spec_helper'

describe Report do
  #本文、題名があれば有効な状態である
  it "is valid with a title, body_text" do
    report = Report.new(
      report_title: 'test_Rspec',
      report_body_text: 'Hello'
      )
  end

  #題名がなければ無効
  it "is invalid without a title" do
    report = Report.new(report_title: nil)
    expect(report).to have(1).errors_on(:report_title)
  end

  #本文がなければ無効
  it "is invalid without a body_text" do
    report = Report.new(report_body_text: nil)
    expect(report).to have(1).errors_on(:report_body_text)
  end

end