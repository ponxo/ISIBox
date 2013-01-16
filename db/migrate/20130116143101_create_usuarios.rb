class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nick
      t.string :password

      t.timestamps
    end
  end
end
