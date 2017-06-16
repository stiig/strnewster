# frozen_string_literal: true

module ImageCreatorService
  class << self
    def generate_image(text)
      MiniMagick::Tool::Convert.new do |image|
        image.size '1200x1200'
        image.caption text
        image << 'blank.png'
      end
    end
    private
  end
end
