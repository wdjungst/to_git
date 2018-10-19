class AddGhNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gh_name, :string, required: true
  end
end
