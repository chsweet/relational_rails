require 'rails_helper'

RSpec.describe 'vegetable garden show vegetables page', type: :feature do
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
    it 'can see the name and attributes of all vegetables for a specific garden' do
    garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 15)
    garden_2 = VegetableGarden.create!(name: 'Shears Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 10)
    garden_3 = VegetableGarden.create!(name: 'Maupin Garden', summer_garden: false, winter_garden: true, hrs_of_sun: 6)

    tomato_1 = garden_1.vegetables.create!(name: 'Cherokee Purple', summer_harvest: true, winter_harvest: false, min_hrs_sun: 8)
    onion_1 = garden_1.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)
    potato_1 = garden_1.vegetables.create!(name: 'Yukon Gold', summer_harvest: false, winter_harvest: true, min_hrs_sun: 6)

    visit "/vegetable_gardens/#{garden_1.id}/vegetables"
    # save_and_open_page
    expect(page).to have_content(garden_1.name)
    expect(page).to have_content(tomato_1.name)
    expect(page).to have_content("Summer Harvest: #{tomato_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{tomato_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{tomato_1.min_hrs_sun}")
    expect(page).to have_content(onion_1.name)
    expect(page).to have_content("Summer Harvest: #{onion_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{onion_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{onion_1.min_hrs_sun}")
    expect(page).to have_content(potato_1.name)
    expect(page).to have_content("Summer Harvest: #{potato_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{potato_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{potato_1.min_hrs_sun}")

  end
end
