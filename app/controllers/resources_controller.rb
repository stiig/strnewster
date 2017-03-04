# frozen_string_literal: true

class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show]

  def index
    @resources = FeedSource.all
  end

  def show
    @parsed_articles = @resource.parsed_articles.order(date: :desc).page(params[:page]).per(12)
  end

  private

  def set_resource
    @resource = FeedSource.friendly.find(params[:id])
  end
end
