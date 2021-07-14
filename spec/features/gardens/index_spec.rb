require 'rails_helper'

RSpec.describe 'gardens index page', type: :feature do
  before :each do
    Garden.destroy_all
    @garden_1 = Garden.create!(created_at: '03-05-2021', name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)
    @garden_2 = Garden.create!(created_at: '01-05-2021', name: 'Shears Garden', weeded: true, hrs_of_sun: 10)
    @garden_3 = Garden.create!(created_at: '04-05-2021', name: 'Maupin Garden', weeded: false, hrs_of_sun: 6)
  end

  #User Story 1
  it 'can see all the gardens names' do
    visit "/gardens"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@garden_2.name)
    expect(page).to have_content(@garden_3.name)
  end

  # User story 6
  it 'sorts gardens by most recently created and shows created date' do
    visit "/gardens"

    expect(@garden_2.name).to appear_before(@garden_3.name, only_text: true)
    expect(@garden_3.name).to_not appear_before(@garden_1.name, only_text: true)
  end

  # User story 8
  it 'links to main vegetable index' do
    visit "/gardens"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

 # User story 9
  it 'links to main garden index' do
    visit "/gardens"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  #User story 17
  it 'links to the edit garden page' do
    visit '/gardens'

    click_link("Edit #{@garden_2.name}")

    expect(current_path).to eq("/gardens/#{@garden_2.id}/edit")
  end

  #User story 22
  it 'link to delete garden' do
    visit '/gardens'

    click_link("Delete #{@garden_2.name}")

    expect(current_path).to eq("/gardens")
    expect(page).to_not have_content(@garden_2.name)
  end
end
