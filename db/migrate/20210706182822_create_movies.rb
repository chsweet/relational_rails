class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.references :director, foreign_key: true
      t.timestamps
      t.string :title
      t.boolean :oscar
      t.integer :nominations
    end
  end
end
