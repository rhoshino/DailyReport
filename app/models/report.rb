class Report < ActiveRecord::Base
  attr_accessible :reportTitle,:reportBodyText,:reportAuthorID
  belongs_to :user
end
