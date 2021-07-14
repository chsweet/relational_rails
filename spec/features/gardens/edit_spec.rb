#User story 12
require 'rails_helper'

RSpec.describe 'the garden edit' do
  before :each do
    Garden.destroy_all
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

    page.check('Weeded')
    click_button 'Update Garden'

    expect(current_path).to eq("/gardens/#{@garden_3.id}")
    expect(page).to have_content("Weeded: true")
  end
end
