# frozen_string_literal: true

class ParsedArticle < ApplicationRecord
  belongs_to :feed_source

  validates :title, :date, :link, :feed_source, presence: true
end

# == Schema Information
#
# Table name: parsed_articles
#
#  created_at     :datetime         not null
#  date           :datetime         not null
#  feed_source_id :integer          not null
#  id             :integer          not null, primary key
#  link           :string           not null
#  title          :string           not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_parsed_articles_on_feed_source_id  (feed_source_id)
#
# Foreign Keys
#
#  fk_rails_53062e38d8  (feed_source_id => feed_sources.id)
#
