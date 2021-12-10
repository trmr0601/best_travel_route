class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :routes_id
      t.string :safty_rating
      t.string :overall_experience_rating
      t.string :comments
      t.integer :attractions_id
      t.integer :users_id

      t.timestamps
    end
  end
end
