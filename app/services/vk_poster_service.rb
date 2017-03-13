# frozen_string_literal: true

class VkPosterService
  def initialize(post)
    @post = post
  end

  def call
    return unless post

    app = VK::Application.new(app_id: ENV['VK_APP_ID'], version: '3', access_token: ENV['VK_KEY'])
    begin
      app.wall.post(owner_id: ENV['VK_GROUP_ID'], message: post.text, form_group: 0)
      post.published!
    rescue VK::Error => err
      warn("VK not available or #{err.message}")
    end
  end

  private

  attr_reader :post
end
