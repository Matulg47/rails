class AgregarDescripcion < ActiveRecord::Migration[7.0]
  def change
    add_column :fotos, :descrip, :string
  end
end
