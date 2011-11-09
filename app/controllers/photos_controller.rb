class PhotosController < ApplicationController
  def create
    photo = current_user.photos.build(
      vine_id: params[:vine_id],
      username: current_user.username,
      image: params[:Filedata]
    )
    if photo.save
      photo.vine.update_attribute(:cover, photo.image.url(:a))
      render :json => { :id => photo.id, :url => photo.image.url(:b), :thumb => photo.image.url(:a) }
    end
  end
end
