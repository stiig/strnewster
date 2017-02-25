class AddUniqueIndexToFeedSource < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up {
        FeedSource.find_each(&:save)
        change_table :feed_sources do |t|
          t.change :slug, :string, null: false
        end
        add_index :feed_sources, :slug, unique: true
      }
      dir.down {
        remove_index :feed_sources, :slug
      }
    end
  end
end
