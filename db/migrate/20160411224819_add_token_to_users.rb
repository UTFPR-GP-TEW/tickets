class AddTokenToUsers < ActiveRecord::Migration
  def change
    change_column :projects, :token, :string, :null => false
  end
end
