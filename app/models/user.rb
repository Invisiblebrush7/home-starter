class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, uniqueness: { scope: :last_name }, length: { minimum: 3 }
  validates :last_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, length: { in: 6..20 }
  validates :shipping_address, presence: true
  validates :phone_number, presence: true, format: { with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/, message: "must be in xxx-xxx-xxxx format." }
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  has_many :furnitures
  has_many :bookings
  has_many :bundles_offers
end
