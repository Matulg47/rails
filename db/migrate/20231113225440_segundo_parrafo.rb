class SegundoParrafo < ActiveRecord::Migration[7.0]
  def change
    add_column :fotos, :descrip2, :string
  end
end
