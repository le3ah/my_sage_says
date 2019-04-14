class AdviceService
  def slip_query(query)
    Rails.cache.fetch("advice_query_#{query}", expires_in: 1.day) do
      response = conn.get("/advice/search/#{query}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def random_advice
    response = conn.get("/advice")
    JSON.parse(response.body, symbolize_names: true)
  end

  def slip_id(id)
    Rails.cache.fetch("advice_slip_id_#{id}", expires_in: 1.day) do
      response = conn.get("/advice/#{id}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  private

  def conn
    Faraday.new(url: "https://api.adviceslip.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
