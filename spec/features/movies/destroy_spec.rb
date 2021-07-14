require 'rails_helper'

RSpec.describe 'destroy' do

  #User story 20
  it 'deletes that movie and its attributes' do
    tarantino = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
    pulp_fiction = tarantino.movies.create!(title: "Pulp Fiction",
                                            oscar: true,
                                            nominations: 7)

    visit "/movies/#{pulp_fiction.id}"
    click_link 'Delete Pulp Fiction'

    expect(current_path).to eq('/movies')
    expect(page).to_not have_content('Pulp Fiction')
  end
end
