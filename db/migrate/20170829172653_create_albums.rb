class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.references :site, foreign_key: true, index: true
      t.references :artist, foreign_key: true, index: true
      t.string :title
      t.string :url
      t.string :cover_url
      t.integer :photos
      t.string :photo_url_template
      t.date :date

      t.timestamps
    end
  end
end
