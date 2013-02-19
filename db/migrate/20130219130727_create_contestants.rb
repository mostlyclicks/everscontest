class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.string :state
      t.string :phone
      t.string :email
      t.string :confirm_email

      t.timestamps
    end
  end
end
