require 'rails_helper'

RSpec.describe 'vegetable garden show page', type: :feature do
  before :each do
    @garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 15)
    @garden_2 = VegetableGarden.create!(name: 'Shears Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 10)
    @garden_3 = VegetableGarden.create!(name: 'Maupin Garden', summer_garden: false, winter_garden: true, hrs_of_sun: 6)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', summer_harvest: true, winter_harvest: false, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)
  end
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'can see the name and attributes of specific vegetable garden id' do
    visit "/vegetable_gardens/#{@garden_1.id}"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content("Summer Garden: #{@garden_1.summer_garden}")
    expect(page).to have_content("Winter Garden: #{@garden_1.winter_garden}")
    expect(page).to have_content("Hours of Sunlight: #{@garden_1.hrs_of_sun}")
  end
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'shows vegetable count' do
    visit "/vegetable_gardens/#{@garden_1.id}"

    expect(page).to have_content("Number of Vegetabels: #{@garden_1.vegetable_count}")
  end

  it 'links to main vegetable index' do
    visit "/vegetable_gardens/#{@garden_1.id}"

    click_on("Vegetables Index")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/vegetable_gardens/#{@garden_1.id}"

    click_on("Gardens Index")

    expect(current_path).to eq("/vegetable_gardens")
  end

  it 'links to main vegetable index' do
    visit "/vegetable_gardens/#{@garden_1.id}"

    click_on("Garden Vegetables Index")

    expect(current_path).to eq("/vegetable_gardens/#{@garden_1.id}/vegetables")
  end
end
