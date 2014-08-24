class AudiInfo < ActiveRecord::Base
  belongs_to :Pricing

  has_many :Viewings

  validates :screen_no, :presence => true
  validates :seat_no, :presence => true
end