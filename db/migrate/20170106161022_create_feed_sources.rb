class CreateFeedSources < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_sources do |t|
      t.string :title
      t.string :url
      t.boolean :active

      t.timestamps
    end
  end
end
