require 'rails_helper'

RSpec.describe "CasesControllers", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response.body).to eq('{"challenge":"Backend Challenge - Covid Daily Cases"}')
      expect(response.status).to eq(200)
    end
  end

  describe "GET /cases/:getdate/count" do
    it "check date" do
      get "/cases/2020-10/count"
      expect(response.body).to eq('{"invalid":"Date format expected is: yyyy-mm-dd"}')
      expect(response.status).to eq(200)
    end
  end

  describe "GET /cases/:getdate/cumulative" do
    it "check date" do
      get "/cases/2020-10-10/cumulative"
      expect(response.body).to eq('{"invalid":"Date format expected is: yyyy-mm-dd"}')
      puts response.body
      expect(response.status).to eq(200)
    end
  end
end
