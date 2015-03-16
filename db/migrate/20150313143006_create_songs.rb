class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :url, null: false
      t.boolean :is_top
      t.references :lyric

      t.timestamps
    end
  end
end
