# frozen_string_literal: true

ActiveAdmin.register FeedSource do
  permit_params %i[title source_url slug]

  index do
    selectable_column
    column :id do |feed_source|
      link_to feed_source.id, admin_feed_source_path(feed_source)
    end
    column :title do |feed_source|
      link_to(feed_source.title, feed_source.source_url, target: '_blank')
    end
    column :active
    column :slug
    actions dropdown: true
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
