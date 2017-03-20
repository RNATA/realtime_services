class AddLocationColumnsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :lat, :float
    add_column :clients, :long, :float
  end
end
