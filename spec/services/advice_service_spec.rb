require 'rails_helper'

describe AdviceService do
  it "can query the api & return advice" do
    service = AdviceService.new
    query = "snow"

    result = service.slip_query(query)

    expect(result[:total_results]).to eq("1")
    expect(result[:slips][0][:advice]).to eq("Don't eat non-snow-coloured snow.")
  end
  it "returns a notice if no query matches" do
    service = AdviceService.new
    query = "jobs"

    result = service.slip_query(query)

    expect(result[:message][:type]).to eq("notice")
    expect(result[:message][:text]).to eq("No advice slips found matching that search term.")
  end
  it "can return random advice" do
    service = AdviceService.new

    result = service.random_advice

    expect(result.count).to eq(1)
    expect(result[:slip]).to have_key(:advice)
    expect(result[:slip]).to have_key(:slip_id)
  end
end
