require 'rails_helper'

RSpec.describe 'destroy' do

  #User story 20
  it 'deletes that movie and its attributes' do
    director = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
    movie = director.movies.create!(title: "Pulp Fiction", oscar: true, nominations: 7)

    visit "/movies/#{movie.id}"
    click_link 'Delete Pulp Fiction'

    expect(current_path).to eq('/movies')
    expect(page).to_not have_content('Pulp Fiction')
  end
end
