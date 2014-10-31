#coding:utf-8
FactoryGirl.define do
  factory :report do
    report_title "Made in Factory"
    report_body_text "maid_in_factory"
    # worktime
    # after(:create) do |report|
    #   report.worktime << FactoryGirl.build(:worktime)
    # end
  end
end