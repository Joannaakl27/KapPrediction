require 'json'
require 'rest-client'

class VesselVisitsController < ApplicationController
  def index
    @vessel_visits = VesselVisit.all
  end

  def new
    @vessel_visit = VesselVisit.new # needed to instantiate the form_for
  end

  def create
    @vessel_visit = VesselVisit.create(vessel_visit_params)
    data = {
      "Inputs": {
        "data":
          [
            {
              "VesselServiceID": "#{vessel_visit_params[:service_id]}",
              "CraneIntensity": "#{vessel_visit_params[:crane_intensity]}",
              "VesselLength": "#{vessel_visit_params[:crane_intensity]}",
              "TotalContainerMoveCount": "#{vessel_visit_params[:total_container_moves]}",
              "DischargeContainerMoveRatio": "#{vessel_visit_params[:discharge_container_move_ratio]}",
              "BerthOccupancy": "#{vessel_visit_params[:berth_occupancy]}",
              "YardOccupancy": "#{vessel_visit_params[:yard_occupancy]}"
            },
          ]
      },
      "GlobalParameters": {
      }
    }
    body = data.to_json
    url = 'http://18af3875-d046-4cb4-a382-66f81410b067.westeurope.azurecontainer.io/score'
    api_key = 'bh8RMugiBkdfXtbhd2RjdPKcI564ynzc'
    headers = { 'Content-Type': 'application/json', 'Authorization': ( 'Bearer' + api_key ) }
    response = RestClient::Request.execute(method: :post, url: url, payload: body, headers: headers)
    raise
    @vessel_visit.estimated_cargo_operating_time = response['Results'].first
    @vessel_visit.save
    redirect_to vessel_visits_path
  end

  def edit
    @vessel_visit = VesselVisit.find(params[:id])
  end

  def update
    @vessel_visit = VesselVisit.find(params[:id])
    @vessel_visit = VesselVisit.update(vessel_visit_params)
    data = {
      "Inputs": {
        "data":
          [
            {
              "VesselServiceID": "#{vessel_visit_params[:service_id]}",
              "CraneIntensity": "#{vessel_visit_params[:crane_intensity]}",
              "VesselLength": "#{vessel_visit_params[:crane_intensity]}",
              "TotalContainerMoveCount": "#{vessel_visit_params[:total_container_moves]}",
              "DischargeContainerMoveRatio": "#{vessel_visit_params[:discharge_container_move_ratio]}",
              "BerthOccupancy": "#{vessel_visit_params[:berth_occupancy]}",
              "YardOccupancy": "#{vessel_visit_params[:yard_occupancy]}"
            },
          ]
      },
      "GlobalParameters": {
      }
    }
    body = data.to_json
    url = 'http://18af3875-d046-4cb4-a382-66f81410b067.westeurope.azurecontainer.io/score'
    api_key = 'bh8RMugiBkdfXtbhd2RjdPKcI564ynzc'
    headers = { 'Content-Type': 'application/json', 'Authorization': ( 'Bearer' + api_key ) }
    response = RestClient::Request.execute(method: :post, url: url, payload: body, headers: headers)
    @vessel_visit.estimated_cargo_operating_time = response['Results'].first
    @vessel_visit.save
    redirect_to vessel_visits_path
  end

  def destroy
    @vessel_visit = VesselVisit.find(params[:id])
    @vessel_visit.destroy
  end

  private

  def vessel_visit_params
    params.require(:vessel_visit).permit(:service_id, :vessel_id, :vessel_length, :crane_intensity, :total_container_moves, :discharge_container_move_ratio, :berth_occupancy, :yard_occupancy)
  end
end
