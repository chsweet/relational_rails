class Vegetable < ApplicationRecord
  belongs_to :garden

  def self.perennial_vegetable
    where(perennial: true)
  end
#add downcase??
  def self.alphabatize
    order(:name)
  end

  def self.something
  end

end
