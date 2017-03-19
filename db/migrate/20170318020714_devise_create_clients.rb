class DeviseCreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :email, null:false
      t.string :street_address, null:false
      t.string :city, null:false
      t.string :state, null:false
      t.string :zipcode, null:false
      t.string :current_location
      t.string :phone_number, null:false
      t.string :password_digest, null:false

      t.timestamps null: false
    end
  end
end
