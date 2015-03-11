class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.references :song
      t.references :user
      t.text :text

      t.timestamps
    end
  end
end
