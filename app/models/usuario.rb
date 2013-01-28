class Usuario < ActiveRecord::Base
  attr_accessible :nick, :password
  validates_uniqueness_of :nick
  has_many :fichero_gestionados, :dependent => :destroy
end
