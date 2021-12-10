class Transportation < ApplicationRecord
  # Direct associations

  has_many   :routes,
             :foreign_key => "transportations_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    method
  end

end
