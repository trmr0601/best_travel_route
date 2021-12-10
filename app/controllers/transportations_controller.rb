class TransportationsController < ApplicationController
  before_action :set_transportation, only: %i[show edit update destroy]

  def index
    @q = Transportation.ransack(params[:q])
    @transportations = @q.result(distinct: true).includes(:routes).page(params[:page]).per(10)
  end

  def show
    @route = Route.new
  end

  def new
    @transportation = Transportation.new
  end

  def edit; end

  def create
    @transportation = Transportation.new(transportation_params)

    if @transportation.save
      redirect_to @transportation,
                  notice: "Transportation was successfully created."
    else
      render :new
    end
  end

  def update
    if @transportation.update(transportation_params)
      redirect_to @transportation,
                  notice: "Transportation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @transportation.destroy
    redirect_to transportations_url,
                notice: "Transportation was successfully destroyed."
  end

  private

  def set_transportation
    @transportation = Transportation.find(params[:id])
  end

  def transportation_params
    params.require(:transportation).permit(:method, :speed)
  end
end
