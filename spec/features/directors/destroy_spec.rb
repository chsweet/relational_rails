require 'rails_helper'

RSpec.describe 'destroy' do
  before :each do
    @woody = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
    @manhattan = @woody.movies.create!(title: "Manhattan",
                                       oscar: false,
                                       nominations: 2)

    @annie = @woody.movies.create!(title: "Annie Hall",
                                   oscar: true,
                                   nominations: 3)
  end

  # User story 19
  it 'destroys the director and all of its movies' do
    visit "/directors/#{@woody.id}"

    click_link 'Delete Woody Allen'

    expect(current_path).to eq('/directors')

    expect(page).to_not have_content('Woody Allen')
  end
end
