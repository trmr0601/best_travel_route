class Route < ApplicationRecord
  # Direct associations

  has_many   :attractions,
             :foreign_key => "routes_id",
             :dependent => :destroy

  has_many   :feedbacks,
             :foreign_key => "routes_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    start_point
  end

end
