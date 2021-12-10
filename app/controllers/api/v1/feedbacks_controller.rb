class Api::V1::FeedbacksController < Api::V1::GraphitiController
  def index
    feedbacks = FeedbackResource.all(params)
    respond_with(feedbacks)
  end

  def show
    feedback = FeedbackResource.find(params)
    respond_with(feedback)
  end

  def create
    feedback = FeedbackResource.build(params)

    if feedback.save
      render jsonapi: feedback, status: :created
    else
      render jsonapi_errors: feedback
    end
  end

  def update
    feedback = FeedbackResource.find(params)

    if feedback.update_attributes
      render jsonapi: feedback
    else
      render jsonapi_errors: feedback
    end
  end

  def destroy
    feedback = FeedbackResource.find(params)

    if feedback.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: feedback
    end
  end
end
