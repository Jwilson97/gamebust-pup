class Rental < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :status, inclusion: { in: [pending, approved, declined] }
end
