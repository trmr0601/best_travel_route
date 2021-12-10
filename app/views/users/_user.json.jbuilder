json.extract! user, :id, :name, :age, :travel_preference, :created_at, :updated_at
json.url user_url(user, format: :json)
