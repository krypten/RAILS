class Viewing < ActiveRecord::Base
  belongs_to :Movie
  belongs_to :AudiInfo

  has_one :Ticket

  validates :timing, presence: true

end
