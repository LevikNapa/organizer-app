class User < ApplicationRecord
  has_many :lists
  has_secure_password #password validations taken care of with this.
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true


  def self.find_or_create_by_omniauth(auth_hash)
  #   oauth_username = auth_hash["info"]["name"]
  #   if user = User.find_by(:username => oauth_username)
  #     return user
  #
  #   else
  #     user = User.create(:username => "oauth_username", :password => SecureRandom.hex)
  #   end
  # end
    self.where(:username => auth_hash[:info][:nickname]).first_or_create do |user|
     user.password = SecureRandom.hex
    end
  end
end
