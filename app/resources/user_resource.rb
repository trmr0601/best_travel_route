class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :age, :string
  attribute :travel_preference, :string

  # Direct associations

  has_many   :feedbacks,
             foreign_key: :users_id

  # Indirect associations
end
