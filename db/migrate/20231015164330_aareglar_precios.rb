class AareglarPrecios < ActiveRecord::Migration[7.0]
  def change
    remove_column :precios, :precio
    add_column :precios, :precioC, :integer
    add_column :precios, :precioM, :integer
    add_column :precios, :precioG, :integer
  end
end
