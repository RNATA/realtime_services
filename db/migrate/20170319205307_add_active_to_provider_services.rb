

class AddActiveToProviderServices < ActiveRecord::Migration[5.0]
  def change
    add_column :provider_services, :active, :boolean
  end
end
