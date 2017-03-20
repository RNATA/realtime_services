class RemoveCurrentLocationFromProviders < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :current_location, :string
  end
end
