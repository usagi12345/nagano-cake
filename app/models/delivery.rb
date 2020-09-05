class Delivery < ApplicationRecord

  belongs_to :end_user
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
