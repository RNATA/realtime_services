class CreateProviderServices < ActiveRecord::Migration[5.0]
  def change
    create_table :provider_services do |t|
      t.money :base_fee
      t.references :service, foreign_key: true
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
