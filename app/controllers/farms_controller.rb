require 'uri'
require 'net/http'
require 'nokogiri'
# require 'pry-byebug'

class FarmsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:query].present?
    #   @farms = Farm.where("name ILIKE @@ :query OR syllabus ILIKE :query", query: "%{params[:query]}%")
    # else
    #   @farms = Farm.all
    # end
    if [:form_of_rearing, :country, :laying_farm].all? { |key| params[key] }
      @farm = Farm.find_by(laying_farm: params[:laying_farm])
      if @farm
        redirect_to farm_path(@farm.id)
      else
        @farm = get_farm
      end

    elsif params[:farm][":form_of_rearing"][","].present?
      @farms = Farm.where(form_of_rearing: params[:farm][":form_of_rearing"][","])
    else
      @farms = Farm.all
    end
  end

  def new
    @farm = Farm.new
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
    @farm = Farm.find(params[:id])
    # @farm.update params[:farm]
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

  def kat_scraper
    url = 'https://www.was-steht-auf-dem-ei.de/index.php'
    uri = URI(url)

    form_data = {
      system: params[:form_of_rearing],
      country:  params[:country],
      company:  params[:laying_farm],
      securityToken:  '28ce931bf4fb5a63f7f0ec709e2c552f'
    }

    uri.query = URI.encode_www_form(form_data)
    res = Net::HTTP.get_response(uri)

    html_doc = Nokogiri::HTML(res.body)
    html_doc.search('#coderesult > div.data').text.strip
  end

  def interpreter(text, first, last)
    regex = /#{first}(.*?)#{last}/
    text.slice(regex, 1)
  end

  def get_farm
    name = interpreter(kat_scraper, "Name: ", "PLZ: ")
    postcode = interpreter(kat_scraper, "PLZ: ", "Ort: ")
    city = interpreter(kat_scraper, "Ort: ", "$")
    address = postcode + city + " " + params[:country]

    @farm = Farm.new
    @farm.form_of_rearing = params[:form_of_rearing].to_s
    @farm.country = params[:country]
    @farm.laying_farm = params[:laying_farm]
    @farm.name = name
    @farm.address = address
    @farm.user_id = 1

    raise
    if @farm.save
      raise
      redirect_to farm_path(@farm.id)
    else
      redirect_to root_path
    end
  end

  

end
