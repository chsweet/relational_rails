require 'rails_helper'

describe Vegetable do
  describe 'validations' do
    it {should belong_to(:garden)}
  end

  describe 'instance method' do
    before :each do
      @garden_1 = Garden.create!(created_at: '03-05-2021', name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
      @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
      @potato_1 = @garden_1.vegetables.create!(name: 'Yukon Gold Potato', perennial: false, min_hrs_sun: 10)
      @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    end

    # describe '#perennial_vegetables' do
    #   it 'filters only perennial vegetables'do
    #     expect(@onion_1.perennial_vegetable).to eq(true)
    #   end
    # end

    # describe '#sort_vegetables' do
    #   xit 'sorts vegetables alphabeticaly' do
    #     expect(@tomato_1.name).to appear_before(@potato_1.name, only_text: true)
    #     expect(@potato_1.name).to_not appear_before(@onion_1.name, only_text: true)
    #   end
    # end
  end
end
