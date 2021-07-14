#User story 13
require 'rails_helper'

RSpec.describe 'new vegetable creation' do
  before :each do
    Garden.destroy_all
    Vegetable.destroy_all
    @garden_1 = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
  end

  it 'links to the new vegetable page' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_link("Add Vegetable")

    expect(current_path).to eq("/gardens/#{@garden_1.id}/vegetables/new")
  end

  it 'can add a new vegetable to the garden' do
    visit "/gardens/#{@garden_1.id}/vegetables/new"

    fill_in('Name', with: 'Onion')
    page.uncheck('Perennial')
    fill_in('Minimum Hours of Sun', with: 8)
    click_button('Create New Vegetable')

    expect(current_path).to eq("/gardens/#{@garden_1.id}/vegetables")
    expect(page).to have_content("Vegetable: Onion")
  end
end
