#coding:utf-8
FactoryGirl.define do
  factory :user do
    name "John Doe"
    password "maid_in_factory"
    sequence(:email){|n| "johndoe#{n}@example.com"}

  end
end