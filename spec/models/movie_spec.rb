require "rails_helper"

describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to(:director)}
  end

  describe "methods" do
    it 'returns only movies that have won an oscar' do
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

      expect(Movie.true_oscar).to eq([movie_1, movie_3])
    end

    it 'orders movies alphabetically' do
      woody = Director.create!(name: "Woody Allen")
      manhattan = woody.movies.create!(title: "Manhattan",
                                      oscar: false,
                                      nominations: 2)

      annie = woody.movies.create!(title: "Annie Hall",
                                  oscar: true,
                                  nominations: 3)

      paris = woody.movies.create!(title: "Midnight in Paris",
                                  oscar: true,
                                  nominations: 4)

      expect(Movie.alphabetize).to eq([annie, manhattan, paris])
    end
  end
end
