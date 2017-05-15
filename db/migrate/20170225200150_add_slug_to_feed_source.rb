class AddSlugToFeedSource < ActiveRecord::Migration[5.0]
  def change
    change_table :feed_sources do |t|
      t.string :slug, null: true
    end
  end
end
