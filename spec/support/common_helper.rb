#coding:utf-8
def timestamp_filename(file)
  dir  = File.dirname(file)
  base = File.basename(file, ".*")
  time = Time.now.to_i  # or format however you like
  ext  = File.extname(file)
  File.join(dir, "#{base}_#{time}#{ext}")
end

def create_uniq_admin
  user =  FactoryGirl.build(:user,
                              name: "capybara-san",
                              password: "capybara",
                              email: "capybara@des.jp",
                              role: "admin")
  return user
end

def create_simple_report
  report = FactoryGirl.build(:report,
                              report_title: "capybara's_Report",
                              report_body_text: "ドーモ、カピバラです。")
  return report
end