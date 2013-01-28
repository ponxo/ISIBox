class FicheroGestionado < ActiveRecord::Base
  attr_accessible :content_type, :name, :file
  belongs_to :usuario
  mount_uploader :file, FileUploader
end
