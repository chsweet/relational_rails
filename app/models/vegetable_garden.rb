class VegetableGarden < ApplicationRecord
  has_many :vegetables

  def vegetable_count
    vegetables.count
  end
end
