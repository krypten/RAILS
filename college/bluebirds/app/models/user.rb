class User < ActiveRecord::Base
  has_one :Login
  has_many :Orders

  EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :name, presence: true
  validates :email, confirmation: true,
                    presence: true,
                    uniqueness: true, on: :create,
                    :format => { :with => EMAIL_REGEX, :multiline => true },
                    :length => { :maximum => 100 }

  validates :email_confirmation, presence: true
  validates :contact_no, presence:true

  
end
