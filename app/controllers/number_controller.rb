class NumberController < ApplicationController
  def show
    @advice_by_number = AdviceFacade.new.advice_by_number(params)
  end
end
