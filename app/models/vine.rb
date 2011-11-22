class Vine
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  
  # relations
  belongs_to :user
  has_many :photos
  
  # default_scope desc(:created_at)
end
