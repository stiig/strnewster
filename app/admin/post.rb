# frozen_string_literal: true

ActiveAdmin.register Post do
  index do
    selectable_column
    column :id do |post|
      link_to post.id, admin_post_path(post)
    end
    column :text do |post|
      post.text.truncate(250)
    end
    column :status
    column :last_parsed_article_id
    column :created_at
    column :updated_at
    actions dropdown: true
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
