class VinesController < ApplicationController
  def index
    @vines = Vine.all

    respond_to do |format|
      format.html
      format.json { render json: @vines }
    end
  end
  
  def create
    vine = current_user.vines.build(params[:vine])
    if vine.save
      render json: vine, status: :ok
    else
      render json: vine.errors, status: :unprocessable_entity
    end
  end
  
  def update
    vine = Vine.find(params[:id])
    if vine.update_attributes(params[:vine])
      render json: vine, status: :ok
    else
      render json: vine.errors, status: :unprocessable_entity
    end
  end
  
  def photos
    vine = Vine.find params[:id]
    photos = vine.photos.collect{|photo| {username: photo.username, url: photo.image.url(:b)}}
    render json: photos, status: :ok
  end
end
