#coding:utf-8

include ApplicationHelper


def create_uniq_admin
  user =  FactoryGirl.build(:user,
                              name: "capybara-san",
                              password: "capybara",
                              email: "capybara@des.jp",
                              role: "admin")
  return user
end


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

def write_report_admin(user)

end