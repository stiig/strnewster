# frozen_string_literal: true

namespace :poster do
  desc 'Post on VK group'
  task vk: :environment do
    VkPosterService.new(Post.create_for_publication).call
  end

  desc 'Build posts'
  task create_post: :environment do
    Post.create_for_publication
  end
end
