# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'vegetable garden show page', type: :feature do
  before :each do
    @garden_1 = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
    @garden_2 = Garden.create!(name: 'Shears Garden', weeded: true, hrs_of_sun: 10)
    @garden_3 = Garden.create!(name: 'Maupin Garden', weeded: false, hrs_of_sun: 6)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
  end

  it 'can delete garden and all vegetables' do
    visit "/gardens/#{@garden_1.id}"

    click_link "Delete Garden"

    expect(current_path).to eq("/gardens")
    expect(page).to_not have_content("Sweet Garden")
    expect(page).to have_content("Maupin Garden")
  end
end
