require 'rails_helper'

describe Vegetable do
  describe 'validations' do
    it {should belong_to(:garden)}
  end

  describe 'class method' do
    before :each do
      @garden_1 = Garden.create!(created_at: '03-05-2021', name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
      @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
      @potato_1 = @garden_1.vegetables.create!(name: 'Yukon Gold Potato', perennial: false, min_hrs_sun: 10)
      @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    end

    describe '#perennial_vegetables' do
      it 'filters only perennial vegetables'do
        expect(Vegetable.perennial_vegetable).to eq([@tomato_1, @onion_1])
      end
    end

    describe '#alphabatize' do
      it 'sorts vegetables alphabeticaly' do
        expect(Vegetable.alphabatize).to eq([@tomato_1, @onion_1, @potato_1])
      end
    end

    describe '#'
  end
end
