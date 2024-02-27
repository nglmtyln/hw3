class EntriesController < ApplicationController

  
  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]})
  end

  def new    
    @entry = Entry.new
    # assign relationship 
    @entry["place_id"] = params["place_id"]
  end
  
  def create
    @entry = Entry.new

    
    @entry["title"] = params["title"]
    @entry["desccription"] = params["description"]
    @entry["posted on"] = params["posted on"]

    # assign relationship
    @entry["place_id"] = params["place_id"]
   
    @entry.save


    redirect_to "/places/#{@entry["place_id"]}"
  end

end
