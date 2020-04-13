class User < ActiveRecord::Base
  has_secure_password
  has_many :entities
  has_many :properties, through: :entities
  validates_uniqueness_of :email
end