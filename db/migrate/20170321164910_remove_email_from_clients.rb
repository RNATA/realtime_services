class RemoveEmailFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :email, :string
  end
end
