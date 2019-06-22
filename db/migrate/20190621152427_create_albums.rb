class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :nombre
      t.date :fecha_publicacion
      t.integer :nro_canciones
      t.references :artistum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
