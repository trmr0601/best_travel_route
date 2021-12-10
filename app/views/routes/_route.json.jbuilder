json.extract! route, :id, :start_point, :end_point, :distance, :transportations_id, :created_at, :updated_at
json.url route_url(route, format: :json)
