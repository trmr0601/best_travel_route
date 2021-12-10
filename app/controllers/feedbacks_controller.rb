class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]

  def index
    @q = Feedback.ransack(params[:q])
    @feedbacks = @q.result(distinct: true).includes(:users, :routes,
                                                    :attraction).page(params[:page]).per(10)
  end

  def show; end

  def new
    @feedback = Feedback.new
  end

  def edit; end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      message = "Feedback was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @feedback, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: "Feedback was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @feedback.destroy
    message = "Feedback was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to feedbacks_url, notice: message
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:routes_id, :safty_rating,
                                     :overall_experience_rating, :comments, :attractions_id, :users_id)
  end
end
