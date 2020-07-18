require 'rails_helper'

RSpec.describe "TicketSessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/ticket_sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

end
