class TransportationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :method, :string
  attribute :speed, :string

  # Direct associations

  has_many   :routes,
             foreign_key: :transportations_id

  # Indirect associations
end
