class Medium < ApplicationRecord
  belongs_to :subject


  mount_uploader :file, MediaUploader

  after_save :update_file_attributes

  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "delete_url" => "/medium/#{id}",
      "delete_type" => "DELETE"
    }
  end

  
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
