class Report < ActiveRecord::Base
  attr_accessible :report_title,:report_body_text, :user_id
  belongs_to :user
end
