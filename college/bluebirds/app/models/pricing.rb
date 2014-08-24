class Pricing < ActiveRecord::Base
  has_many :AudiInfos

  validates :seat_type, presence: true,
                        uniqueness: true
  validates :price , presence: true,
                     :numericality => {greater_than: 0.0}
end
