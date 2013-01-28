class CreateFicheroGestionados < ActiveRecord::Migration
  def change
    create_table :fichero_gestionados do |t|
      t.string :name
      t.string :content_type
      t.references :usuario

      t.timestamps
    end
  end
end
