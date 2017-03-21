class RemoveAddressColumnsFromProviders < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :street_address, :string
    remove_column :providers, :city, :string
    remove_column :providers, :state, :string
    remove_column :providers, :zipcode, :string
  end
end
