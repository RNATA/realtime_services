class AddAuthTokenToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :auth_token, :string
  end
end
