class EntriesController < ApplicationController

  
  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(params["entry"])
    
    @entry["title"] = params["title"]
    @entry["desccription"] = params["description"]
    # how do we do timestamps for posted on?
    @entry["posted on"] = params["posted on"]
    # 
    # def show
    #   @contact = Contact.find_by({"id" => params["id"]})
    #   @company = Company.find_by({"id" => @contact["company_id"]})
    #   # render contacts/show view with details about Contact
    # end
    
    place_name = params["place name"]
    actual_place = Entry.find_by({"name" => place_name})
    
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/entries"
  end

end
