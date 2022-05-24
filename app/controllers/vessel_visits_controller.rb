require 'json'
require 'rest-client'

class VesselVisitsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "vessel_visits.voyage_number ILIKE :query"
      @vessel_visits = VesselVisit.where(sql_query, query: "%#{params[:query]}%")
    else
      @vessel_visits = VesselVisit.all
    end
  end

  def new
    @vessel_visit = VesselVisit.new # needed to instantiate the form_for
  end

  def create
    data = {
      "Inputs": {
        "data":
          [
            {
              "VesselVisit_HK": "example_value",
              "Vessel_HK": "example_value",
              "VesselService_HK": "example_value",
              "ShippingLine_HK": "example_value",
              "TerminalID": "example_value",
              "VesselVisitID": "example_value",
              "VesselClassificationID": "example_value",
              "VesselName": "example_value",
              "VesselLength": vessel_visit_params[:vessel_length].to_f,
              "VesselWidth": "example_value",
              "VesselServiceID": vessel_visit_params[:service_id],
              "VesselServiceName": "example_value",
              "ShippingLineID": "example_value",
              "ShippingLineName": "example_value",
              "ATA": "2000-01-01T00:00:00.000Z",
              "ATS": "2000-01-01T00:00:00.000Z",
              "ATC": "2000-01-01T00:00:00.000Z",
              "ATD": "2000-01-01T00:00:00.000Z",
              "ATSYear": 0,
              "ATSMonth": 0,
              "ATSDayOfWeek": 0,
              "BerthHours": 0.0,
              "IdleTimeBeforeOps": 0.0,
              "IdleTimeAfterOps": 0.0,
              "CraneIntensity": vessel_visit_params[:crane_intensity].to_f,
              "TotalContainerMoveCount": vessel_visit_params[:total_container_moves].to_i,
              "DischargeContainerMoveCount": 0,
              "LoadContainerMoveCount": 0,
              "DischargeContainerMoveRatio": vessel_visit_params[:discharge_container_move_ratio].to_f,
              "BerthOccupancy": vessel_visit_params[:berth_occupancy].to_f,
              "YardOccupancy": vessel_visit_params[:yard_occupancy].to_f,
              "CallSize": "example_value"
            }
          ]
      }
    }
    body = data.to_json
    url = 'http://18af3875-d046-4cb4-a382-66f81410b067.westeurope.azurecontainer.io/score'
    api_key = 'bh8RMugiBkdfXtbhd2RjdPKcI564ynzc'
    headers = { 'Content-Type': 'application/json', 'Authorization': ('Bearer '+api_key) }
    response = RestClient::Request.execute(method: :post, url: url, payload: body, headers: headers)
    result = JSON.parse(response.body)
    parameters = vessel_visit_params.merge({"estimated_cargo_operating_time": result["Results"].first.round(2)})
    @vessel_visit = VesselVisit.create(parameters)
    @vessel_visit.save
    redirect_to vessel_visits_path
  end

  def edit
    @vessel_visit = VesselVisit.find(params[:id])
  end

  def update
    @vessel_visit = VesselVisit.find(params[:id])
    data = {
      "Inputs": {
        "data":
          [
            {
              "VesselVisit_HK": "example_value",
              "Vessel_HK": "example_value",
              "VesselService_HK": "example_value",
              "ShippingLine_HK": "example_value",
              "TerminalID": "example_value",
              "VesselVisitID": "example_value",
              "VesselClassificationID": "example_value",
              "VesselName": "example_value",
              "VesselLength": vessel_visit_params[:vessel_length].to_f,
              "VesselWidth": "example_value",
              "VesselServiceID": vessel_visit_params[:service_id],
              "VesselServiceName": "example_value",
              "ShippingLineID": "example_value",
              "ShippingLineName": "example_value",
              "ATA": "2000-01-01T00:00:00.000Z",
              "ATS": "2000-01-01T00:00:00.000Z",
              "ATC": "2000-01-01T00:00:00.000Z",
              "ATD": "2000-01-01T00:00:00.000Z",
              "ATSYear": 0,
              "ATSMonth": 0,
              "ATSDayOfWeek": 0,
              "BerthHours": 0.0,
              "IdleTimeBeforeOps": 0.0,
              "IdleTimeAfterOps": 0.0,
              "CraneIntensity": vessel_visit_params[:crane_intensity].to_f,
              "TotalContainerMoveCount": vessel_visit_params[:total_container_moves].to_i,
              "DischargeContainerMoveCount": 0,
              "LoadContainerMoveCount": 0,
              "DischargeContainerMoveRatio": vessel_visit_params[:discharge_container_move_ratio].to_f,
              "BerthOccupancy": vessel_visit_params[:berth_occupancy].to_f,
              "YardOccupancy": vessel_visit_params[:yard_occupancy].to_f,
              "CallSize": "example_value"
            }
          ]
      }
    }
    body = data.to_json
    url = 'http://18af3875-d046-4cb4-a382-66f81410b067.westeurope.azurecontainer.io/score'
    api_key = 'bh8RMugiBkdfXtbhd2RjdPKcI564ynzc'
    headers = { 'Content-Type': 'application/json', 'Authorization': ('Bearer '+api_key) }
    response = RestClient::Request.execute(method: :post, url: url, payload: body, headers: headers)
    result = JSON.parse(response.body)
    parameters = vessel_visit_params.merge({"estimated_cargo_operating_time": result["Results"].first.round(2)})
    @vessel_visit = VesselVisit.update(parameters)
    redirect_to vessel_visits_path
  end

  def destroy
    @vessel_visit = VesselVisit.find(params[:id])
    @vessel_visit.destroy
    redirect_to vessel_visits_path
  end

  private

  def vessel_visit_params
    params.require(:vessel_visit).permit(:voyage_number, :service_id, :vessel_id, :vessel_length, :crane_intensity, :total_container_moves, :discharge_container_move_ratio, :berth_occupancy, :yard_occupancy)
  end
end
