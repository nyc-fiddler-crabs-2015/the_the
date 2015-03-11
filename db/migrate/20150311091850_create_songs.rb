class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :url, null: false
      t.boolean :is_top
      t.references :artist
      t.references :lyric
    end
  end
end
