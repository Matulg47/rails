class CreateTarts < ActiveRecord::Migration[7.0]
  def change
    create_table :tarts do |t|
      t.string :nombre
      t.string :tamaño   
      t.string :precio  
      t.string :descripcion
      t.string :cantidad
      t.string :pedido_id
      t.string :integer

      t.timestamps
    end
  end
end
