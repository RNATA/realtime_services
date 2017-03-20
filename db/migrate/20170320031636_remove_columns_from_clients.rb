class RemoveColumnsFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :lat, :string
    remove_column :clients, :long, :string
  end
end
