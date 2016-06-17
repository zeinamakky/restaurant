require "rails_helper"

RSpec.describe ReservationsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "assigns @reservations" do
      reservation = Reservation.create
      get :index
      expect(assigns(:reservations)).to eq([reservation])
    end

  end
  describe "#new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  
end