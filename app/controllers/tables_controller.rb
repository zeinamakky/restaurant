class TablesController < ApplicationController
  def index
    @tables = Table.all

  end

  def new
    @tables = Table.all
  end

  def create
    @table = Table.create(
      seats: params[:seats]
    )
    redirect_to "/tables/new"
  end
end
