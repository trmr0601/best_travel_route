json.extract! attraction, :id, :attraction_name, :attraction_type,
              :attraction_description, :location, :cost, :routes_id, :created_at, :updated_at
json.url attraction_url(attraction, format: :json)
