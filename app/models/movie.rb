class Movie < ApplicationRecord
  belongs_to :director

  def self.true_oscar
    where(oscar: true)
  end

  def self.alphabetize
    order(:title)
  end
end
