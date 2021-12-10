class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :attraction_name
      t.string :attraction_type
      t.string :attraction_description
      t.string :location
      t.string :cost
      t.integer :routes_id

      t.timestamps
    end
  end
end
