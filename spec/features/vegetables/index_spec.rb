require 'rails_helper'

RSpec.describe 'vegetables index page', type: :feature do
  before :each do
    @garden = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', perennial: false, min_hrs_sun: 6)
  end
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'can see the name and attributes of all vegetables' do
    visit "/vegetables"
    # save_and_open_page
    expect(page).to have_content(@tomato_1.name)
    expect(page).to have_content("Perennial: #{@tomato_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@tomato_1.min_hrs_sun}")
    expect(page).to have_content(@onion_1.name)
    expect(page).to have_content("Perennial: #{@onion_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@onion_1.min_hrs_sun}")
    expect(page).to have_content(@potato_1.name)
    expect(page).to have_content("Perennial: #{@potato_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@potato_1.min_hrs_sun}")
  end

  it 'links to main vegetable index' do
    visit "/vegetables"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/vegetables"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  it 'links to edit vegetable page' do
    visit "/vegetables"

    click_on("Edit #{@onion_1.name}")

    expect(current_path).to eq("/vegetables/#{@onion_1.id}/edit")
  end
end
