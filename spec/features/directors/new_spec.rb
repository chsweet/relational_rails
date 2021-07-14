require 'rails_helper'

RSpec.describe 'New Director' do
  describe 'As a visitor' do
    describe 'When I visit the new director form by clicking a link on the index' do
      it 'I can create a new director' do
        visit '/directors'
        click_link 'New Director'

        expect(current_path).to eq('/directors/new')

        fill_in 'Name', with: 'Wes Anderson'
        fill_in 'Nominations', with: 7
        click_on 'Create Director'

        expect(current_path).to eq("/directors")
        expect(page).to have_content('Wes Anderson')
      end
    end
  end
end
