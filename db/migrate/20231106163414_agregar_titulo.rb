class AgregarTitulo < ActiveRecord::Migration[7.0]
  def change
    add_column :fotos, :titulo, :string
  end
end
