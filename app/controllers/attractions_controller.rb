class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET /attractions
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/1
  def show
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction, notice: 'Attraction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attractions/1
  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attractions/1
  def destroy
    @attraction.destroy
    redirect_to attractions_url, notice: 'Attraction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attraction_params
      params.require(:attraction).permit(:attraction_name, :attraction_type, :attraction_description, :location, :cost, :routes_id)
    end
end
