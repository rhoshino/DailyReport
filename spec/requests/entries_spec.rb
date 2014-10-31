# #coding:utf-8

# require 'spec_helper'
# #require 'capybara/rails'

# describe "Capybara\'s Sign in" do
#     before :each do
#       user = FactoryGirl.build(:user,
#                                 name: "capybara-san",
#                                 password: "capybara",
#                                 email: "capybara@des.jp")
#     end

#   it "Capybnara is Visit in Report App" do
#     visit "/users/sign_in"
#     #save_and_open_page
#   end

#   it "Find Title Text. " do
#     visit "/users/sign_in"
#     expect(page).to have_content '日報アプリケーション'
#   end


#   context "trySign_up Capybara with out admin" do
#     it "Sign_Up to Sign out"do
#       user = FactoryGirl.build(:user,
#                                 name: "capybara-san",
#                                 password: "capybara",
#                                 email: "capybara@des.jp")
#       visit "/users/sign_in"

#       click_link("Sign up")

#       #expect(page).to have_content 'Sign up'
#       #save_and_open_page
#       fill_in('user_name', with: user.name)
#       fill_in('user_email', with: user.email)
#       fill_in('user_password', with: user.password)
#       fill_in('user_password_confirmation', with: user.password)

#       click_button("Sign up")
#       expect(page).to have_content 'あなたの日報 一覧'
#       click_button("Sign out")
#       expect(page).to have_content 'Log in'
#     end

#   end

# end

# describe "Admin User" do
#   describe "Sign_Up - Sign_Out" do
#   end

# end