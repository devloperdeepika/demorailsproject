class Stock < ApplicationRecord
  # belongs_to :user 
  has_many :buystocks
  has_many :users, through: :buystocks
  has_one_attached :image
  validates :name, :price, presence: true
end