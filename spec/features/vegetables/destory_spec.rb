# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'

RSpec.describe 'destroy vegetable', type: :feature do
  before :each do
    @garden = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: false, hrs_of_sun: 10)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', summer_harvest: true, winter_harvest: true, min_hrs_sun: 14)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', summer_harvest: true, winter_harvest: false, min_hrs_sun: 8)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', summer_harvest: false, winter_harvest: true, min_hrs_sun: 6)
  end

  it 'can delete vegetable from index page' do
    visit "/vegetables/#{@potato_1.id}"

    click_link 'Delete Vegetable'

    expect(current_path).to eq('/vegetables')
    expect(page).to_not have_content('Yokon Gold')
  end
end
