class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user
    @office.save
  end

  def index
    @offices = Office.all
  end

  def show
  end

  def office_params
    params.require(:office).permit(:name, :price, :workspace_type, :number_of_seats, :coffee, :wifi, :lockers, :kitchen, :location, :coordinates)
  end
end
