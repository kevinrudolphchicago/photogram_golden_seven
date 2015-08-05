class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find(params["id"])

  end

  def new_form

  end


  def create_row
    p = Photo.new
    # p = Photo.new # for initializing and creating a new record
    p.caption = params["photo_caption"]
    p.source = params["photo_image_url"]
    p.save
    redirect_to("http://localhost:3000/photos")
  end


  def destroy
    p = Photo.find(params["id"])
    p.destroy
    p.save
    redirect_to("http://localhost:3000/photos")
  end


  def update_row
    # raise params.inspect
    p = Photo.find(params["id"])
    # I don't think we want to destroy it, just edit it
    # p.destroy
    # p = Photo.find(params["id"])
    p.caption = params["the_caption"]
    p.source = params["the_source"]
    p.save


        redirect_to("http://localhost:3000/photos/#{p.id}")

  end



  def edit_form
    @photo = Photo.find(params["id"])

  end

end

