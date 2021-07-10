require 'rails_helper'

RSpec.describe 'Directors movies index' do
  it 'shows all of the movies and their attributes for that director' do
    woody = Director.create!(name: "Woody Allen")
    manhattan = woody.movies.create!(title: "Manhattan",
                                        oscar: false,
                                        nominations: 2)

    annie = woody.movies.create!(title: "Annie Hall",
                                    oscar: true,
                                    nominations: 3)

    visit "/directors/#{woody.id}/movies"

    expect(page).to have_content(manhattan.title)
    expect(page).to have_content(annie.title)
  end
end
