class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.timestamps
      t.boolean :oscar
      t.integer :nominations
    end
  end
end
