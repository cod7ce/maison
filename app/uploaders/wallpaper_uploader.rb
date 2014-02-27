# encoding: utf-8

class WallpaperUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Allow image file extensions
  def extension_white_list
    %w(jpg jpeg gif png)
  end

   # Override the filename of the uploaded files:
  def filename
    "wallpaper.#{file.extension}" if file
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [610, 400]
  end
end
