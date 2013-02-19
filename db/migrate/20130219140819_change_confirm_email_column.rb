class ChangeConfirmEmailColumn < ActiveRecord::Migration
  def up
  	remove_column :contestants, :confirm_email
  end

end
