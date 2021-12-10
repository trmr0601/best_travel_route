class RouteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :start_point, :string
  attribute :end_point, :string
  attribute :distance, :string
  attribute :transportations_id, :integer

  # Direct associations

  belongs_to :transportations,
             resource: TransportationResource

  has_many   :attractions,
             foreign_key: :routes_id

  has_many   :feedbacks,
             foreign_key: :routes_id

  # Indirect associations

end
