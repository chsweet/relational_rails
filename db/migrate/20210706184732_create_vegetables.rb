class CreateVegetables < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetables do |t|
      t.references :garden, foreign_key: true
      t.timestamps
      t.string :name
      t.boolean :perennial
      t.integer :min_hrs_sun
    end
  end
end
