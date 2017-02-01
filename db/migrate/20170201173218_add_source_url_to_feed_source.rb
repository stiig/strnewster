class AddSourceUrlToFeedSource < ActiveRecord::Migration[5.0]
  def change
    change_table :feed_sources do |t|
      t.string :source_url
    end
  end
end
