#coding:utf-8

require 'spec_helper'

describe "-Unit- Admin's Report" do

  before(:all) do
    @admin = create_uniq_admin
  end

  it "Wait! Farstly,Admin is Avairable?" do
    #admin  = create_uniq_admin
    expect(@admin.name).to eq "capybara-san"
    expect(@admin.role).to eq "admin"
  end

  describe "Our Admin is Sign_up - Sign-out!"do
    it "Admin is seeing Title" do
      visit "/users/sign_in"
      expect(page).to have_content '日報アプリケーション'
    end

    it "Admin is Sign-up" do
      sign_up_admin(@admin)
      expect(page).to have_content 'あなたの日報 一覧'
    end

    it "Admin is Write Daily Report" do
      sign_up_admin(@admin)
      within("//div[@class='horizontal_controller'][1]/div[@class='horizontal_left_button'][1]")do
        click_button('Create Report')
      end
      #日報を書く画面んいいるか?
      expect(page).to have_content 'New report'

    end
  end

end

