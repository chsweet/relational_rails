class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.references :director_id, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title
      t.boolean :oscar
      t.integer :nominations
    end
  end
end
