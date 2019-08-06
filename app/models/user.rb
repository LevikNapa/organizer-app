class User < ApplicationRecord
  has_many :lists
  has_secure_password #password validations taken care of with this.
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
