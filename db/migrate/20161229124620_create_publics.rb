class CreatePublics < ActiveRecord::Migration[5.0]
  def change
    create_table :publics do |t|
      t.string :outer_id, null: false
      t.integer :width, default: 0, null: false
      t.integer :height, default: 0, null: false
      t.integer :mode, default: 0, null: false, limit: 1
      t.integer :wide, default: 0, null: false, limit: 1

      t.timestamps
    end
    add_index :publics, :outer_id, unique: true
  end
end
