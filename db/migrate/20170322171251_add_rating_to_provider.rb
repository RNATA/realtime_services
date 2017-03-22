class AddRatingToProvider < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :rating, :integer
  end
end
