require 'rails_helper'

describe VegetableGarden do
  it {should have_many(:vegetables)}

  describe 'instance method' do
    describe '#vegetable_count' do
      before :each do
        @garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 15)
        @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', summer_harvest: true, winter_harvest: false, min_hrs_sun: 8)
        @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)
      end

      it 'returns the vegetable count for the garden' do
        expect(@garden_1.vegetable_count).to eq(2)
      end
    end
  end
end
