class GraphqlsController < ApplicationController
  before_action :authenticate_by_api_token!

  def create
    render json: {success: true}
  end
end