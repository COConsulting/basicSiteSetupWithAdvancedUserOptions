class AddUserDefaultSecurityLevel < ActiveRecord::Migration
  def change
  	change_column_default :users, :security_level, '1'
  end
end
