# frozen_string_literal: true

class ResourceController < ApplicationController
  before_action :set_resource

  def show
    @parsed_articles = @resource.parsed_articles.includes(:feed_source).order(date: :desc).page(params[:page]).per(12)
  end

  private

  def set_resource
    @resource = FeedSource.find(params[:id])
  end
end
