class Landlord < ActiveRecord::Base
  has_many :properties
  has_many :landlord_users
end