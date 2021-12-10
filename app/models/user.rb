class User < ApplicationRecord
  # Direct associations

  has_many   :feedbacks,
             foreign_key: "users_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
