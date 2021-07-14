class Director < ApplicationRecord
  has_many :movies, dependent: :destroy

  def movie_count
    movies.count
  end
end
