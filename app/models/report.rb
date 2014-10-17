class Report < ActiveRecord::Base
  attr_accessible :report_title,:report_body_text, :user_id,
                    :report_date, :public_flag,
                    :worktimes_attributes
  belongs_to :user
  has_many :worktimes
  #has_many :Resttime

  accepts_nested_attributes_for :worktimes

  validates :report_title, :report_body_text, presence: true

  def public_flag?
      public_flag == true
  end
end
