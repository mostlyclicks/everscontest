class Contestant < ActiveRecord::Base
  attr_accessible :city, :confirm_email, :country, :email, :first_name, :last_name, :phone, :state
end
