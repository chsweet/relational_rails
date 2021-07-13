class Vegetable < ApplicationRecord
  belongs_to :garden

  def self.perennial_vegetable
    self.where(perennial: true)
  end
end
