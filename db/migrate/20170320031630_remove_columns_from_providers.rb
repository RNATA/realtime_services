class RemoveColumnsFromProviders < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :lat, :string
    remove_column :providers, :long, :string
  end
end
