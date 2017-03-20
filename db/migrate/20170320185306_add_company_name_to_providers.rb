class AddCompanyNameToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :company_name, :string
  end
end
