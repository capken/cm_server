class Student < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation
  #attr_accessor :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
end
