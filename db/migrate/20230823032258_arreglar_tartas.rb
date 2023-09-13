class ArreglarTartas < ActiveRecord::Migration[7.0]
  def change
    change_column :tarts, :precio, 'integer USING CAST(precio AS integer)'
    change_column :tarts, :cantidad, 'integer USING CAST(cantidad AS integer)'
    change_column :tarts,:pedido_id,'integer USING CAST(pedido_id AS integer)'
    remove_column :tarts,:integer
 
  end
end
