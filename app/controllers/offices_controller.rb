class OfficesController < ApplicationController
  def new
  end

  def create
  end

  def index
    @offices = Office.all
  end

  def show
  end
end
