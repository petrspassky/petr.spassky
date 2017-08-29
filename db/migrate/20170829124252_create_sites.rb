class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
