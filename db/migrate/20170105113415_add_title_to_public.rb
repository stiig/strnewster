class AddTitleToPublic < ActiveRecord::Migration[5.0]
  def change
    change_table :publics do |t|
      t.string :title, null: false
    end
  end
end
