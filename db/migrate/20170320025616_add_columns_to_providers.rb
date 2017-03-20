class AddColumnsToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :lat, :string
    add_column :providers, :long, :string
  end
end
