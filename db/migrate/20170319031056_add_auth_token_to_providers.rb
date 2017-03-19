class AddAuthTokenToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :auth_token, :string
  end
end
