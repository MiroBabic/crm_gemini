class Implementation < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :subject
  belongs_to :oprogram

  has_many :iactivities

  validates :project_id, uniqueness: true

end
