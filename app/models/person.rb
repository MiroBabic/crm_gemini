class Person < ActiveRecord::Base
  belongs_to :subject

  has_many :communications, :dependent => :destroy
  
end
