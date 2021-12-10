class AddRoutesReferenceToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :feedbacks, :routes, column: :routes_id
    add_index :feedbacks, :routes_id
    change_column_null :feedbacks, :routes_id, false
  end
end
