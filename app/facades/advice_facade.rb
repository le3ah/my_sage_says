class AdviceFacade

  def query_advice(params)
    advice = AdviceService.new.slip_query(params["recent_dream"])
      advice[:slips].map do |slip|
        slip[:advice]
    end
  end

end
