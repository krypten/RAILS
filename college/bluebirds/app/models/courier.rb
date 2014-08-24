class Courier < ActiveRecord::Base
  has_one :Order

  validates :receiver_name, :presence => true
  validates :contact_no, :presence => true
  validates :address, :presence => true

end
