class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :provider_service, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
