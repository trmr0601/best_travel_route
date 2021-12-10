class Attraction < ApplicationRecord
  # Direct associations

  belongs_to :routes,
             :class_name => "Route"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    attraction_name
  end

end
