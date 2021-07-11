require 'rails_helper'

RSpec.describe 'vegetables index page', type: :feature do
  before :each do
    @garden = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', summer_harvest: true, winter_harvest: false, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', summer_harvest: false, winter_harvest: true, min_hrs_sun: 6)
  end
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'can see the name and attributes of all vegetables' do
    visit "/vegetables"
    # save_and_open_page
    expect(page).to have_content(@tomato_1.name)
    expect(page).to have_content("Summer Harvest: #{@tomato_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{@tomato_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{@tomato_1.min_hrs_sun}")
    expect(page).to have_content(@onion_1.name)
    expect(page).to have_content("Summer Harvest: #{@onion_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{@onion_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{@onion_1.min_hrs_sun}")
    expect(page).to have_content(@potato_1.name)
    expect(page).to have_content("Summer Harvest: #{@potato_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{@potato_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{@potato_1.min_hrs_sun}")
  end

  it 'links to main vegetable index' do
    visit "/vegetables"

    click_on("Vegetables Index")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/vegetables"

    click_on("Gardens Index")

    expect(current_path).to eq("/vegetable_gardens")
  end
end
