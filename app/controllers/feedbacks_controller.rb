# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to root_path, flash: { success: 'Ваше сообщение успешно отправлено' }
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:contact, :message)
  end
end
