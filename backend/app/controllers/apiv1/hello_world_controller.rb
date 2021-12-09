class Apiv1::HelloWorldController < ApplicationController
  def index
    render json: 'hello world'
  end
end
