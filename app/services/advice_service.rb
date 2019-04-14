class AdviceService
  def slip_query(query)
    response = conn.get("/advice/search/#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def random_advice
    response = conn.get("/advice")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.adviceslip.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
