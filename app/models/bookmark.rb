# app/models/bookmark.rb
class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }

  # Custom validation for uniqueness of movie/list combination
  validate :unique_movie_list_combination

  private

  # Custom validation method to ensure uniqueness of movie/list combination
  def unique_movie_list_combination
    if Bookmark.exists?(list_id: list_id, movie_id: movie_id)
      errors.add(:base, 'Bookmark for this movie/list combination already exists')
    end
  end
end
