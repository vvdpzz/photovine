class Vine
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :cover
  
  # relations
  belongs_to :user
  has_many :photos
end
