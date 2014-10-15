class Timespan < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :report
  attr_accessible :start_time, :end_time
end
