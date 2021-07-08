require 'rails_helper'

RSpec.describe 'vegetable garden show page', type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  it 'can see the name and attributes of specific vegetable garden id' do
    garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 15)
    garden_2 = VegetableGarden.create!(name: 'Shears Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 10)
    garden_3 = VegetableGarden.create!(name: 'Maupin Garden', summer_garden: false, winter_garden: true, hrs_of_sun: 6)

    visit "/vegetable_gardens/#{garden_1.id}"
    # save_and_open_page
    expect(page).to have_content(garden_1.name)
    expect(page).to have_content("Summer Garden: #{garden_1.summer_garden}")
    expect(page).to have_content("Winter Garden: #{garden_1.winter_garden}")
    expect(page).to have_content("Hours of Sunlight: #{garden_1.hrs_of_sun}")

  end
end
