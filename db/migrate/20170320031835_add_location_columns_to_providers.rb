class AddLocationColumnsToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :lat, :float
    add_column :providers, :long, :float
  end
end
