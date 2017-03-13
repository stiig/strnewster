# frozen_string_literal: true

namespace :poster do
  desc 'Post on VK group'
  task vk: :environment do
    VkPosterService.new(Post.build_for_publication).call
  end

  desc 'Build posts'
  task build_post: :environment do
    Post.build_for_publication
  end
end
