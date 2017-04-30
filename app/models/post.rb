# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: %i[created published]

  def self.create_for_publication
    last_post = last

    articles = ParsedArticle.all
    articles = articles.where('id > ?', last_post.last_parsed_article_id) if last_post
    articles = articles.last(5)

    return nil if articles.size < 5

    title = "Последние новости на текущий момент: \n"
    pub_text = articles.reduce(title) { |sum, el| sum + "• #{el.title.strip} #{el.link.strip}\n" }
    pub_text = "#{pub_text}#Стерлитамак #Стр #новости"
    create text: pub_text, last_parsed_article_id: articles.last.id
  end
end

# == Schema Information
#
# Table name: posts
#
#  created_at             :datetime         not null
#  id                     :integer          not null, primary key
#  last_parsed_article_id :integer          not null
#  status                 :integer          default("created"), not null
#  text                   :text             default(""), not null
#  updated_at             :datetime         not null
#
