#coding:utf-8

require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:id){|n| n}
    name { Faker::Name.name}
    password { Faker::Internet.password}
    email {Faker::Internet.email}
    send_address ["hoge@rspec.com"]
  end
end