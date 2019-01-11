# frozen_string_literal: true

ActiveAdmin.register ParsedArticle do
  index do
    selectable_column
    column :id do |parsed_article|
      link_to parsed_article.id, admin_parsed_article_path(parsed_article)
    end
    column :title do |parsed_article|
      link_to(parsed_article.title.truncate(100), parsed_article.link, target: '_blank', rel: 'noopener')
    end
    column :date
    column :feed_source
    actions dropdown: true
  end
end
