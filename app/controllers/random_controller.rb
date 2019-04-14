class RandomController < ApplicationController
  def show
    @random_advice = AdviceFacade.new.random_generator
  end
end
