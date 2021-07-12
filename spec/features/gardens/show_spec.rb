require 'rails_helper'

RSpec.describe 'vegetable garden show page', type: :feature do
  before :each do
    @garden_1 = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
    @garden_2 = Garden.create!(name: 'Shears Garden', weeded: true, hrs_of_sun: 10)
    @garden_3 = Garden.create!(name: 'Maupin Garden', weeded: false, hrs_of_sun: 6)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
  end
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'can see the name and attributes of specific vegetable garden id' do
    visit "/gardens/#{@garden_1.id}"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content("Weeded: #{@garden_1.weeded}")
    expect(page).to have_content("Hours of Sunlight: #{@garden_1.hrs_of_sun}")
  end
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it 'shows vegetable count' do
    visit "/gardens/#{@garden_1.id}"

    expect(page).to have_content("Number of Vegetables: #{@garden_1.vegetable_count}")
  end

  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}"

    click_on("Garden Vegetables Index")

    expect(current_path).to eq("/gardens/#{@garden_1.id}/vegetables")
  end
end
