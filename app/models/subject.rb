class Subject < ActiveRecord::Base
  belongs_to :district
  belongs_to :subjtype
  belongs_to :user

  has_many :people, :dependent => :destroy
  has_many :communications, :dependent => :destroy

end
