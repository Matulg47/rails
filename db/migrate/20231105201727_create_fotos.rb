class CreateFotos < ActiveRecord::Migration[7.0]
  def change
    create_table :fotos do |t|
      t.string :nombre
      t.timestamps
    end
  end
end
