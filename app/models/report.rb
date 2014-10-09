class Report < ActiveRecord::Base
  attr_accessible :reportTitle,:reportBodyText,:reportAuthorID, :user_id
  belongs_to :user
end
