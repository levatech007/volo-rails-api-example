class DocumentationController < ApplicationController

  def index
    render json: { info: "Welcome to VOLO Rails API" }
  end

end
