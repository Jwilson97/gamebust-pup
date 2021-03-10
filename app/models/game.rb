class Game < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_title_and_category_and_console,
                  against: [
                    [:title, 'A'],
                    [:category, 'B'],
                    [:console, 'C']
                  ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
