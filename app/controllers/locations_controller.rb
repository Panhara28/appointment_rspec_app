class LocationsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
      flash[:notice] = "Location was successfully created"
    else
      render :new
    end
  end

  def edit

  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location)
      flash[:notice] = "Location was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
    flash[:notice] = "Location was successfully deleted..."
  end

  private
    def location_params
      params.require(:location).permit(:nickname, :city, :street_address, :state, :zipcode, :business_name )
    end
end
