class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bundles_offers
end
