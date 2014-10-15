class Report < ActiveRecord::Base
  attr_accessible :report_title,:report_body_text, :user_id,
                    :report_date, :worktimes_attributes
  belongs_to :user
  has_many :worktimes
  #has_many :Resttime

  accepts_nested_attributes_for :worktimes
end
