class Delivery < ApplicationRecord

  belongs_to :end_user
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def delivery_all
    "#{postal_code}  #{address}  #{name}"
  end

end
