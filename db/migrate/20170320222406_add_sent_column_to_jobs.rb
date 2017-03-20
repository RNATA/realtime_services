class AddSentColumnToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :sent, :boolean, default:false
  end
end
