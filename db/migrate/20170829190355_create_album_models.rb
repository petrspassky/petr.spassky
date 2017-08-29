class CreateAlbumModels < ActiveRecord::Migration[5.1]
  def change
    create_table :album_models do |t|
      t.references :album, foreign_key: true, index: true
      t.references :model, foreign_key: true, index: true

      t.timestamps
    end
  end
end
