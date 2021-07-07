require 'rails_helper'

RSpec.describe 'vegetables show page', type: :feature do

  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  it 'can see the name and attributes of specific vegetable id' do
    garden = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 10)
    onion_1 = garden.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)

    visit "/vegetables/#{onion_1.id}"

    expect(page).to have_content(onion_1.name)
    expect(page).to have_content("Summer Harvest: #{onion_1.summer_harvest}")
    expect(page).to have_content("Winter Harvest: #{onion_1.winter_harvest}")
    expect(page).to have_content("Minimum of Sunlight: #{onion_1.min_hrs_sun}")

  end
end