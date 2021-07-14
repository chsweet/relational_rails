require 'rails_helper'

RSpec.describe 'vegetables index page', type: :feature do
  before :each do
    Garden.destroy_all
    Vegetable.destroy_all
    @garden = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', perennial: false, min_hrs_sun: 6)
  end

  # User story 3 & 15
  it 'can see the name and attributes of all vegetables that are perennials' do
    visit "/vegetables"

    expect(page).to have_content(@tomato_1.name)
    expect(page).to have_content("Perennial: #{@tomato_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@tomato_1.min_hrs_sun}")
    expect(page).to have_content(@onion_1.name)
    expect(page).to have_content("Perennial: #{@onion_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@onion_1.min_hrs_sun}")
    expect(page).to_not have_content(@potato_1.name)
    expect(page).to_not have_content("Perennial: #{@potato_1.perennial}")
    expect(page).to_not have_content("Minimum of Sunlight: #{@potato_1.min_hrs_sun}")
  end

  # User story 8
  it 'links to main vegetable index' do
    visit "/vegetables"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  #User story 9
  it 'links to main vegetable index' do
    visit "/vegetables"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  #User story 18
  it 'links to edit vegetable page' do
    visit "/vegetables"

    click_on("Edit #{@onion_1.name}")

    expect(current_path).to eq("/vegetables/#{@onion_1.id}/edit")
  end

  #User story 23
  it 'link to delete vegetable' do
    visit '/vegetables'

    click_link("Delete #{@onion_1.name}")

    expect(current_path).to eq("/vegetables")
    expect(page).to_not have_content(@onion_1.name)
  end
end
