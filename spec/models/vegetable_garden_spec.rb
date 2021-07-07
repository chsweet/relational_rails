require 'rails_helper'

describe VegetableGarden do
  describe 'relationships' do
    it {should have_many(:vegetables)}
  end
end
