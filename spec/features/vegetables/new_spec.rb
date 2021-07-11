# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'new vegetable creation' do
  before :each do
    @garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 15)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', summer_harvest: true, winter_harvest: false, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)
  end

  it 'links to the new vegetable page' do
    visit "/vegetable_gardens/#{@garden_1.id}/vegetables"

    click_link("Add Vegetable")

    expect(current_path).to eq("/vegetable_gardens/#{@garden_1.id}/vegetables/new")
  end

  it 'can add a new vegetable to the garden' do
    visit "/vegetable_gardens/#{@garden_1.id}/vegetables/new"

    fill_in('Name', with: 'Onion')
    fill_in('Summer Harvest', with: 'false')
    fill_in('Winter Harvest', with: 'true')
    fill_in('Minimum Hours of Sun', with: 8)
    click_button('Create New Vegetable')

    expect(current_path).to eq("/vegetable_gardens/#{@garden_1.id}/vegetables")
    expect(page).to have_content("Vegetable: Onion")
  end
end
