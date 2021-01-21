class Booking < ApplicationRecord
  belongs_to :bundle_offer
  belongs_to :user
end
