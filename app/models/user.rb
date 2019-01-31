class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :communications
    has_many :calendars
    has_many :subjects
    has_many :userprofiles
    has_many :documents
    has_many :projects
    has_many :implementations
    has_many :iactivities
    has_many :implnotes
end
