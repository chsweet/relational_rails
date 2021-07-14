require 'rails_helper'

RSpec.describe "movies index page", type: :feature do
  it "displays all titles and their attributes" do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                           oscar: true,
                           nominations: 7)

    movie_2 = director.movies.create!(title: "Kill Bill: Volume 1",
                           oscar: false,
                           nominations: 0)

    visit "/movies"

    expect(page).to have_content(movie_1.title)
    expect(page).to_not have_content(movie_2.title)
    expect(page).to have_content("Has Oscar: #{movie_1.oscar}")
    expect(page).to_not have_content("Has Oscar: #{movie_2.oscar}")
    expect(page).to have_content("Nominations: #{movie_1.nominations}")
    expect(page).to_not have_content("Nominations: #{movie_2.nominations}")
  end

  it 'displays a link to the movies index page' do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                           oscar: true,
                           nominations: 7)

    movie_2 = director.movies.create!(title: "Kill Bill: Volume 1",
                           oscar: false,
                           nominations: 0)

    visit '/directors'
    click_on('Movies')

    expect(current_path).to eq('/movies')
  end

  it 'displays a link to the directors index page' do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                           oscar: true,
                           nominations: 7)

    movie_2 = director.movies.create!(title: "Kill Bill: Volume 1",
                           oscar: false,
                           nominations: 0)

    visit '/directors'
    click_on('Directors')

    expect(current_path).to eq('/directors')
  end

  # User Story 15
  it 'only shows movies who have been awarded oscars' do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                                      oscar: true,
                                      nominations: 7)

    movie_2 = director.movies.create!(title: "Kill Bill: Volume 1",
                                      oscar: false,
                                      nominations: 0)

    movie_3 = director.movies.create!(title: "Django Unchained",
                                      oscar: true,
                                      nominations: 5)

    visit '/movies'

    expect(page).to have_content("Pulp Fiction")
    expect(page).to_not have_content("Kill Bill: Volume 1")
    expect(page).to have_content("Django Unchained")
  end

  #User Story 18
  it 'each movie has an edit link' do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                                      oscar: true,
                                      nominations: 7)

    movie_2 = director.movies.create!(title: "Kill Bill: Volume 1",
                                      oscar: false,
                                      nominations: 0)

    movie_3 = director.movies.create!(title: "Django Unchained",
                                      oscar: true,
                                      nominations: 5)

    visit '/movies'

    expect(page).to have_content("Edit Pulp Fiction")
    expect(page).to_not have_content("Edit Kill Bill: Volume 1")
    expect(page).to have_content("Edit Django Unchained")

    click_on 'Edit Pulp Fiction'
    expect(current_path).to eq("/movies/#{movie_1.id}/edit")

    fill_in 'Nominations', with: 20
    page.check 'Oscar'
    click_on 'Update Movie'

    expect(current_path).to eq("/movies/#{movie_1.id}")
    expect(page).to have_content("Nominations: 20")
  end
  
  #User story 23
  it 'each movie has a link to delete itself' do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                           oscar: true,
                           nominations: 7)

    movie_3 = director.movies.create!(title: "Django Unchained",
                                      oscar: true,
                                      nominations: 5)

    visit '/movies'

    expect(page).to have_content('Delete Pulp Fiction')
    expect(page).to have_content('Delete Django Unchained')

    click_link 'Delete Django Unchained'

    expect(current_path).to eq('/movies')
    expect(page).to_not have_content('Django Unchained')
  end
end
