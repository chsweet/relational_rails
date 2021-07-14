require 'rails_helper'

RSpec.describe 'garden vegetables index' do
  before :each do
    Garden.destroy_all
    Vegetable.destroy_all
    @garden_1 = Garden.create!(name: 'Sweet Garden', weeded: true, hrs_of_sun: 15)

    @tomato_1 = @garden_1.vegetables.create!(name: 'Cherokee Purple', perennial: true, min_hrs_sun: 8)
    @potato_1 = @garden_1.vegetables.create!(name: 'Yukon Gold Potato', perennial: false, min_hrs_sun: 10)
    @onion_1 = @garden_1.vegetables.create!(name: 'Sweet Yellow Onion', perennial: true, min_hrs_sun: 14)
  end

  #User story 5
  it 'can see the name and attributes of all vegetables for a specific garden' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@tomato_1.name)
    expect(page).to have_content("Perennial: #{@tomato_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@tomato_1.min_hrs_sun}")
    expect(page).to have_content(@onion_1.name)
    expect(page).to have_content("Perennial: #{@onion_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@onion_1.min_hrs_sun}")
    expect(page).to have_content(@potato_1.name)
    expect(page).to have_content("Perennial: #{@potato_1.perennial}")
    expect(page).to have_content("Minimum of Sunlight: #{@potato_1.min_hrs_sun}")
  end

  # User story 8
  it 'links to main vegetable index' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_on("Vegetables")

    expect(current_path).to eq("/vegetables")
  end

  # User story 9
  it 'links to main garden index' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_on("Gardens")

    expect(current_path).to eq("/gardens")
  end

  it 'links to edit vegetable page' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_on("Edit #{@onion_1.name}")

    expect(current_path).to eq("/vegetables/#{@onion_1.id}/edit")
  end

  #User story 16
  it 'has link to sort vegetables alphabeticaly' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    click_link("Sort Vegetables")

    expect(current_path).to eq("/gardens/#{@garden_1.id}/vegetables")
    expect(@tomato_1.name).to appear_before(@potato_1.name, only_text: true)
    expect(@potato_1.name).to_not appear_before(@onion_1.name, only_text: true)
  end

  #User story 21
  it 'has form to return vegetables with more sunlight needed than number input' do
    visit "/gardens/#{@garden_1.id}/vegetables"

    fill_in("Hours of Sunlight", with: 9)
    click_on('Filter by hours of sun')

    expect(current_path).to eq("/gardens/#{@garden_1.id}/vegetables")
    expect(page).to have_content(@potato_1.name)
    expect(page).to_not have_content(@tomato_1.name)
    expect(page).to have_content(@onion_1.name)
  end
end
