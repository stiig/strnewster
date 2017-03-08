# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @q = ParsedArticle.ransack(params[:q])
    @parsed_articles = @q.result.includes(:feed_source).order(date: :desc).page(params[:page]).per(12)
  end
end
