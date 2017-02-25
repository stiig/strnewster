# frozen_string_literal: true

class FeedSource < ApplicationRecord
  include FriendlyId

  validates :title, :url, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :url, uniqueness: true

  has_many :parsed_articles

  scope :activated, -> { where active: true }

  friendly_id :title, use: [:slugged]
end

# == Schema Information
#
# Table name: feed_sources
#
#  active     :boolean          not null
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  slug       :string           not null
#  source_url :string
#  title      :string           not null
#  updated_at :datetime         not null
#  url        :string           not null
#
# Indexes
#
#  index_feed_sources_on_slug  (slug) UNIQUE
#  index_feed_sources_on_url   (url) UNIQUE
#
