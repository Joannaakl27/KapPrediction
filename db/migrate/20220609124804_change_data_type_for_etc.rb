class ChangeDataTypeForEtc < ActiveRecord::Migration[6.1]
  def change
    change_column :vessel_visits, :etc, :string
  end
end
