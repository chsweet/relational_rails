class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.timestamps
      t.string :name
      t.boolean :weeded
      t.integer :hrs_of_sun
    end
  end
end
