CarrierWave.configure do |config|
  config.grid_fs_connection = Mongoid.database
  config.grid_fs_access_url = "/statics/images"
end