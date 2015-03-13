class User < ActiveRecord::Base
  has_secure_password
  has_many :lyrics
  validates_uniqueness_of :email
  validates_uniqueness_of :username
end