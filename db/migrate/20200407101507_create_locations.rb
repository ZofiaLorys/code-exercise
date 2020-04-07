class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :slug
      t.integer :density_of_population

      t.timestamps
    end
  end
end
