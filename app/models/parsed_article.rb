# frozen_string_literal: true
class ParsedArticle < ApplicationRecord
  belongs_to :feed_source

  validates :title, :date, :link, :feed_source, presence: true
end
