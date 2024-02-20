class EntriesController < ApplicationController

  
  def new
    # adding this because I think I need to, but not quite the same syntax
    @place = Place.find_by(params[:place_id])
    
    @entry = Entry.new
  end
  
  def create
    # adding this because I think I need to, but not quite the same syntax
    @place = Place.find_by(params[:place_id])
    
    # @entry = Entry.new(params["entry"])

    # adding because 
    @entry = @place.entries.build(entry_params)
    
    @entry["title"] = params["title"]
    @entry["desccription"] = params["description"]
    # how do we do timestamps for posted on?
    @entry["posted on"] = params["posted on"]
   
    place_name = params["place name"]
    actual_place = Entry.find_by({"name" => place_name})
    
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/entries"
  end

end
