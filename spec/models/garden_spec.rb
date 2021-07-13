require 'rails_helper'

describe Garden do
  describe 'validations' do
    it {should have_many(:vegetables)}
  end

  describe 'instance method' do
    before :each do
      @garden_1 = Garden.create!(created_at: '03-05-2021', name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
      @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
      @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    end

    describe '#vegetable_count' do
      it 'returns the vegetable count for the garden' do
        expect(@garden_1.vegetable_count).to eq(2)
      end
    end 
  end
end
