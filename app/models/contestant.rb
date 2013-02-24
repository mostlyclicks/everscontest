class Contestant < ActiveRecord::Base
  attr_accessible :city, :country, :email, :first_name, :last_name, :phone, :state, :email_confirmation,
  								:gender, :age, :rules, :newsletter

  validates :email, :confirmation => true
  validates :email_confirmation, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :state, :presence => true
  validates :gender, :presence => true
  validates :age, :presence => true
  validates :rules, :presence => true

end
