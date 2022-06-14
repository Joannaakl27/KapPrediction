class AddEtaToVesselVisit < ActiveRecord::Migration[6.1]
  def change
    add_column :vessel_visits, :eta, :datetime
    add_column :vessel_visits, :etc, :datetime
  end
end
