class Employee < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create

  belongs_to :company
end
