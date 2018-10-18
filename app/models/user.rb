class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :communications, :dependent => :destroy
    has_many :calendars, :dependent => :destroy
    has_many :subjects, :dependent => :destroy
    has_many :userprofiles, :dependent => :destroy
end
