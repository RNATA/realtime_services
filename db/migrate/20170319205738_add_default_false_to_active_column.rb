class AddDefaultFalseToActiveColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :provider_services, :active, :boolean, default:false
  end
end
