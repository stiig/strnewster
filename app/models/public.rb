# frozen_string_literal: true

class Public < ApplicationRecord
  validates :outer_id, :width, :height, :mode, :wide, :title, presence: true

  validates :outer_id, uniqueness: true
  validates :width, :height, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0 }
  validates :mode, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 0,
                                   less_than_or_equal_to: 4 }
  validates :wide, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 0,
                                   less_than_or_equal_to: 1 }
end

# == Schema Information
#
# Table name: publics
#
#  created_at :datetime         not null
#  height     :integer          default(0), not null
#  id         :integer          not null, primary key
#  mode       :integer          default(0), not null
#  outer_id   :string           not null
#  title      :string           not null
#  updated_at :datetime         not null
#  wide       :integer          default(0), not null
#  width      :integer          default(0), not null
#
# Indexes
#
#  index_publics_on_outer_id  (outer_id) UNIQUE
#
