class Report < ActiveRecord::Base
  attr_accessible :report_title,:report_body_text, :user_id,
                    :report_date
  belongs_to :user
end
