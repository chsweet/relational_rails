require 'rails_helper'

RSpec.describe 'garden show page', type: :feature do
  before :each do
    Garden.destroy_all
    Vegetable.destroy_all
    @garden_1 = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
    @garden_2 = Garden.create!(name: 'Shears Garden', weeded: true, hrs_of_sun: 10)
    @garden_3 = Garden.create!(name: 'Maupin Garden', weeded: false, hrs_of_sun: 6)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
  end

  #User story 2
  it 'can see the name and attributes of specific vegetable garden id' do
    visit "/gardens/#{@garden_1.id}"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content("Weeded: #{@garden_1.weeded}")
    expect(page).to have_content("Hours of Sunlight: #{@garden_1.hrs_of_sun}")
  end

  # User story 7
  it 'shows vegetable count' do
    visit "/gardens/#{@garden_1.id}"

    expect(page).to have_content("Number of Vegetables: #{@garden_1.vegetable_count}")
  end

  # User story 8
  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  # User story 9
  it 'links to main garden index' do
    visit "/gardens/#{@garden_1.id}"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  #User story 10
  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}"

    click_on("Garden Vegetables Index")

    expect(current_path).to eq("/gardens/#{@garden_1.id}/vegetables")
  end
end
