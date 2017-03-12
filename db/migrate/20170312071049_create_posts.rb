class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :text, default: '', null: false
      t.integer :status, default: 0, null: false, limit: 1
      t.integer :last_parsed_article_id, null: false

      t.timestamps
    end
  end
end
