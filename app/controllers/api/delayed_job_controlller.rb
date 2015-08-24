class Api::DelayedJobController < ApplicationController

  respond_to :json

  def index
    respond_with DelayedJob.all
  end

end
