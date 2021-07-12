require 'rails_helper'

RSpec.describe 'vegetables show page', type: :feature do
  before :each do
    @garden = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', perennial: false, min_hrs_sun: 6)
  end
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'can see the name and attributes of specific vegetable id' do
    visit "/vegetables/#{@onion_1.id}"

    expect(page).to have_content(@onion_1.name)
    expect(page).to have_content("Perennial: #{@onion_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@onion_1.min_hrs_sun}")
  end

  it 'links to main vegetable index' do
    visit "/vegetables/#{@onion_1.id}"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/vegetables/#{@onion_1.id}"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end
end
