# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :message, presence: true
end

# == Schema Information
#
# Table name: feedbacks
#
#  contact    :string
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  message    :text             not null
#  updated_at :datetime         not null
#
