class CreateParsedArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :parsed_articles do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.datetime :date, null: false
      t.references :feed_source, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
