class Movie < ActiveRecord::Base
  has_many :Viewings

  validates :movie_name,  presence: true
  validates :certificate, presence: true
  validates :image_url,   presence: true
  
end
