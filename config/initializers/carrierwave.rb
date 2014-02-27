require 'carrierwave/mongoid'

CarrierWave.configure do |config|
  # config.storage :grid_fs
  # config.grid_fs_access_url = "/uploads"
  config.storage :file
end
