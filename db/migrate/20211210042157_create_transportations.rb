class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :method
      t.string :speed

      t.timestamps
    end
  end
end
