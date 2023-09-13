class ArreglarTartas < ActiveRecord::Migration[7.0]
  def change
    change_column :tarts,:precio,:integer
    change_column :tarts,:cantidad,:integer
    change_column :tarts,:pedido_id,:integer
    remove_column :tarts,:integer
 
  end
end
