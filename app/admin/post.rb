# frozen_string_literal: true

ActiveAdmin.register Post do
  index do
    selectable_column
    column :id do |post|
      link_to post.id, admin_post_path(post)
    end
    column :text do |post|
      post.text.truncate(100)
    end
    column :status
    column :last_parsed_article_id
    column :created_at
    column :updated_at
    actions dropdown: true
  end
end
