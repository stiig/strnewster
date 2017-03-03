# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @parsed_articles = ParsedArticle.includes(:feed_source).order(date: :desc).first(6)
  end
end
