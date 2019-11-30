class Implementation < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :subject
  belongs_to :oprogram

  has_many :iactivities, :dependent => :destroy
  has_many :implnotes, :dependent => :destroy

  validates :project_id, uniqueness: true

end
