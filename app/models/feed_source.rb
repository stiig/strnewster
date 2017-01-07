# frozen_string_literal: true
class FeedSource < ApplicationRecord
  validates :title, :url, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :url, uniqueness: true
end

# == Schema Information
#
# Table name: feed_sources
#
#  active     :boolean          not null
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  title      :string           not null
#  updated_at :datetime         not null
#  url        :string           not null
#
# Indexes
#
#  index_feed_sources_on_url  (url) UNIQUE
#
