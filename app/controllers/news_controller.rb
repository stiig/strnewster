# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @parsed_articles = ParsedArticle.includes(:feed_source).order(date: :desc).page(params[:page]).per(12)
  end
end
