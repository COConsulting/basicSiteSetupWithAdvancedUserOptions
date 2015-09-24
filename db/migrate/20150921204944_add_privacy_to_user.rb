class AddPrivacyToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.boolean	:private
  	end
  end
end