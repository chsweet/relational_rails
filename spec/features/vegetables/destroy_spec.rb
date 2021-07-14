# User story 20
require 'rails_helper'

RSpec.describe 'destroy vegetable', type: :feature do
  before :each do
    Garden.destroy_all
    Vegetable.destroy_all
    @garden = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', perennial: false, min_hrs_sun: 6)
  end

  it 'can delete vegetable from index page' do
    visit "/vegetables/#{@potato_1.id}"

    click_link 'Delete Vegetable'

    expect(current_path).to eq('/vegetables')
    expect(page).to_not have_content('Yokon Gold')
  end
end
