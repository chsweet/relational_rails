# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

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
