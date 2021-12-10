class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to @feedback, notice: 'Feedback was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback.destroy
    message = "Feedback was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to feedbacks_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:routes_id, :safty_rating, :overall_experience_rating, :comments, :attractions_id, :users_id)
    end
end
