class PodsController < ApplicationController

  def index
    @pods = Pod.all
  end

  def show
    @pod = Pod.find(params[:id])
  end

end
