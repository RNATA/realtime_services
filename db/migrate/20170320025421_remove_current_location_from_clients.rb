class RemoveCurrentLocationFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :current_location, :string
  end
end
