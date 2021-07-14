require 'rails_helper'
#User story 11
RSpec.describe 'new garden creation' do
  it 'links to the new page from the artist index' do
    visit '/gardens'

    click_link("New Garden")

    expect(current_path).to eq('/gardens/new')
  end

  it 'can create a new vegetable garden' do
    visit '/gardens/new'

    fill_in('Name', with: '39th Street Garden')
    page.check('Weeded')
    fill_in('Hours of Sun', with: '12')
    click_button('Create Garden')

    expect(current_path).to eq('/gardens')
    expect(page).to have_content('39th Street Garden')
  end
end
