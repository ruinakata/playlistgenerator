class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :playlist_id
      t.string :artist
      t.string :spotify_id
      t.string :name
      t.string :preview_url

      t.timestamps
    end
  end
end
