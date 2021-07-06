require 'rails_helper'

describe VegetableGarden do
  describe 'relationships' do
    it {should belong_to(:vegetables)}
  end
end
