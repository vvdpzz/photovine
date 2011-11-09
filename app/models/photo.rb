class Photo
  include Mongoid::Document
  field :username
  field :description
  field :image
  field :salt
  
  # relations
  belongs_to :user
  belongs_to :vine
  
  mount_uploader :image, PhotoUploader
end
