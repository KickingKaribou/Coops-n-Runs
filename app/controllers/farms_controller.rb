class FarmsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:query].present?
    #   @farms = Farm.where("name ILIKE @@ :query OR syllabus ILIKE :query", query: "%{params[:query]}%")
    # else
    #   @farms = Farm.all
    # end
    if params[:laying_farm].present?
      @farm = Farm.find_by(laying_farm: params[:laying_farm])
      redirect_to farm_path(@farm.id)
    elsif params[:form_of_rearing].present?
      @farms = Farm.where(form_of_rearing: params[:form_of_rearing])
    else
      @farms = Farm.all
    end
  end

  def new
    @farm = Farm.new
  end

  def show
    # authorize @farm
    if @farm
      @markers = [@farm].map do |farm|
        {
          lat: farm.latitude,
          lng: farm.longitude
        }
      end
    else
      #HTTP request
      #result
      #farm.create(result)
    end
    # @markers = [@farm].map do |farm|
    #   {
    #     lat: farm.latitude,
    #     lng: farm.longitude
    #   }
    # end
  end

  def create
    @farm = Farm.new(farm_params)
    address = params[:farm][:street] + " " + params[:farm][:postcode] + " " + params[:farm][:city] + " " + params[:farm][:country]
    @farm.address = address
    @farm.user = current_user
    if @farm.save
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end

  def edit
    # @farm = Farm.find(params[:id])
  end

  def update
    # @farm = Farm.find(params[:id])
    @farm.update params[:restaurant]
    redirect_to farm_path(@farm) if @farm.save
  end

  def destroy
    # @farm = Farm.find(params[:id])
    @farm.destroy
    redirect_to dashboard_index_path
  end

  private

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name, :form_of_rearing, :country, :laying_farm, :address, :latitude, :longitude, :user_id, :area, :chicken_count, :website_url)
  end
end



