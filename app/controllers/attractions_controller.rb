class AttractionsController < ApplicationController
  before_action :set_attraction, only: %i[show edit update destroy]

  def index
    @q = Attraction.ransack(params[:q])
    @attractions = @q.result(distinct: true).includes(:routes,
                                                      :feedback).page(params[:page]).per(10)
  end

  def show; end

  def new
    @attraction = Attraction.new
  end

  def edit; end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      message = "Attraction was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @attraction, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: "Attraction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    message = "Attraction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to attractions_url, notice: message
    end
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:attraction_name, :attraction_type,
                                       :attraction_description, :location, :cost, :routes_id)
  end
end
