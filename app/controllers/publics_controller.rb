# frozen_string_literal: true

class PublicsController < ApplicationController
  def index
    @publics = Public.all
  end
end
