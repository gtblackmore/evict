class User < ActiveRecord::Base
  has_secure_password
  has_many :entities
  has_many :properties, through: :entities
end