class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :lyric, null: false
      t.references :user, null: false
    end
  end
end
