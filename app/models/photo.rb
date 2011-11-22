class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username
  field :description
  field :image
  field :salt
  
  # relations
  belongs_to :user
  belongs_to :vine
  
  default_scope desc(:created_at)
  
  mount_uploader :image, PhotoUploader
end
