class FeedbackResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :routes_id, :integer
  attribute :safty_rating, :string
  attribute :overall_experience_rating, :string
  attribute :comments, :string
  attribute :attractions_id, :integer
  attribute :users_id, :integer

  # Direct associations

  belongs_to :routes,
             resource: RouteResource

  belongs_to :users,
             resource: UserResource

  # Indirect associations

  has_one    :attraction
end
