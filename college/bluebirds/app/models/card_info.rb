class CardInfo < ActiveRecord::Base
  has_many :BillingInfos

  validates :card_no, :presence => true,
                      :length => {is: 16},
                      :numericality => { only_integer: true}
  validates :card_holdername, :presence => true
  validate :card_expiration_date_cant_be_in_past

  validates :card_pin, :presence => true,
                       :length => {maximum: 3},
                       :numericality => {only_integer: true}


  def card_expiration_date_cant_be_in_past
    if card_exp_date.present? && card_exp_date < Date.today
      errors.add(:card_exp_date, "can't be in the past or not present")
    end
  end

end
