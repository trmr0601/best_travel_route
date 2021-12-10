class AddTransportationsReferenceToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :routes, :transportations, column: :transportations_id
    add_index :routes, :transportations_id
    change_column_null :routes, :transportations_id, false
  end
end
