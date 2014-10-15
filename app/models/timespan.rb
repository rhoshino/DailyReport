class Timespan < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :start_time, :end_time, :rest_time, :user_id
  belongs_to :report
end
