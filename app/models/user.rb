class User < ApplicationRecord
  has_many :lists
  has_secure_password #password validations taken care of with this.
  validates :username, presence: true
  validates :username, :email, uniqueness: true


  def self.from_omniauth(auth)
       self.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |u|
        u.username = auth.info.nickname unless u.username != nil
        u.password = SecureRandom.hex   unless u.password != nil
        u.save!
    end
  end
end
