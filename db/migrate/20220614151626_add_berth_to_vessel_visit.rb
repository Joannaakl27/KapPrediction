class AddBerthToVesselVisit < ActiveRecord::Migration[6.1]
  def change
    add_column :vessel_visits, :berth, :integer
  end
end
