class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @q = Route.ransack(params[:q])
    @routes = @q.result(distinct: true).includes(:feedbacks, :attractions,
                                                 :transportations).page(params[:page]).per(10)
  end

  def show
    @attraction = Attraction.new
    @feedback = Feedback.new
  end

  def new
    @route = Route.new
  end

  def edit; end

  def create
    @route = Route.new(route_params)

    if @route.save
      message = "Route was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @route, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: "Route was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    message = "Route was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to routes_url, notice: message
    end
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:start_point, :end_point, :distance,
                                  :transportations_id)
  end
end
