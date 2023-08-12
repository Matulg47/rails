class CreateCakes < ActiveRecord::Migration[7.0]
  def change
    create_table :cakes do |t|
      t.string :tamaño
      t.string :nombre
      t.integer :precio
      t.string :descripcion
      t.integer :pedido_id

      t.timestamps
    end
  end
end
