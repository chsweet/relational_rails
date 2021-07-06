class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :oscar
      t.integer :nominations
    end
  end
end
