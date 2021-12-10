class Api::V1::RoutesController < Api::V1::GraphitiController
  def index
    routes = RouteResource.all(params)
    respond_with(routes)
  end

  def show
    route = RouteResource.find(params)
    respond_with(route)
  end

  def create
    route = RouteResource.build(params)

    if route.save
      render jsonapi: route, status: :created
    else
      render jsonapi_errors: route
    end
  end

  def update
    route = RouteResource.find(params)

    if route.update_attributes
      render jsonapi: route
    else
      render jsonapi_errors: route
    end
  end

  def destroy
    route = RouteResource.find(params)

    if route.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: route
    end
  end
end
