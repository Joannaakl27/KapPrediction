class ChangeDataTypeForEta < ActiveRecord::Migration[6.1]
  def change
    change_column :vessel_visits, :eta, :string
  end
end
