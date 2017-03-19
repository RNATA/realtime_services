class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :provider_services, :base_fee, :base_rate
  end
end
