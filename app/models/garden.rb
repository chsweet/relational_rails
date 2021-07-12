class Garden < ApplicationRecord
  has_many :vegetables,
  dependent: :destroy

  def vegetable_count
    vegetables.count
  end

end
