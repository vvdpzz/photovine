# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  storage :grid_fs
  
  def store_dir
  end
  
  version :a do
    process :resize_to_limit => [180, 270]
  end
  
  version :b do
    process :resize_to_limit => [720, 540]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
    model.salt ||= SecureRandom.hex
    "#{model.salt}#{File.extname(original_filename).downcase}" if original_filename
  end
end
