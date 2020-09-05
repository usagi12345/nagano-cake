class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	validates :first_name, presence: true
	validates :first_name_kana, presence: true
	validates :last_name, presence: true
	validates :last_name_kana, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :is_deleted, presence: true
	validates :phone, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy


end