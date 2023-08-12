class CreateTarta < ActiveRecord::Migration[7.0]
  def change
    create_table :tarta do |t|
      t.string :nombre
      t.string :tamaño
      t.integer :precio
      t.string :descripcion
      t.integer :pedido_id

      t.timestamps
    end
  end
end
