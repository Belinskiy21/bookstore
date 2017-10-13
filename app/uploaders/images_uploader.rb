class ImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  #storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  version :thumb do
    process resize_to_limit: [160, 170]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
