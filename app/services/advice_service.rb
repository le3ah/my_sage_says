class AdviceService
  def slip_query(query)
    response = conn.get("/advice/search/#{query}")
    JSON.parse(response.body)
  end

  private

  def conn
    Faraday.new(url: "https://api.adviceslip.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
