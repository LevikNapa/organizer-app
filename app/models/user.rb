class User < ApplicationRecord
  has_many :lists
  has_secure_password #password validations taken care of with this.
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true


  # def self.find_or_create_by_omniauth(auth)
  #      self.find_or_create_by(username: auth[:info][:email]) do |u|
  #       u.password = SecureRandom.hex
  #   end
  # end
end
