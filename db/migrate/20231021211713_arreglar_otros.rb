class ArreglarOtros < ActiveRecord::Migration[7.0]
  def change
    add_column :otros, :cantidad, :integer
  end
end
