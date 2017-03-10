# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @date_from = params[:q]&.fetch(:date_gteq_datetime)
    @date_to = params[:q]&.fetch(:date_lteq_datetime)

    @q = ParsedArticle.ransack(params[:q])
    @parsed_articles = @q.result.includes(:feed_source).order(date: :desc).page(params[:page]).per(12)
  end
end
