class AddAffiliateDataToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :affiliate_program, :string, default: 'ccbill'
    add_column :sites, :affiliate_id, :string
    add_column :sites, :webmaster_account, :string
  end
end
