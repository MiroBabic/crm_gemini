class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum user_type: {admin: 1, project_manager: 2, seller: 3}

    has_many :communications, dependent: :destroy
    has_many :calendars,dependent: :destroy
    has_many :subjects, dependent: :nullify
    has_many :userprofiles, dependent: :destroy
    has_many :documents, dependent: :nullify
    has_many :projects, dependent: :nullify
    has_many :implementations, dependent: :nullify
    has_many :iactivities, dependent: :nullify
    has_many :implnotes, dependent: :nullify
end
