# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'the garden edit' do
  before :each do
    @garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 15)
  end
  it 'links to the edit page' do
    visit "/vegetable_gardens/#{@garden_1.id}"

    click_button("Edit #{@garden_1.name}")

    expect(current_path).to eq("/vegetable_gardens/#{@garden_1.id}/edit")
  end

  it 'can edit the garden' do
    @garden_1 = VegetableGarden.create!(name: 'Sweet Garden', summer_garden: true, winter_garden: true, hrs_of_sun: 15)

    visit "/vegetable_gardens/#{@garden_1.id}"

    expect(page).to have_content("Winter Garden: true")

    click_button("Edit #{@garden_1.name}")

    fill_in 'Winter Garden', with: 'false'
    click_button 'Update Garden'

    expect(current_path).to eq("/vegetable_gardens/#{@garden_1.id}")
    expect(page).to have_content("Winter Garden: false")
  end
end
