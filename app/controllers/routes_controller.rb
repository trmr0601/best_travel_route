class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  # GET /routes
  def index
    @q = Route.ransack(params[:q])
    @routes = @q.result(distinct: true).includes(:feedbacks, :attractions,
                                                 :transportations).page(params[:page]).per(10)
  end

  # GET /routes/1
  def show
    @attraction = Attraction.new
    @feedback = Feedback.new
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit; end

  # POST /routes
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

  # PATCH/PUT /routes/1
  def update
    if @route.update(route_params)
      redirect_to @route, notice: "Route was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /routes/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_route
    @route = Route.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def route_params
    params.require(:route).permit(:start_point, :end_point, :distance,
                                  :transportations_id)
  end
end
