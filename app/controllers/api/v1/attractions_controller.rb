class Api::V1::AttractionsController < Api::V1::GraphitiController
  def index
    attractions = AttractionResource.all(params)
    respond_with(attractions)
  end

  def show
    attraction = AttractionResource.find(params)
    respond_with(attraction)
  end

  def create
    attraction = AttractionResource.build(params)

    if attraction.save
      render jsonapi: attraction, status: 201
    else
      render jsonapi_errors: attraction
    end
  end

  def update
    attraction = AttractionResource.find(params)

    if attraction.update_attributes
      render jsonapi: attraction
    else
      render jsonapi_errors: attraction
    end
  end

  def destroy
    attraction = AttractionResource.find(params)

    if attraction.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: attraction
    end
  end
end
