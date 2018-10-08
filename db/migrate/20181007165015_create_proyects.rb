class CreateProyects < ActiveRecord::Migration[5.1]
  def change
    create_table :proyects do |t|
      t.string :nombre
      t.integer :user_id

      t.timestamps
    end
  end
end
