class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def new
    @office = Office.new
    authorize @office
  end

  def create
  end

  def index
    @offices = policy_scope(Office)
    # authorize @offices
  end

  def show

  end
end
