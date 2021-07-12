require 'rails_helper'

RSpec.describe 'vegetable garden vegetables index' do
  before :each do
    @garden_1 = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
  end
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'can see the name and attributes of all vegetables for a specific garden' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@tomato_1.name)
    expect(page).to have_content("Perennial: #{@tomato_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@tomato_1.min_hrs_sun}")
    expect(page).to have_content(@onion_1.name)
    expect(page).to have_content("Perennial: #{@onion_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@onion_1.min_hrs_sun}")
  end

  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  it 'links to edit vegetable page' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_on("Edit #{@onion_1.name}")

    expect(current_path).to eq("/vegetables/#{@onion_1.id}/edit")
  end
end
