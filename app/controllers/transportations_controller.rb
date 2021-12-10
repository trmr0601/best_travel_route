class TransportationsController < ApplicationController
  before_action :set_transportation, only: [:show, :edit, :update, :destroy]

  # GET /transportations
  def index
    @transportations = Transportation.all
  end

  # GET /transportations/1
  def show
    @route = Route.new
  end

  # GET /transportations/new
  def new
    @transportation = Transportation.new
  end

  # GET /transportations/1/edit
  def edit
  end

  # POST /transportations
  def create
    @transportation = Transportation.new(transportation_params)

    if @transportation.save
      redirect_to @transportation, notice: 'Transportation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transportations/1
  def update
    if @transportation.update(transportation_params)
      redirect_to @transportation, notice: 'Transportation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transportations/1
  def destroy
    @transportation.destroy
    redirect_to transportations_url, notice: 'Transportation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transportation
      @transportation = Transportation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transportation_params
      params.require(:transportation).permit(:method, :speed)
    end
end
