#coding:utf-8
require 'spec_helper'

describe User do

  describe "User's send_address "do

    context "have collect format" do
      #正しい形のemailを一つ持っていれば有効である
      it "is valid with send_address" do
        user = User.new(name: "hoge_name",
                        email: "hoge@hoge.com",
                        send_address:  ["send@address.com"])
      end
      #正しい形のemailを複数持っていれば有効である
      it "is valid with Any send_address" do
        user = User.new(name: "hoge_name",
                        email: "hoge@hoge.com",
                        send_address:  ["send@address.com",
                                          "ruby@on.rails"])
      end
      #send_adressを持っていなくても有効である
      it "is without send_address" do
        user = User.new(name: "hoge_name",
                        email: "hoge@hoge.com")
      end
    end


    context "have not collect format" do
      #一つの変な形のアドレスを持っていれば無効である
      it "is Invalid Strange send_address" do
        user = User.new(name: "hoge_name",
                        email: "hoge@hoge.com",
                        password: "123456789",
                        send_address:  ["kore ha oka sii"])
        expect(user).to be_valid

      end

      #一つの変な形のアドレスを持っていれば無効である
      it "is Invalid Any Strange send_address" do
        user = User.new(name: "hoge_name",
                        email: "hoge@hoge.com",
                        password: "123456789",
                        send_address:  ["hoge@hoge.jp",
                                        "kore ha oka sii"])
        expect(user).to be_valid
      end
    end
  end

  #ファクトリ-をつかう
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

end