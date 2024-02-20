class PlacesController < ApplicationController

  def index
    @places = Place.all
  end
 
  def show
    @place = Place.find_by({"name" => params["name"]})
  end

  # renders places/new with the new Place form
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new
    #assign user-entered form data to Place's columns
    @place["name"] = params["name"]
    @place.save
    
    redirect_to "/places"
  end


end
