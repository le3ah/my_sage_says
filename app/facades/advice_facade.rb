class AdviceFacade

  def query_advice(params)
    advice = AdviceService.new.slip_query(params["recent_dream"])
    if advice[:slips]
      advice[:slips].map do |slip|
        slip[:advice]
      end
    else
      advice[:message][:text]
    end
  end

end
