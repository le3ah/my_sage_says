require 'rails_helper'

describe AdviceService do
  it "can query the api & return advice" do
    service = AdviceService.new
    query = "snow"

    result = service.slip_query(query)

    expect(result["total_results"]).to eq("1")
    expect(result["slips"][0]["advice"]).to eq("Don't eat non-snow-coloured snow.")
  end
end
