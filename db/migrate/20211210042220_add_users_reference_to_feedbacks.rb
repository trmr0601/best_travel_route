class AddUsersReferenceToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :feedbacks, :users, column: :users_id
    add_index :feedbacks, :users_id
    change_column_null :feedbacks, :users_id, false
  end
end
