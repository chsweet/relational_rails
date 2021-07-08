require 'rails_helper'

RSpec.describe 'vegetable_gardens index page', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
    it 'can see the name vegetable_gardens' do
    garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 15)
    garden_2 = VegetableGarden.create!(name: 'Shears Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 10)
    garden_3 = VegetableGarden.create!(name: 'Maupin Garden', summer_garden: false, winter_garden: true, hrs_of_sun: 6)

    visit "/vegetable_gardens"
    # save_and_open_page
    expect(page).to have_content(garden_1.name)
    expect(page).to have_content(garden_2.name)
    expect(page).to have_content(garden_3.name)
  end
end
