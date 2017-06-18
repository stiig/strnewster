# frozen_string_literal: true

require 'rmagick'

module ImageCreatorService
  include Magick

  module_function

  def generate_image(text)
    image = Image.new(600, 600)
    img_text = Magick::Draw.new

    img_text.font_family = 'helvetica'
    img_text.font_weight = Magick::BoldWeight
    img_text.pointsize = 25

    img_text.gravity = Magick::WestGravity
    img_text.annotate(image, 0, 0, 20, 0, wrap_text(text))

    image.format = 'png'
    image.to_blob
  end

  private_class_method

  def wrap_text(text)
    text.split("\n").collect { |str| fit_text(str.gsub(%r{(?:f|ht)tps?:/[^\s]+}, ''), 580) }.join("\n\n")
  end

  def fit_text(text, width)
    separator = ' '
    line = ''
    if not text_fit?(text, width) and text.include? separator
      i = 0
      text.split(separator).each do |word|
        tmp_line = i.zero? ? line + word : line + separator + word

        if text_fit?(tmp_line, width)
          line += separator unless i.zero?
        else
          line += '\n' unless i.zero?
        end
        line += word
        i += 1
      end
      text = line
    end
    text
  end

  def text_fit?(text, width)
    tmp_image = Image.new(width, 500)
    drawing = Draw.new
    drawing.annotate(tmp_image, 0, 0, 0, 0, text) do |txt|
      txt.gravity = Magick::NorthGravity
      txt.pointsize = 25
      txt.font_family = 'helvetica'
      txt.font_weight = Magick::BoldWeight
    end
    metrics = drawing.get_multiline_type_metrics(tmp_image, text)
    (metrics.width < width)
  end
end
