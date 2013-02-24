class AddNewColumnsToContestants < ActiveRecord::Migration
  def change
  	add_column :contestants, :newsletter, :boolean
  	add_column :contestants, :gender, :string
  	add_column :contestants, :age, :string
  	add_column :contestants, :rules, :boolean
  end
end
