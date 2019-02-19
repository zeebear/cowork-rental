class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def new
    @office = Office.new
    authorize @office
  end

  def create
    @office = Office.new(office_params)
    authorize @office
    @office.user = current_user
    @office.save
  end

  def index
    @offices = policy_scope(Office).order(created_at: :desc)
  end

  def show
  end

  def office_params
    params.require(:office).permit(:name, :price, :workspace_type, :number_of_seats, :coffee, :wifi, :lockers, :kitchen, :location, :coordinates)
  end
end
