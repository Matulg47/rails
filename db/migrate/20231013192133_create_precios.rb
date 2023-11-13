class CreatePrecios < ActiveRecord::Migration[7.0]
  def change
    create_table :precios do |t|
      t.string :nombre
      t.integer :precio
      t.timestamps
    end
  end
end
