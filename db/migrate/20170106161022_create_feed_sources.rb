class CreateFeedSources < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_sources do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.boolean :active, null:false

      t.timestamps
    end

    add_index :feed_sources, :url, unique: true
  end
end
