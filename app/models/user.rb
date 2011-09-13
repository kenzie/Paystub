class User < ActiveRecord::Base

  has_many :payrolls

  has_secure_password

  attr_accessible :name, :email, :password
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email

end