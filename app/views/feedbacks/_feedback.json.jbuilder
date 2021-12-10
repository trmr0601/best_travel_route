json.extract! feedback, :id, :routes_id, :safty_rating, :overall_experience_rating, :comments, :attractions_id, :users_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
