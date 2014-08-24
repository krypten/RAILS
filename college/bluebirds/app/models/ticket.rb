class Ticket < ActiveRecord::Base
  belongs_to :Viewing
  belongs_to :Order

  validate :show_date_cant_be_before_release

  def show_date_cant_be_before_release
  	if self.show_date < self.Viewing.Movie.release_date
  		errors.add(:show_date, "Date before release date")
  		puts("ERROR : Date before release date")
  	end
  end
end
