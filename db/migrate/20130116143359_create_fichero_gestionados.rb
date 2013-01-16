class CreateFicheroGestionados < ActiveRecord::Migration
  def change
    create_table :fichero_gestionados do |t|
      t.string :filename
      t.string :content_type
      t.binary :data
      t.references :usuario

      t.timestamps
    end
  end
end
