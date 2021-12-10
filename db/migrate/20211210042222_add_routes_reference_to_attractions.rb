class AddRoutesReferenceToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attractions, :routes, column: :routes_id
    add_index :attractions, :routes_id
    change_column_null :attractions, :routes_id, false
  end
end
