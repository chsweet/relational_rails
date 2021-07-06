class CreateVegetables < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetables do |t|
      t.references :vegetable_garden, foreign_key: true
      t.timestamps
      t.string :name
      t.boolean :summer_harvest
      t.boolean :winter_harvest
      t.integer :min_hrs_sun
    end
  end
end
