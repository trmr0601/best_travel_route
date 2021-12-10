class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  # GET /routes
  def index
    @routes = Route.all
  end

  # GET /routes/1
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: 'Route was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /routes/1
  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Route was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /routes/1
  def destroy
    @route.destroy
    message = "Route was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
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
      params.require(:route).permit(:start_point, :end_point, :distance, :transportations_id)
    end
end
