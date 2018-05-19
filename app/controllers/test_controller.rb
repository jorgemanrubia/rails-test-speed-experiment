class TestController < ApplicationController
  def show
    @label = params[:label]
  end
end
