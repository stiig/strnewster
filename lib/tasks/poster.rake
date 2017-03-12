# frozen_string_literal: true

namespace :poster do
  desc 'Post on VK group'
  task vk: :environment do
    post_vk
  end

  desc 'Build posts'
  task build_post: :environment do
    Post.build_for_publication
  end

  def post_vk
    post = Post.build_for_publication
    return unless post

    app = VK::Application.new(app_id: ENV['VK_APP_ID'], version: '3', access_token: ENV['VK_KEY'])
    app.wall.post(owner_id: ENV['VK_GROUP_ID'], message: post.text, form_group: 0)
    post.published!
  end
end
