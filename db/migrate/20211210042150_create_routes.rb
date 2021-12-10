class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :start_point
      t.string :end_point
      t.string :distance
      t.integer :transportations_id

      t.timestamps
    end
  end
end
