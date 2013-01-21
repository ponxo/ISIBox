class AddFileToFicheroGestionados < ActiveRecord::Migration
  def change
    add_column :fichero_gestionados, :file, :string
  end
end
