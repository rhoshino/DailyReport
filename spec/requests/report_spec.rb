#coding:utf-8

require 'spec_helper'

describe "User Case" do

  before(:all) do
    @admin = create_uniq_admin
  end

  it "アドミンユーザーは作成されているのか。?" do
    #admin  = create_uniq_admin
    expect(@admin.name).to eq "capybara-san"
    expect(@admin.role).to eq "admin"
  end

  describe "Our Admin is Sign_up - Sign-out!"do
    it ":Sign-in(root)ページにvisitか" do
      visit "/users/sign_in"
      expect(page).to have_content 'Log in'
    end

    it ":Admin は Sign-upができるか" do
      sign_up_admin(@admin)
      expect(page).to have_content 'あなたの日報 一覧'
    end

    it ":Admin は Sign-outができるか" do
      sign_up_admin(@admin)
      within("//div[@class='site_header']")do
        click_button('Sign out')
      end
      expect(page).to have_content 'Log in'
    end

    it ":Admin は ユーザー情報ページを閲覧できるか" do
      visit_your_page_admin(@admin)
      expect(page).to have_content 'あなたのページ'
      expect(page).to have_content 'Name: capybara-san'
    end

    it ":Admin は ユーザー情報編集ページに行けるか" do
      visit_your_page_admin(@admin)
      click_link("Edit")

      expect(page).to have_content 'Editing user'
    end

    it ":Admin は ユーザー情報を編集できるか" do
      visit_your_page_admin(@admin)
      click_link("Edit")

      edited_name = "beevar"
      edited_pass = "beever_dam"

      fill_in('user_name', with: edited_name)
      fill_in('user_password', with: edited_pass)

      click_button('Update User')

      log_in_helper(@admin.email,edited_pass)

      visit "/your_page"

      expect(page).to have_content("Name: #{edited_name}")
    end


    it ":Adminは他のユーザーの一覧ページを閲覧できるか" do
      sign_up_admin(@admin)
      #そももリンクがあるのか

      within("//div[@class='site_header']") do
        expect(page).to have_content("User list(Admin)")
        click_link("User list(Admin)")
        #save_and_open_page
      end
      expect(page).to have_content("ユーザーリスト")

    end

    #TODO:ただでさえ普通にやるのも面倒なので、後回し。
    #it ":Adminは他のユーザの編集ができるか"

  end

end

describe "Report Case" do

  before(:all) do
    @admin = create_uniq_admin
    @report = create_simple_report
  end

  describe "Adminユーザーが日報を扱う"do
    it ":Adminは日報新規作成画面を閲覧できるか" do
      move_create_report_admin(@admin)
      #日報を書く画面にいるか?
      expect(page).to have_content 'New report'
      #page.save_screenshot "spec_#{timestamp_filename.png}"
    end

    it ":Adminは自分の日報を下書きで新規作成できるか" do
      move_create_report_admin(@admin)
      simple_create_and_save_report_without_public(@report)
      expect(page).to have_content("Report was successfully created.")
    end

    it ":Adminは自分の日報を公開で新規作成できるか" do
      move_create_report_admin(@admin)
      simple_create_and_save_report_with_public(@report)
      expect(page).to have_content("Report was successfully created.")
    end

    it ":Adminは日報を編集できるか" do
      move_create_report_admin(@admin)
      simple_create_and_save_report_with_public(@report)

      click_link("Edit")

      edited_text = "私はビーバーではないし、プレーリードックでもない。"
      fill_in('report_report_body_text', with: edited_text)

      click_button('save report')

      expect(page).to have_content("Report was successfully updated.")
      expect(page).to have_content(edited_text)
    end

    it ":Adminは日報を削除できるか" do
      move_create_report_admin(@admin)
      simple_create_and_save_report_with_public(@report)

      visit("report/#{@report.id}")

      expect(page).to have_content(@report.report_title)
      expect(page).to have_content(@report.report_body_text)
    end


  end
end
