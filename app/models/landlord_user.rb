class LandlordUser < ActiveRecord::Base
  has_secure_password
  belongs_to :landlord
end