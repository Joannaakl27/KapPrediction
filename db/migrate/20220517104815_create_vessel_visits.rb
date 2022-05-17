class CreateVesselVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :vessel_visits do |t|
      t.string :voyage_number
      t.string :service_id
      t.string :vessel_id
      t.float :vessel_length
      t.integer :total_container_moves
      t.float :discharge_container_move_ratio
      t.float :crane_intensity
      t.float :berth_occupancy
      t.float :yard_occupancy
      t.float :estimated_cargo_operating_time

      t.timestamps
    end
  end
end
