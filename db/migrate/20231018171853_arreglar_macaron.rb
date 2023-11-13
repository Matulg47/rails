class ArreglarMacaron < ActiveRecord::Migration[7.0]
  def change
    add_column :macaroons, :cantidad, :integer
  end
end
