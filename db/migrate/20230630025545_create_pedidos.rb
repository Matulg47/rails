class CreatePedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :pedidos do |t|
      t.integer :cantidad
      t.float :precio_final
      t.string :a_nombre_de
      t.date :fecha_de_entrega
      t.string :producto
      t.timestamps
    end
  end
end
