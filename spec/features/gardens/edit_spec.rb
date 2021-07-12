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
    @garden_3 = Garden.create!(name: 'Maupin Garden', weeded: false, hrs_of_sun: 6)
  end
  it 'links to the edit page' do
    visit "/gardens/#{@garden_3.id}"

    click_button("Edit #{@garden_3.name}")

    expect(current_path).to eq("/gardens/#{@garden_3.id}/edit")
  end

  it 'can edit the garden' do
    visit "/gardens/#{@garden_3.id}"

    expect(page).to have_content("Weeded: false")

    click_button("Edit #{@garden_3.name}")

    fill_in 'Weeded', with: 'true'
    click_button 'Update Garden'

    expect(current_path).to eq("/gardens/#{@garden_3.id}")
    expect(page).to have_content("Weeded: true")
  end
end
