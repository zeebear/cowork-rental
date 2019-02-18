class Owner::OfficesController < ApplicationController
  before_action :set_office, only: %i[show edit]

  def index
    @offices = current_user.owned_offices
  end

  def show
  end

  def edit
  end

  def update
    @office.update(office_params)
  end

  def delete
    @office.destroy
    redirect_to offices_path
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end

  def office_params
    params.require(:office).permit(:name, :number_of_seats, :type, :price)
  end
end
