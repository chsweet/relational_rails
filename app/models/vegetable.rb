class Vegetable < ApplicationRecord
  belongs_to :garden

  def self.perennial_vegetable
    where(perennial: true)
  end

#add downcase?? 
  def self.sort_alphabetical
    order(:name)
  end
end
