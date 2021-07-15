require 'rails_helper'

RSpec.describe 'destroy' do
  before :each do
    @director = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
    @movie_1 = @director.movies.create!(title: "Manhattan", oscar: false, nominations: 2)
    @movie_2 = @director.movies.create!(title: "Annie Hall", oscar: true, nominations: 3)
  end

  # User story 19
  it 'destroys the director and all of its movies' do
    visit "/directors/#{@director.id}"
    click_link 'Delete Woody Allen'

    expect(current_path).to eq('/directors')
    expect(page).to_not have_content('Woody Allen')
  end
end
