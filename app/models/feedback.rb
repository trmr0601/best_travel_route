class Feedback < ApplicationRecord
  # Direct associations

  belongs_to :routes,
             :class_name => "Route"

  belongs_to :users,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    routes.to_s
  end

end
