class FicheroGestionado < ActiveRecord::Base
  attr_accessible :content_type, :path, :filename, :file
  belongs_to :usuario
  mount_uploader :file, ImageUploader
end
