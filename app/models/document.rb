class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  mount_uploader :file, DocUploader

  before_save :update_file_attributes
  
  private
  
  def update_file_attributes
    if file.present? && file_changed?
      self.file_type = file.file.content_type
      self.file_size = file.file.size
      self.file_url = file.url
      self.file_path = file.path
    end
  end
end

