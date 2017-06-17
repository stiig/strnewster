# frozen_string_literal: true

require 'rmagick'

module ImageCreatorService
  class << self
    include Magick
    def generate_image(text)
      image = Image.new(1000, 1000)
    end
    private
  end
end
