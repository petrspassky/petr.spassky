class CreateSiteModels < ActiveRecord::Migration[5.1]
  def change
    create_table :site_models do |t|
      t.references :site, null: false, index: true, foreign_key: true
      t.references :model, null: false, index: true, foreign_key: true
      t.string :nickname
      t.string :url

      t.timestamps
    end
  end
end
