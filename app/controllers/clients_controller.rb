class ClientsController < ApplicationController
  def create
    @client = Client.new()
  end
end
