# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @parsed_articles = ParsedArticle.includes(:feed_source).order(date: :desc).first(6)
    @publics = Public.all.sample(3)
  end
end
