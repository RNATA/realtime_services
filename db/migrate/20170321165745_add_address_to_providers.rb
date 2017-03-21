class AddAddressToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :address, :string
  end
end
