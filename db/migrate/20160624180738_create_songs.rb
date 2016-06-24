class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :artist
      t.text :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
