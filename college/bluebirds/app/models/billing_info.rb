class BillingInfo < ActiveRecord::Base
  belongs_to :CardInfo
  has_one :Order

  validates :bill_date, :presence => true
  
end
