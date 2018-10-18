class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  mount_uploader :file, DocUploader

  #before_save :update_file_attributes
  after_save :update_file_attributes
  
  private
  
  def update_file_attributes
    # if file.present? && file_changed?
    #   self.file_type = file.file.content_type
    #   self.file_size = file.file.size
    #   self.file_url = file.url
    #   self.file_path = file.current_path
    # end
    if file.present? && file_changed?
      self.update_column(:file_type, self.file.content_type)
      self.update_column(:file_size, self.file.size)
      self.update_column(:file_url, self.file.url)
      self.update_column(:file_path, self.file.current_path)
     
    end

  end
end

