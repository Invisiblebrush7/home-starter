class Booking < ApplicationRecord
  belongs_to :bundles_offer
  belongs_to :user
end
