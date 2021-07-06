class CreateVegetableGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetable_gardens do |t|
      t.timestamps
      t.string :name
      t.boolean :summer_garden
      t.boolean :winter_garden
      t.integer :hrs_of_sun
    end
  end
end
