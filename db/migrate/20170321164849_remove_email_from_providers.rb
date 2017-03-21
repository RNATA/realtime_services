class RemoveEmailFromProviders < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :email, :string
  end
end
