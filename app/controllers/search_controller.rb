class SearchController < ApplicationController
  def index
    @advice_by_query = AdviceFacade.new.query_advice(params)
  end
end
