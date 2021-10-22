class User < ApplicationRecord
  has_many :buystocks
  has_many :stocks, through: :buystocks
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

end
