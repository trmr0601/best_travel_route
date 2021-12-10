class AttractionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :attraction_name, :string
  attribute :attraction_type, :string
  attribute :attraction_description, :string
  attribute :location, :string
  attribute :cost, :string
  attribute :routes_id, :integer

  # Direct associations

  # Indirect associations

end
