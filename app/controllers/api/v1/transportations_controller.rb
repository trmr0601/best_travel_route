class Api::V1::TransportationsController < Api::V1::GraphitiController
  def index
    transportations = TransportationResource.all(params)
    respond_with(transportations)
  end

  def show
    transportation = TransportationResource.find(params)
    respond_with(transportation)
  end

  def create
    transportation = TransportationResource.build(params)

    if transportation.save
      render jsonapi: transportation, status: 201
    else
      render jsonapi_errors: transportation
    end
  end

  def update
    transportation = TransportationResource.find(params)

    if transportation.update_attributes
      render jsonapi: transportation
    else
      render jsonapi_errors: transportation
    end
  end

  def destroy
    transportation = TransportationResource.find(params)

    if transportation.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: transportation
    end
  end
end
