class RemoveAddressColumnsFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :street_address, :string
    remove_column :clients, :city, :string
    remove_column :clients, :state, :string
    remove_column :clients, :zipcode, :string
  end
end
