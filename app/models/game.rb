class Game < ApplicationRecord
  belongs_to :user
  has_one :rental
  has_one_attached :photo
end
