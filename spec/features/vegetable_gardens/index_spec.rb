require 'rails_helper'

RSpec.describe 'vegetable_gardens index page', type: :feature do
  before :each do
    # destroy.all
    @garden_1 = VegetableGarden.create!(created_at: '03-05-2021', name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 15)
    @garden_2 = VegetableGarden.create!(created_at: '01-05-2021', name: 'Shears Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 10)
    @garden_3 = VegetableGarden.create!(created_at: '04-05-2021', name: 'Maupin Garden', summer_garden: false, winter_garden: true, hrs_of_sun: 6)
  end
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'can see the name vegetable_gardens' do
    visit "/vegetable_gardens"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@garden_2.name)
    expect(page).to have_content(@garden_3.name)
  end

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it 'sorts gardens by most recently created and shows created date' do
    visit "/vegetable_gardens"

    expect(@garden_2.name).to appear_before(@garden_3.name, only_text: true)
    expect(@garden_3.name).to_not appear_before(@garden_1.name, only_text: true)
  end

  it 'links to main vegetable index' do
    visit "/vegetable_gardens"

    click_on("Vegetables Index")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/vegetable_gardens"

    click_on("Gardens Index")

    expect(current_path).to eq("/vegetable_gardens")
  end

end
