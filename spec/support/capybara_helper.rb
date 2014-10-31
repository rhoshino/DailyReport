#coding:utf-8

include ApplicationHelper

def sign_in_admin(user)
  visit "/users/sign_in"
end

def sign_up_admin(user)
  visit "/users/sign_in"
  click_link("Sign up")

  fill_in('user_name', with: @admin.name)
  fill_in('user_email', with: @admin.email)
  fill_in('user_password', with: @admin.password)
  fill_in('user_password_confirmation', with: @admin.password)
  check('user_role')
  click_button("Sign up")
end

def visit_your_page_admin(user)
  sign_up_admin(user)
  visit "/your_page"
  # within("//div[@class='site_header']")do
  #   click_button('ユーザー情報')
  # end
end

def log_in_helper(email,password)
  fill_in("user_email", with: email)
  fill_in("user_password", with: password)
  click_button('Log in')
end

def move_create_report_admin(user)
  sign_up_admin(user)
   within("//div[@class='horizontal_controller'][1]/div[@class='horizontal_left_button'][1]")do
      click_button('Create Report')
    end
end

def simple_create_and_save_report_without_public(report)

  fill_in("report_report_title", with: @report.report_title)
  fill_in("report_report_body_text", with: @report.report_body_text)

  click_button('save report')
end

def simple_create_and_save_report_with_public(report)

  fill_in("report_report_title", with: @report.report_title)
  fill_in("report_report_body_text", with: @report.report_body_text)
  check('report_public_flag')

  click_button('save report')
end