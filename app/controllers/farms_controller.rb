class FarmsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_farm, only: [:show, :edit]
  
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
    authorize @farm
  end

  def show
    # authorize @farm
    @markers = [@farm].map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude
      }
    end
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.user = current_user
    if @farm.save
      redirect_to farms_path(@farm)
    else
      render :new
    end
    authorize @farm
  end

   def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    @farm.update(params[:restaurant])
    if @farm.save
      redirect_to farm_path
    end
  end

  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy
    redirect_to farm_path
  end

  private

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name, :form_of_rearing, :country, :laying_farm, :address, :latitude, :longitude, :user_id, :area, :chicken_count, :website_url)
  end
end

# create_table "farms", force: :cascade do |t|
#     t.string "name"
#     t.integer "form_of_rearing"
#     t.string "country"
#     t.string "laying_farm"
#     t.string "address"
#     t.float "latitude"
#     t.float "longitude"
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.float "area"
#     t.integer "chicken_count"
#     t.string "website_url"
#     t.index ["user_id"], name: "index_farms_on_user_id"
#   end


