class Person < ActiveRecord::Base
  belongs_to :subject

  has_many :communications, :dependent => :destroy
  has_many :projects

  def name
   "#{first_name} #{last_name}"
  end
  
end
