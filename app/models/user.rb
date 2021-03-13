class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :games
  has_many :rentals
  has_many :incoming_rentals, through: :games, source: :rentals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
