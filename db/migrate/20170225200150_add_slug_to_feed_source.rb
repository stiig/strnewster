class AddSlugToFeedSource < ActiveRecord::Migration
  def change
    change_table :feed_sources do |t|
      t.string :slug, null: true
    end
  end
end
