# User story 14
require 'rails_helper'

RSpec.describe 'the vegetable edit' do
  before :each do
    Garden.destroy_all
    Vegetable.destroy_all
    @garden = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', perennial: false, min_hrs_sun: 6)
  end

  it 'links to the edit page' do
    visit "/vegetables/#{@tomato_1.id}"

    click_button("Edit #{@tomato_1.name}")

    expect(current_path).to eq("/vegetables/#{@tomato_1.id}/edit")
  end

  it 'can edit the garden' do
    visit "/vegetables/#{@tomato_1.id}"

    expect(page).to have_content("Minimum of Sunlight: 8")

    click_button("Edit #{@tomato_1.name}")

    fill_in 'Minimum Hours of Sunlight', with: 9
    click_button 'Update Vegetable'

    expect(current_path).to eq("/vegetables/#{@tomato_1.id}")
    expect(page).to have_content("Minimum of Sunlight: 9")
  end
end
