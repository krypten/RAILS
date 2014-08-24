class Login < ActiveRecord::Base
  belongs_to :User

  validate :password_same

  def password_same
  	if (self.password_hash != self.password_salt)
  		errors.add(:password_salt, "Password do not match")
  	end
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == password#BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
