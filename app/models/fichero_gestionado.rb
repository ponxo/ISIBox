class FicheroGestionado < ActiveRecord::Base
  attr_accessible :content_type, :data, :filename
  belong_to :usuario
end
