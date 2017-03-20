class AddColumnsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :lat, :string
    add_column :clients, :long, :string
  end
end
