class PhotosController < ApplicationController
  def create
    params[:Filedata].content_type = MIME::Types.type_for(params[:Filedata].original_filename).to_s
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
