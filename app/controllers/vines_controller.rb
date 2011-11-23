class VinesController < ApplicationController
  respond_to :html, :json
  
  def index
    respond_with vines
  end
  
  def create
    vine = current_user.vines.build(name: params[:vine][:name])
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
    photos = vine.photos.collect{|photo| {username: photo.username, url: photo.image.url(:b), id: photo.id}}
    render json: photos, status: :ok
  end
  
  protected
  
    def vines
      @vines ||= Vine.all
    end
end
