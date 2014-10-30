#coding:utf-8
require 'spec_helper'

describe "-Unit- User" do

  describe "User's send_address "do

    #ファクトリ-をつかう
    describe "Use Factory" do

      #ファクトリーの確認
      it "has a valid factory" do
        expect(FactoryGirl.build(:user)).to be_valid
      end

      context "have collect format" do
        #正しい形のemailを一つ持っていれば有効である
        it "is valid with single of send_address" do
          user = FactoryGirl.build(:user,
                            send_address:  ["send@address.com"])
        end

        #send_adressを持っていなくても有効である
        it "is not have send_address" do
          FactoryGirl.build(:user,
                            send_address: nil)
        end

        #正しい形のemailを複数持っていれば有効である
        it "is valid with Any send_address" do
          user = FactoryGirl.build(:user,
                              send_address: ["send@address.com",
                                            "hoge@hoge.jp"])
        end

      end#end context "collect format"

      context "have not collect format" do
        #一つの変な形のアドレスを持っていれば無効である
        it "is Invalid Strange send_address" do
          user = FactoryGirl.build(:user,
                            send_address:  ["kore ha oka sii"])
          expect(user).to be_valid
        end

        #複数のアドレス且つ、一つの変な形のアドレスを持っていれば無効である
        it "is Invalid Any Strange send_address" do
          user = FactoryGirl.build(:user,
                          send_address:  ["hoge@hoge.jp",
                                          "kore ha oka sii"])
          expect(user).to be_valid
        end

      end# end context "have not collect format"

    end# end describe Use Factory
  end# end describe user send address

end
      # #正しい形のemailを一つ持っていれば有効である
      # it "is valid with send_address" do
      #   user = User.new(name: "hoge_name",
      #                   email: "hoge@hoge.com",
      #                   send_address:  ["send@address.com"])
      # end