require 'rails_helper'

RSpec.describe 'gardens index page', type: :feature do
  before :each do
    @garden_1 = Garden.create!(created_at: '03-05-2021', name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
    @garden_2 = Garden.create!(created_at: '01-05-2021', name: 'Shears Garden', weeded: true, hrs_of_sun: 10)
    @garden_3 = Garden.create!(created_at: '04-05-2021', name: 'Maupin Garden', weeded: false, hrs_of_sun: 6)
  end
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'can see all the name gardens' do
    visit "/gardens"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@garden_2.name)
    expect(page).to have_content(@garden_3.name)
  end

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it 'sorts gardens by most recently created and shows created date' do
    visit "/gardens"

    expect(@garden_2.name).to appear_before(@garden_3.name, only_text: true)
    expect(@garden_3.name).to_not appear_before(@garden_1.name, only_text: true)
  end

  it 'links to main vegetable index' do
    visit "/gardens"

    click_on("Vegetables Index")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/gardens"

    click_on("Gardens Index")

    expect(current_path).to eq("/gardens")
  end

  it 'links to the edit garden page' do
    visit '/gardens'

    click_link("Edit #{@garden_2.name}")

    expect(current_path).to eq("/gardens/#{@garden_2.id}/edit")
  end
end
