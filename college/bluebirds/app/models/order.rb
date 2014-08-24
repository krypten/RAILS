class Order < ActiveRecord::Base
  belongs_to :Courier
  belongs_to :BillingInfo
  belongs_to :User

  has_many :Tickets

  validates :mode_of_collection, presence: true
  validates :quantity, :numericality => {greater_than: 0}
  validates :total_amount, :numericality => {greater_than: 0.0}

end
