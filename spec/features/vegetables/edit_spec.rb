# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'

RSpec.describe 'the vegetable edit' do
  before :each do
    @garden = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 10)
    @tomato_1 = @garden.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
    @potato_1 = @garden.vegetables.create!(name: 'Yukon Gold', perennial: false, min_hrs_sun: 6)
  end

  it 'links to the edit page' do
    visit "/vegetables/#{@tomato_1.id}"

    click_button("Edit #{@tomato_1.name}")

    expect(current_path).to eq("/vegetables/#{@tomato_1.id}/edit")
  end

  it 'can edit the garden' do
    visit "/vegetables/#{@tomato_1.id}"

    expect(page).to have_content("Minimum of Sunlight: 8")

    click_button("Edit #{@tomato_1.name}")

    fill_in 'Minimum Hours of Sunlight', with: 9
    click_button 'Update Vegetable'

    expect(current_path).to eq("/vegetables/#{@tomato_1.id}")
    expect(page).to have_content("Minimum of Sunlight: 9")
  end
end
